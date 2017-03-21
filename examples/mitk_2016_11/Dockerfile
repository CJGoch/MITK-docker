FROM ubuntu:16.04
MAINTAINER Caspar
WORKDIR /opt

ENV QT_VERSION_MINOR 5.7
ENV QT_VERSION_PATCH 5.7.1
ENV MITK_HASH a0dedffb74dbcb57726366a56716f489ccf18337

RUN apt-get -y update && apt-get -y install wget xz-utils git
RUN wget -O - http://download.qt.io/official_releases/qt/$QT_VERSION_MINOR/$QT_VERSION_PATCH/single/qt-everywhere-opensource-src-$QT_VERSION_PATCH.tar.xz | tar xvJ 
RUN apt-get -y build-dep qt5-qmake libxcb-xinerama0-dev
RUN apt-get -y install cmake libxt-dev libtiff5-dev libwrap0-dev docbook-xsl-ns libxtst-dev libcap-dev libegl1-mesa-dev libasound2-dev libpci-dev bison build-essential gperf flex ruby python libasound2-dev libbz2-dev libcap-dev libcups2-dev libdrm-dev libegl1-mesa-dev libgcrypt11-dev libnss3-dev libpci-dev libpulse-dev libudev-dev libxtst-dev gyp ninja libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libxcb-xinerama0-dev
RUN cd qt-everywhere-opensource-src-$QT_VERSION_PATCH && ./configure -prefix /opt/Qt$QT_VERSION_PATCH -opengl -confirm-license -opensource -nomake examples -c++std c++11 -qt-sql-sqlite -no-pulseaudio -no-cups -no-nis
RUN cd qt-everywhere-opensource-src-$QT_VERSION_PATCH && make -j"$(nproc)" && make install && cd /opt && rm -rf qt-everywhere-opensource-src-$QT_VERSION_PATCH
RUN git clone -n https://github.com/MITK/MITK.git src && cd src && git checkout $MITK_HASH
RUN mkdir bin && cd bin && cmake -DQt5_DIR:PATH=/opt/Qt$QT_VERSION_PATCH/lib/cmake/Qt5/ -DCMAKE_INSTALL_PREFIX=/opt/install ../src && make -j"$(nproc)" MITK-Configure && cd MITK-build && make -j"$(nproc)" MitkWorkbench 
RUN cd bin && make -j"$(nproc)" install
RUN rm -rf bin src



