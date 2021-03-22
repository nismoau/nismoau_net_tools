FROM ubuntu:latest
RUN apt update
RUN apt install -y curl wget bash nano net-tools fping iperf mz nmap netcat traceroute net-tools tcpdump termshark dnsutils iputils-ping libpcap-dev vnstat iftop iptraf nginx
COPY ./files/mreceive /usr/local/sbin/
COPY ./files/msend /usr/local/sbin/
COPY ./files/udpreplay /usr/local/bin/

# nginx shenanigans so container persists (doesn't auto complete and exit)
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
VOLUME ["/var/cache/nginx"]
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]