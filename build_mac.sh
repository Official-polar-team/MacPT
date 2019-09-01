#!/bin/zsh
cd "${0%/*}"
rm -rf build
mkdir -p build/_/DEBIAN build/__/DEBIAN build/___/DEBIAN build/____/DEBIAN build/_____/DEBIAN build/______/DEBIAN
cd build
cmake ..
make -j8 install DESTDIR=_

rsync -av --include '*/' --include 'libapt-pkg*5*' --exclude '*' --prune-empty-dirs --remove-source-files ./_/ ./__/

mkdir -p ./___/usr/local/lib/; mv ./_/usr/local/lib/libapt-pkg.dylib $_
mv ./_/usr/local/lib/pkgconfig ./___/usr/local/lib/pkgconfig
mv ./_/usr/local/include ./___/usr/local/include

rsync -av --include '*/' --include 'apt-utils.mo' --exclude '*' --prune-empty-dirs --remove-source-files ./_/ ./____/
mkdir -p ./____/usr/local/share/doc/; mv ./_/usr/local/share/doc/apt-utils $_
rsync -av --include '*/' --include 'apt-ftparchive*' --exclude '*' --prune-empty-dirs --remove-source-files ./_/ ./____/
rsync -av --include '*/' --include 'apt-sortpkgs*' --exclude '*' --prune-empty-dirs --remove-source-files ./_/ ./____/
rsync -av --include '*/' --include 'apt-extracttemplates*' --exclude '*' --prune-empty-dirs --remove-source-files ./_/ ./____/

mkdir -p ./_____/usr/local/share/doc/; mv ./_/usr/local/share/doc/apt-doc $_

mkdir -p ./______/usr/local/share/doc/; mv ./_/usr/local/share/doc/libapt-pkg-doc $_

find . -name '.DS_Store' -type f -delete
cd ../macos
./control.sh apt.control ../build/_ > ../build/_/DEBIAN/control
./control.sh libapt-pkg.control ../build/__ > ../build/__/DEBIAN/control
./control.sh libapt-pkg-dev.control ../build/___ > ../build/___/DEBIAN/control
./control.sh apt-utils.control ../build/____ > ../build/____/DEBIAN/control
./control.sh apt-doc.control ../build/_____ > ../build/_____/DEBIAN/control
./control.sh libapt-pkg-doc.control ../build/______ > ../build/______/DEBIAN/control
cp apt.postinst ../build/_/DEBIAN/postinst
cp apt.postrm ../build/_/DEBIAN/postrm
cd ../build
dpkg-deb -b _
dpkg-deb -b __
dpkg-deb -b ___
dpkg-deb -b ____
dpkg-deb -b _____
dpkg-deb -b ______
mkdir -p ../debs
mv _.deb ../debs/apt_"$(../macos/version.sh)"_darwin-amd64.deb
mv __.deb ../debs/libapt-pkg5.90_"$(../macos/version.sh)"_darwin-amd64.deb
mv ___.deb ../debs/libapt-pkg-dev_"$(../macos/version.sh)"_darwin-amd64.deb
mv ____.deb ../debs/apt-utils_"$(../macos/version.sh)"_darwin-amd64.deb
mv _____.deb ../debs/apt-doc_"$(../macos/version.sh)"_all.deb
mv ______.deb ../debs/libapt-pkg-doc_"$(../macos/version.sh)"_all.deb
