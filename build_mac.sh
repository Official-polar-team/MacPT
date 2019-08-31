#!/bin/zsh
cd "${0%/*}"
rm -rf build
mkdir -p build/_/DEBIAN build/__/DEBIAN build/__/usr/local/lib build/___/DEBIAN build/___/usr/local/lib
cd build
cmake ..
make -j8 install DESTDIR=_
for f in `find ./_/usr/local/lib -name 'libapt-pkg.5*'`
do
mv $f ./__/usr/local/lib
done
for f in `find ./_/usr/local/lib -name 'libapt-pkg*'`
do
mv $f ./___/usr/local/lib
done
mv ./_/usr/local/lib/pkgconfig ./___/usr/local/lib/pkgconfig
mv ./_/usr/local/include ./___/usr/local/include
find . -name '.DS_Store' -type f -delete
cd ../macos
./control.sh apt.control ../build/_ > ../build/_/DEBIAN/control
./control.sh libapt-pkg.control ../build/__ > ../build/__/DEBIAN/control
./control.sh libapt-pkg-dev.control ../build/___ > ../build/___/DEBIAN/control
cp apt.postinst ../build/_/DEBIAN/postinst
cp apt.postrm ../build/_/DEBIAN/postrm
cd ../build
chmod 0755 _/DEBIAN _/DEBIAN/* __/DEBIAN __/DEBIAN/* ___/DEBIAN ___/DEBIAN/*
dpkg-deb -b _
dpkg-deb -b __
dpkg-deb -b ___
cp _.deb ../apt_"$(../macos/version.sh)"_darwin-amd64.deb
cp __.deb ../libapt-pkg5.90_"$(../macos/version.sh)"_darwin-amd64.deb
cp ___.deb ../libapt-pkg-dev_"$(../macos/version.sh)"_darwin-amd64.deb
