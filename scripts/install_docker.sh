curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker #activate changes to group

sudo apt install docker-compose
