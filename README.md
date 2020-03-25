## Build Ansible Docker image for configruation management

## Description

Deploy ansible docker image for IaC configuration deployments and changes from redhat UBI image with
a GITLAB ci for building the image and pushing to a namespace in docker.io

## Build Process
Involves installation of dependencies, python3 and pip

## local Deployment
``
docker build -t <image tag> .
``