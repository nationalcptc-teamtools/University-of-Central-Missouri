#!/bin/bash

sudo apt update
if [[ $? -ne 0 ]]; then
    echo "***********"
    echo "run as root"
    exit
fi

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin python3-poetry git libssl-dev libffi-dev python-dev-is-python3 build-essential

chown kali:kali -R /opt

mkdir -p /opt/relay
mkdir -p /opt/recon
mkdir -p /opt/priv_esc
mkdir -p /opt/post
cd /opt

git clone https://github.com/byt3bl33d3r/CrackMapExec
cd CrackMapExec
poetry install

alias | grep ^cme && echo "alias cme='crackmapexec'" >> /home/kali/.bashrc && echo "alias cme='crackmapexec'" >> /home/kali/.zshrc && echo "alias cme='crackmapexec'" >> /root/.bashrc && echo "alias cme='crackmapexec'" >> /root/.zshrc
cd ..

cd /opt/relay
git clone https://github.com/Kevin-Robertson/Inveigh.git

pip install mitm6

mkdir bloodhound
curl https://raw.githubusercontent.com/SpecterOps/bloodhound/main/examples/docker-compose/docker-compose.yml | docker compose -f - up 

cd /opt/recon
wget https://github.com/SnaffCon/Snaffler/releases/download/1.0.135/Snaffler.exe

wget https://raw.githubusercontent.com/61106960/adPEAS/main/adPEAS.ps1

cd /opt/post
curl https://github.com/ParrotSec/mimikatz/blob/master/x64/mimikatz.exe > mimikatz_x64.exe
curl https://github.com/ParrotSec/mimikatz/blob/master/Win32/mimikatz.exe > mimikatz_x86.exe

cd /opt/priv_esc
git clone https://github.com/S3cur3Th1sSh1t/PowerSharpPack

wget https://gist.githubusercontent.com/zimnyaa/dcac97f3106e96053a1acb6ca9974e55/raw/4c3559b3524c965e19e41ce543955350eaa2426b/webclient-rbcd.sh

docker pull greenbone/openvas-scanner

cd /opt
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/Obsidian-1.4.16.AppImage

xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Alt>p' -s "xfce4-screenshooter -r"
