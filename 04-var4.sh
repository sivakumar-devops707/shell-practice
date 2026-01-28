#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]; then
    echo "please run as sudo user / root user"
    dnf install nginx -y

fi
echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
echo "installing failure...."
exit 1
else

echo "installing success"
fi
