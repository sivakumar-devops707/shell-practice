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

for package in $@ 
do 
   dnf list installed nginx
     if [ $? -ne 0 ]; then
      echo "$package not installed...installing  $package now ...."
      dnf install $package -y
      validate $? $package
    else
      validate $? $package
      echo "installing  $package  skipped"
    fi
done