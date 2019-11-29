#!/bin/bash

set -e

apt update
apt install -y linux-headers-$(uname -r)
apt install -y wireguard

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

interface='wg0'

echo "$(date): Starting Wireguard"
wg-quick up $interface

# Handle shutdown behavior
finish () {
    echo "$(date): Shutting down Wireguard"
    wg-quick down $interface
    exit 0
}

trap finish SIGTERM SIGINT SIGQUIT

sleep infinity 
