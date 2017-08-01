FROM openjdk:8-jdk
MAINTAINER Simon Dünhöft <simongt95@gmail.com>
LABEL Description="OpenJDK package including OpenJFX (JavaFX) and various build systems (ant, maven, gradle)" Version="8"

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list
RUN echo "deb http://ppa.launchpad.net/cwchien/gradle/ubuntu YOUR_UBUNTU_VERSION_HERE main" > /etc/apt/sources.list.d/gradle.list

RUN apt-get update -qq \
  && apt-get install --no-install-recommends -y -t jessie-backports openjfx ant maven \
  && apt-get install --no-install-recommends -y gradle \
  && apt-get clean
