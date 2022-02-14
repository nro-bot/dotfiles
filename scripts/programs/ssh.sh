
# Set ssh to always forward X (required for mouse copy paste from remote to
# local!), and include dummy examples of ssh config alias

simplessh="
ForwardX11 yes

Host light
    HostName 34.xxx.yy.zzz
    User bitnami
    IdentityFile ~/.ssh/LightsailDefaultKey-us-east-1.pem

Host X1G2
    User nrw
    ProxyCommand ssh -qX nc 192.xxx.z.yyy 22
    ForwardX11 yes
"

if [ -f ~/.ssh/config ]; then
    echo "~/.ssh/config already exists, not overwriting"
else
    echo $simplessh > ~/.ssh/config
fi

if [ -f ~/.ssh/id_rsa.pub ]; then
    echo "id_rsa.pub already exists, not overwriting"
else
    ssh-keygen -t rsa -b 4096 -C "nrobotspam@mit.edu"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    #wget; chmod 400
fi

echo "   ---- id_rsa.pub ---- "
cat ~/.ssh/id_rsa.pub
echo " ---- Now you must add to https://github.com/settings/keys ---- "

