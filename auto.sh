#!/bin/bash
read -p "Enter the commit message:" commitmessage
git add .
git commit - m  $commitmessage
git push origin master 

