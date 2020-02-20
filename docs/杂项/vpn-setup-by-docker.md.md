---
layout: default 
title: 使用docker搭建VPN
parent: literature-art
nav_order: 2
hash: 2020-02-20

---

```
docker, docker-compose
```

``` 
docker-compose.yml

---
version: '3'

services:
  vpn:
    image: hwdsl2/ipsec-vpn-server
    restart: always
    env_file:
      - ./.env
    environment:
      - VPN_IPSEC_PSK=wangle520
	  - VPN_USER=wangle
	  - VPN_PASSWORD=wangle12958
    ports:
      - "500:500/udp"
      - "4500:4500/udp"
    privileged: true

  shadowsocks:
    image: shadowsocks/shadowsocks-libev
    ports:
      - "4433:8388/tcp"
      - "4433:8388/udp"
    environment:
      - METHOD=aes-256-cfb
      - PASSWORD=6Et80G4N5N8Lh3kw
    restart: always

```


```
.env

# Define your own values for these variables
# - DO NOT put "" or '' around values, or add space around =
# - DO NOT use these special characters within values: \ " '
VPN_IPSEC_PSK=wangle520
VPN_USER=wangle
VPN_PASSWORD=wangle12958

# (Optional) Define additional VPN users
# - Uncomment and replace with your own values
# - Usernames and passwords must be separated by spaces
# VPN_ADDL_USERS=additional_username_1 additional_username_2
# VPN_ADDL_PASSWORDS=additional_password_1 additional_password_2

# (Optional) Use alternative DNS servers
# - By default, clients are set to use Google Public DNS
# - Example below shows using Cloudflare's DNS service
# VPN_DNS_SRV1=1.1.1.1
# VPN_DNS_SRV2=1.0.0.1
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbOTIyNTk3OTM0XX0=
-->