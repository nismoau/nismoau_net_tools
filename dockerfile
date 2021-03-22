FROM ubuntu:latest
RUN apt update
RUN apt install -y curl wget bash nano net-tools fping iperf mz nmap netcat traceroute net-tools tcpdump termshark dnsutils iputils-ping libpcap-dev vnstat iftop iptraf 
COPY ./files/mreceive /usr/local/sbin/
COPY ./files/msend /usr/local/sbin/
COPY ./files/udpreplay /usr/local/bin/
