sudo dnf install lpf lpf-spotify-client

if ! lpf state spotify-client | grep -q OK && [[ ! -z "$XDG_CURRENT_DESKTOP" ]]; then
  sudo lpf update spotify-client
fi
