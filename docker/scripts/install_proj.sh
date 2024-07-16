#!/bin/bash
set -eEu
####################################################################################################
# Download, build and install PROJ

curl -L https://download.osgeo.org/proj/proj-9.4.1.tar.gz -o /tmp/proj.tar.gz
mkdir /tmp/proj
cd /tmp/proj
tar --strip-components=1 -xzvf ../proj.tar.gz
cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF
    cmake --build build --parallel 4
cmake --install build
cd /
rm -rf /tmp/proj.tar.gz /tmp/proj

####################################################################################################
