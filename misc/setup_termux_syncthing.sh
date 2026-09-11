SYNCTHING_GUI_ADDRESS="127.0.0.1:8384"
log "Setting up Syncthing as a termux-services runit service"
SV_DIR="$PREFIX/var/service/syncthing"
mkdir -p "$SV_DIR/log"
cat > "$SV_DIR/run" <<EOF
#!$PREFIX/bin/sh
exec syncthing --no-browser --gui-address=$SYNCTHING_GUI_ADDRESS 2>&1
EOF
chmod +x "$SV_DIR/run"
ln -sf "$PREFIX/share/termux-services/svlogger" "$SV_DIR/log/run"
 
log "Ensuring termux-services is sourced on every Termux startup"
STARTUP_LINE='source $PREFIX/etc/profile.d/start-services.sh'
if ! grep -qF "$STARTUP_LINE" "$HOME/.bashrc" 2>/dev/null; then
  echo "$STARTUP_LINE" >> "$HOME/.bashrc"
fi

source "$PREFIX/etc/profile.d/start-services.sh"
 
log "Enabling and starting the syncthing service"
sv-enable syncthing
sv up syncthing
sleep 1
sv status syncthing
 
log "Done! Syncthing is now running under $SYNCTHING_GUI_ADDRESS"
