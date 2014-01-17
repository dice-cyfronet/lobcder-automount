#!/bin/sh

mkdir ./pkg
cp PKGBUILD ./pkg/.PKGINFO
cp -r etc/ ./pkg
cd pkg/
tar -cf - .PKGINFO * | xz -c -z - > ../lobcderd.pkg.tar.xz
cd ../
rm -rf pkg
