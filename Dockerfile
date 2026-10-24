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
            # For nodejs
            libatomic1 \
    && apt-get distclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /entrypoint

USER vscode

# Install most recent node version
ENV NVM_DIR="$HOME/.nvm"
RUN curl -q -sI https://github.com/nvm-sh/nvm/releases/latest | \
      grep -i location | \
      grep -oP 'tag/\K[^[:space:]\r\n]+' | \
      xargs -I {} curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/{}/install.sh | \
      bash \
    && source "${NVM_DIR}/nvm.sh" \
    && nvm install --latest-npm \
    && npm config set allow-scripts=yarn --location=user \
    && npm install -g eslint typescript yarn \
    && rm -rf "${HOME}/.nvm/.cache" "${HOME}/.npm" /tmp/*

CMD ["sleep", "infinity"]
ENTRYPOINT [""]
