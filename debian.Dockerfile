FROM amd64/debian:bookworm

WORKDIR /obs-building

COPY ./scripts/build-linux.sh ./scripts/build-linux.sh

ARG OBS_VERSION=master

RUN apt update -y && \
    apt install -y cmake ninja-build pkg-config clang clang-format build-essential curl ccache git zsh

RUN apt install -y libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libswresample-dev libswscale-dev libx264-dev libcurl4-openssl-dev libmbedtls-dev libgl1-mesa-dev libjansson-dev libluajit-5.1-dev python3-dev libx11-dev libxcb-randr0-dev libxcb-shm0-dev libxcb-xinerama0-dev libxcb-composite0-dev libxcomposite-dev libxinerama-dev libxcb1-dev libx11-xcb-dev libxcb-xfixes0-dev swig libcmocka-dev libxss-dev libglvnd-dev libgles2-mesa libgles2-mesa-dev libwayland-dev librist-dev libsrt-openssl-dev libpci-dev libpipewire-0.3-dev libqrcodegencpp-dev
RUN apt install -y qt6-base-dev qt6-base-private-dev libqt6svg6-dev qt6-wayland qt6-image-formats-plugins
#RUN apt install -y libasound2-dev libfdk-aac-dev libfontconfig-dev libfreetype6-dev libjack-jackd2-dev libpulse-dev libsndio-dev libspeexdsp-dev libudev-dev libv4l-dev libva-dev libvlc-dev libvpl-dev libdrm-dev nlohmann-json3-dev libwebsocketpp-dev libasio-dev
RUN apt install -y libasound2-dev libfontconfig-dev libfreetype6-dev libjack-jackd2-dev libpulse-dev libsndio-dev libspeexdsp-dev libudev-dev libv4l-dev libva-dev libvlc-dev libvpl-dev libdrm-dev nlohmann-json3-dev libwebsocketpp-dev libasio-dev

RUN git clone --depth 1 --branch $OBS_VERSION --recursive https://github.com/obsproject/obs-studio.git

RUN ls -hal

WORKDIR /obs-building/obs-studio

RUN chmod +x ../scripts/build-linux.sh

#ENTRYPOINT ["cmake", "--build", "/obs-building/out"]
CMD ["../scripts/build-linux.sh"]
