#!/bin/bash
script_full_path=$(dirname "$0")
cd $script_full_path
rm -rf build
mkdir -p build build/_ build/_/DEBIAN
cd build
cmake ..
make install DESTDIR=$script_full_path/build/_
find . -name '.DS_Store' -type f -delete
cd $script_full_path/macos
./control.sh apt.control ../build/_ > ../build/_/DEBIAN/control
cp apt.postinst ../build/_/DEBIAN/postinst
cp apt.postrm ../build/_/DEBIAN/postrm
cd $script_full_path/build
chmod 0755 _/DEBIAN
chmod 0755 _/DEBIAN/*
dpkg-deb -b _
cp _.deb ../apt_"$(./version.sh)"_darwin-amd64.deb
