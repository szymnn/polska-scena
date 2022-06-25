FROM debian:buster
RUN apt update && apt install -y gcc g++ make cmake autoconf autogen automake
RUN adduser --disabled-password --gecos "" vcmp
RUN apt-get install -y screen libreadline-dev nmap
RUN cd /lib/x86_64-linux-gnu/ && ln -s libreadline.so.7.0 libreadline.so.6
HEALTHCHECK CMD nmap -sU -p 5192 localhost | grep open || exit 1
CMD tail -f /dev/null
EXPOSE 5192/tcp
EXPOSE 5192/udp