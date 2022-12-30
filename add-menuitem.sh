#!/bin/bash

ICON_NAME=remotebox
TMP_DIR=`mktemp --directory`
DESKTOP_FILE=$TMP_DIR/tha-remotebox.desktop

cat << EOF > $DESKTOP_FILE
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=RemoteBox
Keywords=git
Comment=VirtualBox Client
Type=Application
Terminal=false
StartupWMClass=RemoteBox
Exec="$(pwd)/run"
Icon=tha-remotebox.png
EOF

chmod 644 $DESKTOP_FILE

xdg-desktop-menu install $DESKTOP_FILE
xdg-icon-resource install --size 128 "icon.png" tha-remotebox

rm $DESKTOP_FILE
rm -R $TMP_DIR
