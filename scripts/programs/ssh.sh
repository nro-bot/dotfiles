
if [ -f ~/.ssh/id_rsa.pub ]; then
    cat id_rsa.pub
else
    ssh-keygen -t rsa -b 4096 -C "nouyang@alum.mit.edu"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub
    echo "Now add to https://github.com/settings/keys"
    #wget; chmod 400
fi

