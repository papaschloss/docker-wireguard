FROM ubuntu:18.04

RUN apt update -y && \
    apt install -y software-properties-common iptables curl iproute2 ifupdown iputils-ping net-tools systemd
    add-apt-repository --yes ppa:wireguard/wireguard && \
    apt install wireguard-dkms wireguard-tools

COPY scripts /scripts

ENTRYPOINT ["/scripts/run.sh"]
CMD []
