FROM registry.access.redhat.com/ubi7/ubi-minimal:7.7-303

MAINTAINER Ade Adekoya <ade.adekoya@telus.com>
LABEL version="2.0"
LABEL description="Ansible in ubi7-min Docker"

ENV ANSIBLE_VERSION=2.9.2

RUN set -xe \
    && echo "****** Install system dependencies ******" \
        && microdnf update \
        && microdnf install --enablerepo=rhel-7-server-rh-common-rpms --enablerepo=rhel-7-server-rh-common-rpms \
           python2 python2-devel openssl-devel openssl openssl-devel openssh  curl git ca-certificates gcc libcurl-devel \
           libxml2-devel libxml2-python vi python-ovirt-engine-sdk4 ovirt-engine-sdk-python libselinux-python \
        && echo "****** Install ansible and python dependencies ******" \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py --insecure && python get-pip.py \
    && python -m pip install --upgrade pip ansible==${ANSIBLE_VERSION} boto3 pyvmomi ovirt-engine-sdk-python selinux \
    \
    && echo "****** Remove unused system librabies ******" \
        && microdnf clean all \
        && rm -rf /var/cache/yum

RUN set -xe \
    && mkdir -p /etc/ansible \
    && echo -e "[local]\nlocalhost ansible_connection=local" > \
        /etc/ansible/hosts

CMD ["ansible", "--version"]
