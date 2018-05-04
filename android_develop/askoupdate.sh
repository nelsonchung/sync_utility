#!/bin/sh
mkdir -p ~/bin
git clone ssh://git@bitbucket.askey.com.tw:7999/dbswseur/asko.git asko.git
cp asko.git/asko ~/bin/.
export PATH=$PATH:~/bin
