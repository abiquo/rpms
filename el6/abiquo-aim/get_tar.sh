#!/bin/bash
TAG=`cat abiquo-aim.spec | grep " git_release "| cut -d" " -f 3`
VER=`cat abiquo-aim.spec | grep " abiquo_version "| cut -d" " -f 3`

wget https://github.com/abiquo/aim/archive/v$TAG.zip -O temp.zip
if [ $? -eq 0 ]; then
  unzip temp.zip > /dev/null
  mv aim-${TAG} abiquo-aim-${VER}rel${TAG}
  tar czf abiquo-aim-${VER}rel${TAG}.tar.gz abiquo-aim-${VER}rel${TAG}
  rm -rf abiquo-aim-${VER}rel${TAG}
  rm temp.zip
  echo "OK."
else 
  echo "Errorz downloading zip."
fi

