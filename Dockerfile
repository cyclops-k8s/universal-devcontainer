FROM docker.io/library/node:latest AS node

FROM docker.io/aquasec/trivy:latest AS trivy
RUN trivy plugin install github.com/fatihtokus/scan2html

FROM quay.io/cyclops-k8s/ansible-kubernetes-devcontainer:latest

USER root

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get dist-upgrade --auto-remove --purge --yes \
    && apt-get install --no-install-recommends --yes \
            cmake \
            cppcheck \
            valgrind \
            lldb \
            llvm \
            gdb \
            clang \
            # Python
            python3-dev \
            xtail \
            software-properties-common \
            python3-full \
            pylint \
            flake8 \
            python3-autopep8 \
            black \
            yapf3 \
            mypy \
            pydocstyle \
            bandit \
            virtualenv \
            # Ruby
            rake \
            ruby \
            ruby-dev \
            jekyll \
            # Go
            golang \
            # Build tools
            buildah \
            skopeo \
    && apt-get distclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /entrypoint

# node files
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/include/node /usr/local/include/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/share/doc/node /usr/local/share/doc/node
COPY --from=node /usr/local/share/man/man1/node.1 /usr/local/share/man/man1/

# node - partially based on https://github.com/nodejs/docker-node/blob/main/26/trixie/Dockerfile
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx \
    && npm config set allow-scripts=yarn \
    && npm config set allow-scripts=esbuild \
    && npm install --global eslint typescript yarn \
    # tests to ensure everything runs
    && eslint --version \
    && node --version \
    && nodejs --version \
    && npm --version \
    && npx --version \
    && yarn --version \
    # cleanup
    && rm -rf /root/.npm /tmp/*compile-cache*

# trivy
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy
COPY --from=trivy /contrib/*.tpl /contrib/
COPY --from=trivy --chown=vscode:vscode /root/.trivy /home/vscode/.trivy

USER vscode

CMD ["sleep", "infinity"]
ENTRYPOINT [""]
