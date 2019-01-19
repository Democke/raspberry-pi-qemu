FROM resin/raspberrypi3-debian:stretch
#balena script that kicks off QEMU emulation
RUN ["cross-build-start"]
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
RUST_VERSION=1.31.1
RUN apt-get update && apt-get -y install --no-install-recommends build-essential
RUN curl https://sh.rustup.rs -fsS | bash -s -- -y
COPY . /cross-comp
#VOLUME /cross-comp
WORKDIR /cross-comp
RUN cargo run
RUN ["cross-build-end"]
#--target=armv7-unknown-linux-gnueabihf