alias dps="docker ps"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

dbash() {
  docker exec -it $(docker ps -aqf "name=$1") bash;
}
