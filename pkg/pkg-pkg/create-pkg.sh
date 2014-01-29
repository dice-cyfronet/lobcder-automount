#!/bin/bash

mkdir ./pkg
cp PKGINFO ./pkg/.PKGINFO
cp INSTALL ./pkg/.INSTALL
cp -r etc/ ./pkg
cp -r usr/ ./pkg
cd pkg/
tar -cf - .PKGINFO .INSTALL * | xz -c -z - > ../lobcder.pkg.tar.xz
cd ../
rm -rf pkg
