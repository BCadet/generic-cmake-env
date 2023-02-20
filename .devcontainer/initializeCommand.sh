#!/bin/bash
export localWorkspaceFolder=$1
export localWorkspaceFolderBasename=$2

# rm .devcontainer/.env if it does already exists
[ -e .devcontainer/.env ] && rm .devcontainer/.env

#create venv if not exists
[ -e venv ] && python3 -m venv venv && source ./venv/bin/activate && pyton3 -m pip install git+https://github.com/bcadet/pyHardwareFinder && deactivate

printf "localWorkspaceFolder=${localWorkspaceFolder}\n" >> .devcontainer/.env
printf "localWorkspaceFolderBasename=${localWorkspaceFolderBasename}\n" >> .devcontainer/.env


source ./venv/bin/activate
python3 -m pyHardwareFinder -c ${localWorkspaceFolder}/hardware-setup/generic-cmake-env-hardware1.yml -o .devcontainer/.env -a
deactivate
