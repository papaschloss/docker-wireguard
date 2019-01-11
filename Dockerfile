FROM ubuntu:18.04

RUN apt update -y && \
    apt install -y software-properties-common iptables curl iproute2 ifupdown iputils-ping net-tools && \
    add-apt-repository --yes ppa:wireguard/wireguard && \
    apt install -y wireguard-dkms wireguard-tools

COPY scripts /scripts
RUN chmod +x /scripts/run.sh
ENTRYPOINT ["/scripts/run.sh"]
CMD []
