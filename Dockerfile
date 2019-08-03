FROM python:3.7-alpine

MAINTAINER softlabperu.com

COPY instantclient-basic-linux.x64-12.2.0.1.0.zip /

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
            gcc \
            g++ \
            make \
            libaio \
            automake \
            libc-dev \
            musl-dev \
            pcre-dev \
            python3-dev \
            linux-headers

RUN unzip instantclient-basic-linux.x64-12.2.0.1.0.zip && \
    mv instantclient_12_2/ /usr/lib/ && \
    rm instantclient-basic-linux.x64-12.2.0.1.0.zip && \
    ln /usr/lib/instantclient_12_2/libclntsh.so.12.1 /usr/lib/libclntsh.so && \
    ln /usr/lib/instantclient_12_2/libocci.so.12.1 /usr/lib/libocci.so && \
    ln /usr/lib/instantclient_12_2/libociei.so /usr/lib/libociei.so && \
    ln /usr/lib/instantclient_12_2/libnnz12.so /usr/lib/libnnz12.so


ENV ORACLE_BASE /usr/lib/instantclient_12_2
ENV LD_LIBRARY_PATH /usr/lib/instantclient_12_2
ENV TNS_ADMIN /usr/lib/instantclient_12_2
ENV ORACLE_HOME /usr/lib/instantclient_12_2
