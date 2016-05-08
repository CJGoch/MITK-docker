FROM ubuntu:16.04
MAINTAINER Marco
WORKDIR /opt
RUN apt-get -y update && apt-get -y install wget xz-utils 
RUN wget -O - http://download.qt.io/official_releases/qt/5.6/5.6.0/single/qt-everywhere-opensource-src-5.6.0.tar.xz | tar xvJ 
RUN apt-get -y install git cmake g++ wget
RUN apt-get -y build-dep qt5-qmake
RUN cd qt-everywhere-opensource-src-5.6.0 && ./configure -prefix /opt/Qt5.6.0 -opengl -confirm-license -opensource && make && make install && cd /opt && rm -rf qt-everywhere-opensource-src-5.6.0
RUN git clone -b docker-base https://github.com/nolden/MITK.git src && \
 mkdir bin && cd bin && cmake -DCMAKE_INSTALL_PREFIX=/opt/install ../src && make MITK-Configure && cd MITK-build && make MitkWorkbench && make install



