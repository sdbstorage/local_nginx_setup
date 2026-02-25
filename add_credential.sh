#!/usr/bin/zsh

# Check if username or password are empty
if [ $# != 2 ]; then
    echo "usage: $0 <username> <password>"
    exit 1
fi

if CRYPT_PASSWD=`openssl passwd -apr1 $2`; then
    echo "$1:$CRYPT_PASSWD:$2" >> .htpasswd
    echo "\ncredential added for user '$1'"
fi
