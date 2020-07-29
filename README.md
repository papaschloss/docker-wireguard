# docker-wireguard
This is a docker image for a wireguard server configured as a VPN.

You need to mount ```/etc/wireguard/``` and ```/lib/modules/``` for this to work

and you need a wg0.conf in your /etc/wireguard. There's an example conf file in the repo, but you'll need to update the IP, key, and other details.

To use this as a VPN, pass through port 51820 to this docker instance. Here's a docker-compose example:

```
wireguard:
        image: papaschloss/docker-wireguard
        network_mode: bridge
        container_name: wireguard
        ports:
            - 51820:51820/udp
        volumes:
            - /etc/wireguard:/etc/wireguard
            - /lib/modules:/lib/modules
        cap_add:
            - NET_ADMIN
            - SYS_MODULE
```

or from the command line:

```
docker run --cap-add=NET_ADMIN --cap-add=SYS_MODULE \
              -v /etc/wireguard:/etc/wireguard \
              -v /lib/modules:/lib/modules \
              -p 51820:51820/udp \
              papaschloss/docker-wireguard
```

Also, this will only work with ubuntu 18.04 (or whatever the version of ubuntu is listed in the Dockerfile)
