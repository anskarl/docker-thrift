FROM openjdk:8-jdk-stretch
LABEL maintainer="Anastasios Skarkatidis"

ARG ARG_THRIFT_VERSION
ENV THRIFT_VERSION=$ARG_THRIFT_VERSION

RUN echo "=== Apache Thrift version: $THRIFT_VERSION ==="

# Add Apache Ant and Maven
RUN apt-get update \
    && apt-get install -y --no-install-recommends ant maven

# Temporary installation of Apache Thrift compilation dependencies
# Build and install Thrift with Java supoort
RUN buildDeps=" \
    automake \
    bison \
    curl \
    flex \
    g++ \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-test-dev \
    libevent-dev \
    libssl-dev \
    libtool \
    make \
    pkg-config \
  "; \
  apt-get update && apt-get install -y --no-install-recommends $buildDeps && rm -rf /var/lib/apt/lists/* \
  && curl -sSL "http://apache.mirrors.spacedump.net/thrift/$THRIFT_VERSION/thrift-$THRIFT_VERSION.tar.gz" -o thrift.tar.gz \
  && mkdir -p /usr/src/thrift \
  && tar zxf thrift.tar.gz -C /usr/src/thrift --strip-components=1 \
  && rm thrift.tar.gz \
  && cd /usr/src/thrift \
  && ./configure  --without-python --without-cpp \
  && make \
  && make install \
  && cd / \
  && rm -rf /usr/src/thrift \
  && curl -k -sSL "https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz" -o go.tar.gz \
  && tar xzf go.tar.gz \
  && rm go.tar.gz \
  && cp go/bin/gofmt /usr/bin/gofmt \
  && rm -rf go \
  && apt-get purge -y --auto-remove $buildDeps


RUN mkdir /data
WORKDIR /data

ENTRYPOINT ["thrift"]

