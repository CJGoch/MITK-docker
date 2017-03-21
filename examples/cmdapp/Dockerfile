FROM ubuntu:16.04
MAINTAINER Caspar
WORKDIR /opt

ENV MITK_HASH a0dedffb74dbcb57726366a56716f489ccf18337

RUN apt-get -y update && apt-get -y install wget xz-utils git
RUN apt-get -y install cmake cmake-curses-gui libxt-dev libtiff5-dev libwrap0-dev docbook-xsl-ns libxtst-dev libcap-dev libegl1-mesa-dev libasound2-dev libpci-dev bison build-essential gperf flex ruby python libasound2-dev libbz2-dev libcap-dev libcups2-dev libdrm-dev libegl1-mesa-dev libglu1-mesa-dev libgcrypt11-dev libnss3-dev libpci-dev libpulse-dev libudev-dev libxtst-dev gyp ninja libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libxcb-xinerama0-dev
RUN git clone -n https://github.com/MITK/MITK.git src && cd src && git checkout $MITK_HASH
RUN mkdir bin && cd bin && cmake -DCMAKE_BUILD_TYPE:STRING=Release -DMITK_USE_Qt5:BOOL=OFF -DMITK_USE_Qt5_WebEngine:BOOL=OFF -DMITK_USE_BLUEBERRY:BOOL=OFF -DMITK_USE_CTK:BOOL=OFF -DMITK_USE_Vigra:BOOL=ON -DMITK_USE_HDF5:BOOL=ON -DCMAKE_INSTALL_PREFIX=/opt/install ../src && make -j"$(nproc)" MITK-Configure && cd MITK-build && cmake -DBUILD_DiffusionMiniApps:Bool=TRUE . && make -j"$(nproc)"  

