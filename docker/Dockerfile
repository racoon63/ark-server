FROM cm2network/steamcmd AS BUILDER

RUN mkdir -p ~/ark && \
    ./steamcmd.sh +login anonymous +force_install_dir ~/ark +app_update 376030 +quit

FROM ubuntu:18.04

ENV SESSIONNAME="my-ark-server"
ENV SERVERPASSWORD="PASS1234"
ENV SERVERADMINPASSWORD="PASS1234"
ENV SERVERUPDATE=true

COPY --from=BUILDER /home/steam/ark /ark
COPY entrypoint.sh /ark/ShooterGame/Binaries/Linux

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y  bash \
                        perl-modules \
                        curl \
                        lsof \
                        libc6-i386 \
                        lib32gcc1 \
                        bzip2 && \
    echo "fs.file-max=100000" | tee -a /etc/sysctl.conf && \
    sysctl -p /etc/sysctl.conf && \
    echo "*               soft    nofile          1000000" | tee -a /etc/security/limits.conf && \
    echo "*               hard    nofile          1000000" | tee -a /etc/security/limits.conf && \
    echo "session required pam_limits.so" | tee -a /etc/pam.d/common-session && \
    useradd --base-dir /ark --home-dir /ark --no-create-home --no-user-group --shell /bin/bash ark && \
    chown -R ark /ark

#RUN useradd --no-create-home --shell /bin/bash --user-group steam && \
#    curl -sL http://git.io/vtf5N | sudo bash -s steam

VOLUME [ "/ark/ShooterGame/Saved/Config/LinuxServer", "/var/log", "/etc/arkmanager" ]

EXPOSE 7777/udp
EXPOSE 7778/udp
EXPOSE 27015/udp
EXPOSE 27020/tcp

WORKDIR /ark/ShooterGame/Binaries/Linux/

ENTRYPOINT [ "/bin/bash", "/ark/ShooterGame/Saved/Config/LinuxServer/entrypoint.sh" ]