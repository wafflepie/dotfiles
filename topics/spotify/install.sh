sudo dnf install lpf lpf-spotify-client

if [[ ! -z "$XDG_CURRENT_DESKTOP" ]] && ! lpf state spotify-client | grep -q OK; then
  sudo lpf update spotify-client
fi
