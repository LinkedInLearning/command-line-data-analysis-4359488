FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

RUN apt update && apt install -y \
    bc \
    gnuplot \
    lynx \
    openssh-server \
    sqlite3

# gcloud & gsutil
RUN curl -LO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-410.0.0-linux-x86_64.tar.gz
RUN tar xzf google-cloud-cli-410.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh -q

USER vscode

# ssh
RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
RUN cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
RUN echo Host db1 >> ~/.ssh/config
RUN echo '\tHostName localhost' >> ~/.ssh/config

# /usr/games for cowsay
RUN echo 'PATH=${PATH}:/usr/games:/google-cloud-sdk/bin' >> ~/.bashrc
RUN echo "PS1='$ '" >> ~/.bashrc

# start ssh daemon (must be when container runs)
RUN echo "test -f /var/run/sshd.pid || (sudo service ssh start > /dev/null)" >> ~/.bashrc
# trusted host (remove ssh notice)
RUN echo "ssh-keyscan localhost > ~/.ssh/known_hosts 2>/dev/null" >> ~/.bashrc

# TODO: data

WORKDIR /home/vscode
