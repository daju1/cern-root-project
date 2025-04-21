# https://github.com/root-project/root-docker/blob/6.32.02-ubuntu22.04/ubuntu2204/Dockerfile
FROM rootproject/root:6.32.02-ubuntu22.04

ARG USER_NAME
ARG GROUP_NAME
ARG USER_ID
ARG GROUP_ID

ARG DEBIAN_FRONTEND=noninteractive

# Configure a 'docker' sudo user without password
RUN apt-get update && apt-get -y install sudo adduser
RUN addgroup --gid ${GROUP_ID} ${GROUP_NAME}
RUN adduser --disabled-password --gecos '' --uid ${USER_ID} --gid ${GROUP_ID} ${USER_NAME}
RUN usermod -aG sudo ${USER_NAME}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install build-essential package (for cross compilation)
RUN apt-get update
RUN apt-get -y install build-essential wget git cmake

# Install vim, nano
RUN apt-get -y install vim nano

RUN apt-get -y install openssl ca-certificates
RUN apt-get -y install python3-pip
RUN pip install jupyter metakernel numpy matplotlib

RUN apt-get -y install net-tools

# RUN source root/bin/thisroot.sh # also available: thisroot.{csh,fish,bat,ps1}

USER ${USER_NAME}

CMD ["/bin/bash"]

# CMD ["root", "--notebook"]
