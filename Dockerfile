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
            rake \
            ruby \
            ruby-dev \
            jekyll \
            golang \
            yarnpkg \
            eslint \
            node-typescript \
            buildah \
            skopeo \
    && apt-get distclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /entrypoint

USER vscode

CMD ["sleep", "infinity"]
ENTRYPOINT [""]
