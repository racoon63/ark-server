FROM cm2network/steamcmd:latest

RUN mkdir -p /home/steam/ark
RUN chown -R steam:steam /home/steam/ark

VOLUME [ "/home/steam/ark" ]

ENTRYPOINT [ "./steamcmd.sh", "+login", "anonymous", "+force_install_dir", "/home/steam/ark", "+app_update 376030", "+quit" ]