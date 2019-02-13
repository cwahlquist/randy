#!/bin/bash

printf "\nWhat is the service name (lowercase)?\n"
read serviceName

printf "\nWhat is the repo path?\n"
read repoPath

printf "\n"

cp -r ./* $repoPath

mv $repoPath/charts/randy $repoPath/charts/$serviceName
find $repoPath -type f -exec \
    sed -i "s/randy/$serviceName/g" {} +
find $repoPath -type f -exec \
    sed -i "s/randy/$serviceName/g" {} +
serviceName="$(tr '[:lower:]' '[:upper:]' <<< ${serviceName:0:1})${serviceName:1}"
find $repoPath -type f -exec \
    sed -i "s/Randy/$serviceName/g" {} +
