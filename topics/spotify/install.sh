sudo dnf install lpf lpf-spotify-client

if ! lpf state spotify-client | grep -q OK; then
  sudo lpf approve spotify-client
  sudo lpf build spotify-client
  sudo lpf install spotify-client
fi
