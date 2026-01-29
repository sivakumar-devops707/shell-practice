#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]; then
    echo "please run as sudo user / root user"
   exit 1

fi

validate(){
    if [ $1 -ne 0 ]; then
echo "installing $2 failure...."
exit 1
else

echo "installing  $2  success"
fi
}
echo "installing nginx"
dnf install nginx -y

validate $? "nginx"

