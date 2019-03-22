alias dps="docker ps"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcr="docker-compose restart"

dbash() {
  docker exec -it $(docker ps -aqf "name=$1") bash;
}

remove_containers() {
  docker stop $(docker ps -aq)
  docker rm $(docker ps -aq)
}

armageddon() {
  remove_containers
  docker network prune -f
  docker rmi -f $(docker images --filter dangling=true -qa)
  docker volume rm $(docker volume ls --filter dangling=true -q)
  docker rmi -f $(docker images -qa)
}
