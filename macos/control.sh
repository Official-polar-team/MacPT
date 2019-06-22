#!/bin/bash
src=$1
dir=$2
dir=${dir:=../build/_}
gsed -e "s@^\(Version:\).*@\1 $(./version.sh)@; s@^\(Provides: apt-transport-https\).*@\1 \(= $(./version.sh))@" "${src}"
echo "Installed-Size: $(du -s "${dir}" | cut -f 1)"
