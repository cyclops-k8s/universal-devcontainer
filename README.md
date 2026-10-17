<!-- markdownlint-disable-next-line first-line-heading -->
[![Build Container](https://github.com/cyclops-k8s/universal-devcontainer/actions/workflows/build-container.yml/badge.svg)](https://github.com/cyclops-k8s/universal-devcontainer/actions/workflows/build-container.yml) 

# Intro

These are the source files for the [universal-devcontainer](https://github.com/cyclops-k8s/universal-devcontainer) Visual Studio Code [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers).

The image is hosted on [Quay](https://quay.io/repository/cyclops-k8s/universal-devcontainer).

The image is intended to be used by the Visual Studio Code [Dev Container extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

This image is based on the cyclops-k8s/ansible-kubernetes-devcontainer image which is based on Microsoft's base development container image. This image tries to incorporate the packages that are in Microsoft's universal development container image, but on a newer Ubuntu release.

* [Microsoft Universal Development Container Image package list](https://github.com/devcontainers/images/blob/main/src/typescript-node/manifest.json)
* [Microsoft Universal Development Container Image](https://mcr.microsoft.com/en-us/artifact/mar/devcontainers/universal/tags)
* [Cyclops K8s Ansible Kubernetes Devcontainer](https://github.com/cyclops-k8s/ansible-kubernetes-devcontainer)

# How To Use

Refer to the code example in the [.devcontainer directory in the ansible-kubernetes git repo](https://github.com/cyclops-k8s/ansible-kubernetes/tree/main/.devcontainer) for a full example.
