#!/bin/bash

user=$(id -u)
log_folder="/var/log/shell-scripts"
log_file="/var/log/shell-scripts/$0.log"

if [ $user -ne 0 ]; then
    echo "please run as sudo user / root user" | tee -a $log_file
   exit 1

fi

validate(){
    if [ $1 -ne 0 ]; then
      echo "installing $2 failure...." | tee -a $log_file
      exit 1
    else

      echo "installing  $2  success" | tee -a $log_file
    fi
}

for package in $@ 
do 
    dnf list installed $package &>>$log_file
    if [ $? -ne 0 ]; then
        echo "$package not installed...installing  $package now ...."
        dnf install $package -y &>>$log_file
        validate $? $package
    else
      
      echo "installing  $package  skipped"
    fi
done