#!/usr/bin/env bash

export GOPKG="$(curl -s https://api.github.com/repos/golang/go/git/matching-refs/tags/go | grep ref | grep -v url | grep -v beta | tail -1 | awk -F\/ {' print $3 '} | sed 's/",//')"
wget https://golang.org/dl/$GOPKG.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf $GOPKG.linux-armv6l.tar.gz
rm $GOPKG.linux-armv6l.tar.gz

# Add to profile - bash
echo PATH=$PATH:/usr/local/go/bin >> $HOME/.profile
echo GOPATH=$HOME/Dev/Go >> $HOME/.profile
source $HOME/.profile
