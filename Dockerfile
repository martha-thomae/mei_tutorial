FROM ubuntu:latest

RUN set -e \
    && apt-get update \
    && apt-get install -yqq \
        vim \
        python3 \
        python3-pip \
        git \
        cmake \
        autoconf \
        wget \
    # install PyMei dependencies
        uuid-dev \
        libxml2

# Install PyMei
RUN set -e \
    && cd /opt \
    && git clone -b libboost_python https://github.com/DDMAL/libmei \
    && cd libmei/ \
    && sed -i "s/add_definitions( -Werror )//g" CMakeLists.txt \
    && sed -i "s/endif (CMAKE_COMPILER_IS_GNUCXX)//g" CMakeLists.txt \
    && sed -i "s/if (CMAKE_COMPILER_IS_GNUCXX)//g" CMakeLists.txt \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install \
    && apt-get install -yqq \
        build-essential \
        python3-dev \
        python3-setuptools \
        libboost-thread-dev

# Install BoostPython
RUN set -e \
    && cd /opt \
    && wget --no-verbose https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz \
    && tar zxvf boost_1_70_0.tar.gz

RUN ["/bin/bash", "-c", "cd /opt/boost_1_70_0 && ./bootstrap.sh --with-python=$(which python3) --prefix=/opt && ./b2 install --prefix=/opt && ldconfig && cd /opt/libmei/python/ && export CFLAGS='-F /Library/Frameworks -I /opt/include -L /opt/lib' && python3 setup.py build && python3 setup.py install"]
