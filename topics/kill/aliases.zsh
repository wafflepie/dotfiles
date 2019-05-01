kill_port() {
  kill -2 $(lsof -i tcp:"$1" | sed -n '2 p' | awk '{print $2}')
}
