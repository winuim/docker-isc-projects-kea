FROM ubuntu:latest
LABEL Name=kea-dhcp4-server Version=0.0.1

EXPOSE 67:67/udp

ARG DEBIAN_FRONTEND=noninteractive

# Update & Install Requirments Packages.
RUN apt update && apt install -y \
    kea-dhcp4-server \
    tzdata \
    && ln -s -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && sed -i -e "s/\/etc\/kea\-dhcp4\-server\.conf/\/etc\/kea\/kea\-dhcp4.conf/" /etc/init.d/kea-dhcp4-server \
    && rm -rf /var/lib/apt/lists/*

# Run
CMD ["kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf"]
