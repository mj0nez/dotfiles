#!/usr/bin/env bash

VERSION=15.2.0
DOWNLOADS=~/Downloads

checksum () {
  if [[ -z "$1" ]]
  then
    echo "checksum <target file path> <target sum> [bit length, default 256]"
    return 1
  fi
	
  target_file="$1"
  target_sum="$2"
  bit_length="${3:-256}"
	
  computed_sum=`openssl "sha$bit_length" "$target_file" | cut -d' ' -f2`
	
  if [[ "$computed_sum" == "$target_sum" ]]
  then
    echo "checksum match"
    return 0
  else
    echo "checksum mismatch"
    return 1
  fi
}


curl \
    -L \
    -o $DOWNLOADS/ripgrep_$VERSION-1_amd64.deb \
    https://github.com/BurntSushi/ripgrep/releases/download/$VERSION/ripgrep_$VERSION-1_amd64.deb

curl \
    -L \
    -o $DOWNLOADS/ripgrep_$VERSION-1_amd64.deb.sha256 \
    https://github.com/BurntSushi/ripgrep/releases/download/$VERSION/ripgrep_$VERSION-1_amd64.deb.sha256


checksum $DOWNLOADS/ripgrep_$VERSION-1_amd64.deb $(cut -d' ' -f1 $DOWNLOADS/ripgrep_$VERSION-1_amd64.deb.sha256)


sudo dpkg -i $DOWNLOADS/ripgrep_$VERSION-1_amd64.deb

which -a rg

rg --version