FROM debian:latest

RUN set -e \
    && apt-get update \
    && apt-get install -yqq \
      ipython \
      libboost-python-dev \
      libboost-thread-dev \
      libjpeg-dev \
      uuid-dev \
      libpq-dev \
      python \
      python-pip \
      python-dev \
      python-docutils \
      libpython-dev \
      cmake \
      g++ \
      git \
      build-essential \
      libssl-dev \
      libffi-dev \
      libxml2-dev \
      libxslt1-dev \
      zlib1g-dev

RUN set -e \
    && pip install lxml \
    && cd /opt \
    && git clone https://github.com/DDMAL/libmei \
    && cd /opt/libmei/tools \
    && pip install lxml

RUN set -e \
    && rm -rf ../src/modules/* \
    && rm -rf ../python/pymei/Modules/* \
    && cd /opt/libmei \
    && cmake . \
    && make && make install \
    && cd /opt/libmei/python \
    && sed -i 's/boost_python-mt/boost_python/g' setup.py \
    && pip install .
