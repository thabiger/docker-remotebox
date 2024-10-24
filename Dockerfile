FROM opensuse/tumbleweed

RUN zypper --non-interactive --quiet addrepo --refresh -p 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ 'packman' && \
  zypper --gpg-auto-import-keys refresh && \
  zypper --non-interactive dist-upgrade --allow-vendor-change --from packman  && \
  zypper --non-interactive install vlc-codecs

RUN zypper --non-interactive in gtk3-metatheme-adwaita gobject-introspection typelib-1_0-Gtk-3_0  perl-Gtk3 typelib-1_0-GdkPixdata-2_0 perl-SOAP-Lite tigervnc tar bzip2 freerdp-wayland

ADD http://knobgoblin.org.uk/downloads/RemoteBox-3.3.tar.bz2 .
RUN tar -xjf RemoteBox-3.3.tar.bz2 && rm RemoteBox*tar.bz2 && ln -s RemoteBox-3.3 remotebox

RUN chmod 777 /home
