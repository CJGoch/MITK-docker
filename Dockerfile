FROM ubuntu:16.04
MAINTAINER Marco
WORKDIR /opt
RUN apt-get -y update && apt-get -y install wget xz-utils git
RUN wget -O - http://download.qt.io/official_releases/qt/5.6/5.6.0/single/qt-everywhere-opensource-src-5.6.0.tar.xz | tar xvJ 
RUN apt-get -y build-dep qt5-qmake libxcb-xinerama0-dev
RUN apt-get -y install cmake libxt-dev libtiff5-dev libwrap0-dev docbook-xsl-ns libxtst-dev libcap-dev libegl1-mesa-dev libasound2-dev libpci-dev bison build-essential gperf flex ruby python libasound2-dev libbz2-dev libcap-dev libcups2-dev libdrm-dev libegl1-mesa-dev libgcrypt11-dev libnss3-dev libpci-dev libpulse-dev libudev-dev libxtst-dev gyp ninja libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libxcb-xinerama0-dev
RUN cd qt-everywhere-opensource-src-5.6.0 && ./configure -prefix /opt/Qt5.6.0 -opengl -confirm-license -opensource -nomake examples -c++std c++11 -qt-sql-sqlite -no-pulseaudio -no-cups -no-nis
RUN cd qt-everywhere-opensource-src-5.6.0 && make -j14 && make install && cd /opt && rm -rf qt-everywhere-opensource-src-5.6.0
RUN git clone -n https://github.com/MITK/MITK.git src && cd src && git checkout ceedd62
RUN mkdir bin && cd bin && cmake -DQt5_DIR:PATH=/opt/Qt5.6.0/lib/cmake/Qt5/ -DCMAKE_INSTALL_PREFIX=/opt/install ../src && make -j14 MITK-Configure && cd MITK-build && make -j14 MitkWorkbench 
RUN cd bin && make -j14 install
RUN rm -rf bin src



