FROM ubuntu:latest
RUN apt update
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt -y install wireshark
RUN apt install -y curl wget openssh-client bash nano net-tools fping iperf mz nmap netcat traceroute net-tools tcpdump termshark dnsutils iputils-ping libpcap-dev vnstat iftop iptraf nginx lsof
COPY ./files/mreceive /usr/local/sbin/
COPY ./files/msend /usr/local/sbin/
COPY ./files/udpreplay /usr/local/bin/
RUN chmod +x /usr/local/sbin/mreceive /usr/local/sbin/msend /usr/local/bin/udpreplay

# nginx shenanigans so container persists (doesn't auto complete and exit)
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log
#VOLUME ["/var/cache/nginx"]
## EXPOSE 80 443
#CMD ["nginx", "-g", "daemon off;"]

CMD exec sh -c 'while true ;do wait ;done'
