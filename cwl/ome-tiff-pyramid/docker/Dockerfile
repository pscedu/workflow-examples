ARG BUILD_IMAGE=gradle:6.2.1-jdk8

#
# Build phase: Use the gradle image for building.
#
FROM ${BUILD_IMAGE} as build

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq \
 && apt-get -y install \
    libblosc1 \
    tzdata \
    zeroc-ice-all-runtime \
    zip \
 && rm -rf /var/cache/apt/*

WORKDIR /opt
RUN wget https://github.com/glencoesoftware/bioformats2raw/releases/download/v0.2.6/bioformats2raw-0.2.6.zip -O bioformats2raw.zip \
 && unzip bioformats2raw.zip \
 && mv bioformats2raw-0.2.6 bioformats2raw \
 && rm bioformats2raw.zip

WORKDIR /bioformats_pyramid

ENV RAW2OMETIFF_VERSION=v0.2.7
# Clone raw pyramid to tiff repo.
RUN git clone -b ${RAW2OMETIFF_VERSION} https://github.com/glencoesoftware/raw2ometiff.git \
 && cd raw2ometiff \
 && gradle build \
 && cd build/distributions \
 && rm raw2ometiff*tar \
 && unzip raw2ometiff*zip \
 && rm -f raw2ometiff*zip \
 && cd ../.. \
 && mv build/distributions/raw2ometiff* /opt/raw2ometiff

# Set working directory containing new cli tools.
WORKDIR /opt
COPY bin /opt

CMD ["/bin/bash"]
