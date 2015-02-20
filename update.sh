#!/bin/bash
clear
echo "Updating working files"
sudo git pull origin master
echo "Resetting permission for public folder"
sudo chown -R daemon:daemon public
echo "Resetting permission for tmp folder"
sudo chown -R daemon:daemon tmp
echo "Updating completed"
