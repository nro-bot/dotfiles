
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
