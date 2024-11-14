#!/bin/bash
# Download, build, install boost
PWD_PATH=`pwd`
BOOST_PATH=/lcrc/group/e3sm/soft/boost/1.83.0/intel/20.0.4
mkdir -p ${BOOST_PATH}

wget -c https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.gz
tar -xvf boost_1_83_0.tar.gz
cd boost_1_83_0

./bootstrap.sh --prefix=${BOOST_PATH} --with-toolset=intel-linux
./b2 -j 16 --without-python --without-stacktrace link=static install
cd ${PWD_PATH}
