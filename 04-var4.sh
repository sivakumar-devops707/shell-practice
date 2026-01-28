#!/bin/bash


if [[ $(id -u) -eq 0 ]]; then
    echo "success"
    dnf install nginx -y
else
    echo "failure"
fi