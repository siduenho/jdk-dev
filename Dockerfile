FROM openjdk:8-jdk
MAINTAINER Simon Dünhöft <simongt95@gmail.com>
LABEL Description="OpenJDK package including OpenJFX (JavaFX) and various build systems (ant, maven, gradle)" Version="8"

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list

RUN apt-get update -qq \
  && apt-get install --no-install-recommends -y -t jessie-backports openjfx ant maven \
  && apt-get clean

RUN wget https://services.gradle.org/distributions/gradle-4.0.2-bin.zip \
  && mkdir /opt/gradle \
  && unzip -d /opt/gradle gradle-4.0.2-bin.zip \
  && export PATH=$PATH:/opt/gradle/gradle-4.0.2/bin
