# generic-cmake-env

## Motivation

This project aim to provide a developper friendly environment for all embedded developpement.
It is based on CMake an take advantages of VScode plugins and Docker to provide all in one "IDE like" experience for any manufacturer dependent IDE.

## Features

- Docker build image
- VScode devcontainer
- a list of recommanded extensions for VSCode
- pre-formated build task and debug launcher
- easy bring-up scripts 

## Planned features

- The docker image is currently based on ubuntu. I plan to generate an alpine version.

## Setup available

### VScode devcontainer

Install the plugin "Remote - Containers" in your VSCode and click on "Reopen in container".
The container will automatically install all the required plugins.

### VSCode local

If you are running on a linux, you can just open your project with vscode and work in it. When VSCode ask you if you want to download recommanded extensions, select yes.

In this mode, you need to manage the dependencies on your computer like `cmake` and `make`.

### headless mode

You can use the script `env-dockerized.bash` to generate the docker image and `env-dockerized.bash make` to build the project in headless mode in a docker container.
You can use the script `env-local.bash` to build your project in headless mode directly on your host.