## Ansible Docker image for configruation management

[![Layers](https://images.microbadger.com/badges/image/aade/ansible-iac.svg)](https://microbadger.com/images/aade/ansible-iac) [![GitHub issues](https://img.shields.io/github/issues/adekoyadapo/iac-docker-image.svg)](https://github.com/adekoyadapo/iac-docker-image) [![Docker Automated build](https://img.shields.io/docker/automated/aade/ansible-iac.svg?maxAge=2592000)](https://hub.docker.com/r/aade/ansible-iac/) [![Docker Pulls](https://img.shields.io/docker/pulls/aade/ansible-iac.svg)](https://hub.docker.com/r/aade/ansible-iac/)

## Description

Deploy ansible docker image for IaC configuration deployments for local virtualization, docker, and config management on notable cloud platforms.

## Build Process
Involves installation of dependencies, python3 and pip

### Environnement variable

| Variable             | Default Value    | Usage                                       |
|----------------------|------------------|---------------------------------------------|
| ANSIBLE_VERSION      | 2.9.4            | For future upgrades to new ansible versions |
| PIP_PACKAGES         | multiple         | install python requirements                 |

### Installed Python Packages

| Package           | Version   |
|-------------------|-----------|
| ansible           | 2.9.4     |
| pyvmoni           | 7.0       | 
| docker            | 4.2.2     | 
| docker-compose    | 1.2.26    | 
| boto3             | 1.14.16   | 
| boto              | 2.49.0    | 
| cryptography      | 2.9.2     | 
| ansible[azure]    |   ---     |
| apache-libcloud   | 3.1.0     |

### Run Quick TEST

```
docker run -it --rm \
  aade/ansible-iac:latest \
  ansible --version
```

### Run Playbook

```
docker run -it --rm \
  -v ${PWD}:/ansible \
  aade/ansible-iac:latest \
  ansible-playbook -i inventory playbook.yml
```
