# First time opening the remote machine
# sudo apt-get --yes update
# apt install --yes git
# git clone https://github.com/dl-wb-experiments/face-hiding-workshop
sudo apt-get --yes update
sudo update-pciids
sudo apt-get --yes upgrade
sudo apt-get --yes install software-properties-common
sudo add-apt-repository --yes ppa:deadsnakes/ppa
sudo apt-get --yes install python3.7 htop
sudo apt-get --yes install python3-pip
python3.7 -m pip install virtualenv
python3.7 -m virtualenv venv


sudo apt-get --yes install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get --yes install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker ${USER}
#newgrp docker

mkdir -p -m 777 ~/.workbench
apt install -y git
git clone https://github.com/dl-wb-experiments/face-hiding-workshop ~/.workbench/workshop
chmod -R 777 ~/.workbench/workshop/

source venv/bin/activate
python -m pip install openvino-workbench
openvino-workbench --image openvino/workbench:2021.4.0.2 --assets-directory ~/.workbench --detached
