#!/bin/bash

set -ex

ANDROID_NDK=${ANDROID_NDK:=/opt/android-ndk-r19c}

TARGET_ARCH=${TARGET_ARCH:=armeabi-v7a}

if [ x"$1" == x"clean" ] ; then
  if [ -d $TARGET_ARCH ] ; then
    rm -rf $TARGET_ARCH
  fi
else
  if [ ! -d $TARGET_ARCH ] ; then
    mkdir $TARGET_ARCH
  fi

  cd $TARGET_ARCH && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/ -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
      -DANDROID_ABI=$TARGET_ARCH \
      -DANDROID_PLATFORM=android-21 \
      -DANDROID_STL=c++_static \
      -DANDROID_CPP_FEATURES="rtti exceptions" \
      -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      ../../../ && make
fi
