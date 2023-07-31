#!/bin/sh
apt-get install -y tcl
apt-get install -y tk
apt-get install -y tk-dev
apt-get install -y tk-table
apt-get install -y jags
apt-get install -y make
apt-get install -y python3
apt-get install -y bowtie2
apt-get install -y default-jdk
R CMD javareconf
apt-get install -y bwidget
apt-get install -y libgsl0-dev
apt-get install -y nvidia-cuda-dev
apt-get install -y imagej
apt-get install -y pandoc
apt-get install -y perl
apt-get install -y libfftw3-dev
apt-get install -y zlib1g-dev
apt-get install -y libjpeg-dev
apt-get install -y libpng-dev
apt-get install -y pari-gp
apt-get install -y imagemagick
apt-get install -y libmagick++-dev
apt-get install -y gsfonts
apt-get install -y libgdal-dev
apt-get install -y gdal-bin
apt-get install -y libgeos-dev
apt-get install -y libproj-dev
apt-get install -y unixodbc-dev
apt-get install -y libxml2-dev
apt-get install -y libgmp3-dev
apt-get install -y pandoc-citeproc
apt-get install -y cmake
[ $(which google-chrome) ] || 
apt-get install -y gnupg curl
[ $(which google-chrome) ] || curl -fsSL -o /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
[ $(which google-chrome) ] || DEBIAN_FRONTEND='noninteractive' 
apt-get install -y /tmp/google-chrome.deb
rm -f /tmp/google-chrome.deb
apt-get install -y libopencv-dev
apt-get install -y libssh2-1-dev
apt-get install -y libcurl4-openssl-dev
apt-get install -y libtiff-dev
apt-get install -y libssl-dev
apt-get install -y ocl-icd-opencl-dev
apt-get install -y git
apt-get install -y texlive
apt-get install -y libimage-exiftool-perl
apt-get install -y libmpfr-dev
apt-get install -y libfreetype6-dev
apt-get install -y libfribidi-dev
apt-get install -y libharfbuzz-dev
apt-get install -y libwebp-dev
apt-get install -y coinor-symphony
apt-get install -y coinor-libsymphony-dev
apt-get install -y rustc
apt-get install -y cargo
apt-get install -y libhiredis-dev
apt-get install -y libnetcdf-dev
apt-get install -y libfontconfig1-dev
apt-get install -y libjq-dev
apt-get install -y libarchive-dev
apt-get install -y libleptonica-dev
apt-get install -y libtesseract-dev
apt-get install -y tesseract-ocr-eng
apt-get install -y libsodium-dev
apt-get install -y libmysqlclient-dev
apt-get install -y libcairo2-dev
apt-get install -y automake
apt-get install -y libglu1-mesa-dev
apt-get install -y libopenmpi-dev
apt-get install -y libprotobuf-dev
apt-get install -y protobuf-compiler
apt-get install -y libsqlite3-dev
apt-get install -y libapparmor-dev
apt-get install -y libudunits2-dev
apt-get install -y libsecret-1-dev
apt-get install -y libglpk-dev
apt-get install -y librsvg2-dev
apt-get install -y libgit2-dev
apt-get install -y saga
apt-get install -y libmagic-dev
apt-get install -y libboost-all-dev
apt-get install -y libicu-dev
apt-get install -y coinor-libclp-dev
apt-get install -y libpq-dev
apt-get install -y libnode-dev
apt-get install -y libzmq3-dev
apt-get install -y libhdf5-dev
apt-get install -y libavfilter-dev
apt-get install -y libpoppler-cpp-dev
apt-get install -y libxslt-dev
apt-get install -y dcraw
apt-get install -y libsasl2-dev
apt-get install -y libquantlib0-dev
apt-get install -y libglib2.0-dev
apt-get install -y pkg-config
apt-get install -y libgpgme11-dev
apt-get install -y haveged
apt-get install -y librdf0-dev
apt-get install -y libgl1-mesa-dev
apt-get install -y libsndfile1-dev
apt-get install -y protobuf-compiler libprotobuf-dev libprotoc-dev 
