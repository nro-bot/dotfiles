# https://docs.duckietown.org/daffy/opmanual_duckiebot/out/laptop_setup.html
sudo apt install -y python3-pip git git-lfs curl wget

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker #activate changes to group

install docker-compose

senv
# https://docs.duckietown.org/daffy/opmanual_duckiebot/out/dt_account.html
pip3 install --no-cache-dir --user --upgrade duckietown-shell
dts --set-version daffy
dts tok set # interactive!

mkdir $HOME/projects
mkdir $HOME/projects/duckie
