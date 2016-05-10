FROM ubuntu:16.04
MAINTAINER Marco
WORKDIR /opt
RUN apt-get -y update && apt-get -y install wget xz-utils 
RUN wget -O - http://download.qt.io/official_releases/qt/5.6/5.6.0/single/qt-everywhere-opensource-src-5.6.0.tar.xz | tar xvJ 
RUN apt-get -y install git cmake g++ wget
RUN cd qt-everywhere-opensource-src-5.6.0 && ./configure -prefix /opt/Qt5.6.0 -confirm-license -opensource -nomake examples 
RUN apt-get -y build-dep qt5-qmake libxcb-xinerama0-dev
RUN apt-get -y install libxcb-xinerama0-dev
RUN git clone -b docker-base https://github.com/nolden/MITK.git src
RUN apt-get -y install libxtst-dev
RUN cd qt-everywhere-opensource-src-5.6.0 && ./configure -prefix /opt/Qt5.6.0 -opengl -confirm-license -opensource -nomake examples -c++std c++11 -qt-sql-sqlite -no-pulseaudio  -no-alsa -no-cups -no-nis && make -j8 module-qtwebengine
RUN cd qt-everywhere-opensource-src-5.6.0 && make -j8 && make install && cd /opt && rm -rf qt-everywhere-opensource-src-5.6.0
RUN mkdir bin && cd bin && cmake -DQt5_DIR:PATH=/opt/Qt5.6.0/lib/cmake/Qt5/ -DCMAKE_INSTALL_PREFIX=/opt/install ../src && make MITK-Configure && cd MITK-build && make MitkWorkbench && make install



