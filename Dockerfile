From ubuntu:18.04

RUN apt-get update &&\
    apt-get install -y software-properties-common sudo &&\
    add-apt-repository -y ppa:ethereum/ethereum &&\
    apt-get update &&\
    apt-get install -y ethereum solc

ENV USER ethereum
ENV PASSWD ethereum
RUN useradd -m ${USER} &&\
    gpasswd -a ${USER} sudo &&\
    echo "${USER}:${PASSWD}" | chpasswd

COPY entrypoint.sh /entrypoint.sh
COPY Genesis.json /Genesis.json

ENV ChainID 15
ENV DATADIR /home/${USER}/eth_private_net

USER ${USER}
WORKDIR /home/${USER}

CMD ["/entrypoint.sh"]
