FROM ubuntu:16.04
MAINTAINER Caspar
WORKDIR /opt

ENV QT_VERSION_MINOR 5.7
ENV QT_VERSION_PATCH 5.7.1
ENV MITK_HASH a0dedffb74dbcb57726366a56716f489ccf18337

RUN apt-get -y update && apt-get -y install \
  bison \
  build-essential \
  cmake \
  cmake-curses-gui \
  docbook-xsl-ns \
  flex \
  git \
  gperf \
  gyp \
  libasound2-dev \
  libasound2-dev \
  libbz2-dev \
  libcap-dev \
  libcap-dev \
  libcups2-dev \
  libdrm-dev \
  libegl1-mesa-dev \
  libegl1-mesa-dev \
  libfontconfig1-dev \
  libgcrypt11-dev \
  libglu1-mesa-dev \
  libnss3-dev \
  libpci-dev \
  libpci-dev \
  libpulse-dev \
  libssl-dev \
  libtiff5-dev \
  libudev-dev \
  libwrap0-dev \
  libxcb-xinerama0-dev \
  libxcomposite-dev \
  libxcursor-dev \
  libxdamage-dev \
  libxrandr-dev \
  libxss-dev \
  libxt-dev \
  libxtst-dev \
  libxtst-dev \
  ninja \
  python \
  ruby \
  wget \
  xz-utils
RUN git clone -n https://github.com/MITK/MITK.git src && cd src && git checkout $MITK_HASH
RUN mkdir bin && cd bin && cmake \
  -DCMAKE_BUILD_TYPE:STRING=Release \
  -DMITK_USE_Qt5:BOOL=OFF \
  -DMITK_USE_Qt5_WebEngine:BOOL=OFF \
  -DMITK_USE_BLUEBERRY:BOOL=OFF \
  -DMITK_USE_CTK:BOOL=OFF \
  -DMITK_USE_Vigra:BOOL=ON \
  -DMITK_USE_HDF5:BOOL=ON \
  -DCMAKE_INSTALL_PREFIX=/opt/install \
  ../src \
  && make -j"$(nproc)" MITK-Configure \
  && cd MITK-build \
  && cmake -DBUILD_DiffusionMiniApps:Bool=TRUE . \
  && make -j"$(nproc)"  

