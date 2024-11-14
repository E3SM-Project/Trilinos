#!/bin/bash
# Download, build, install boost
PWD_PATH=`pwd`
BOOST_PATH=/global/common/software/e3sm/boost/1.83.0/gcc/11.2.0
mkdir -p ${BOOST_PATH}

wget -c https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.gz
tar -xvf boost_1_83_0.tar.gz
cd boost_1_83_0

./bootstrap.sh --prefix=${BOOST_PATH} --with-toolset=gcc
./b2 -j 16 --without-python --without-stacktrace link=static install
cd ${PWD_PATH}

