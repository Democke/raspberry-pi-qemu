FROM resin/raspberrypi3-debian:stretch
#balena script that kicks off QEMU emulation
RUN ["cross-build-start"]
RUN echo "setting ENV variables"
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
RUST_VERSION=1.31.1
RUN echo "Starting apt-get update"
RUN apt-get update && apt-get -y install --no-install-recommends build-essential
RUN echo "Starting curl for rust"
RUN curl https://sh.rustup.rs -fsS | bash -s -- -y
RUN echo "Starting copy of local directory"
COPY . /cross-comp
#VOLUME /cross-comp
RUN echo "Setting working directory"
WORKDIR /cross-comp
RUN echo "Attempting cargo run"
RUN cargo run
RUN echo "running cross-build-end"
RUN ["cross-build-end"]
RUN echo "Done!"
#--target=armv7-unknown-linux-gnueabihf