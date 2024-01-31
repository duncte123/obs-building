#!/bin/bash

rm -rf /obs-building/out/*

cmake -S . -B /obs-building/out -G Ninja \
    -DCEF_ROOT_DIR="/obs-building/obs-build-dependencies/cef_binary_5060_linux_x86_64" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_PIPEWIRE=OFF \
    -DENABLE_BROWSER=OFF \
    -DENABLE_AJA=0 \
    -DENABLE_WEBRTC=0 \
    -DQT_VERSION=6;

cmake --build /obs-building/out
