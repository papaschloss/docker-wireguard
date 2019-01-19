# docker-wireguard
This is a docker image for a wireguard server configured as a VPN.

You need to mount
/etc/wireguard/
/lib/modules/

and you need a wg0.conf in your /etc/wireguard.

Also, this will only work with ubuntu 18.04 (or whatever the version of ubuntu is listed in the Dockerfile)
