FROM debian:buster
LABEL description="Framework for maintaining and compiling native community packages for Synology devices"
LABEL maintainer="SynoCommunity <https://github.com/SynoCommunity/spksrc/graphs/contributors>"
LABEL url="https://synocommunity.com"
LABEL vcs-url="https://github.com/SynoCommunity/spksrc"

ENV LANG C.UTF-8

# Manage i386 arch
RUN dpkg --add-architecture i386

# Install required packages (in sync with README.rst instructions)
RUN apt-get update && apt-get install --no-install-recommends -y \
		autoconf-archive \
		autogen \
		automake \
		bc \
		bison \
		build-essential \
		check \
		cmake \
		curl \
                debootstrap \
                debuerreotype \
		ed \
		expect \
		fakeroot \
		flex \
		g++-multilib \
		gawk \
		gettext \
		git \
		gperf \
		imagemagick \
		intltool \
		jq \
		libbz2-dev \
		libc6-i386 \
		libcppunit-dev \
		libffi-dev \
		libgc-dev \
		libgmp3-dev \
		libltdl-dev \
		libmount-dev \
		libncurses-dev \
		libpcre3-dev \
		libssl-dev \
		libtool \
		libunistring-dev \
		lzip \
		mercurial \
		moreutils \
		ncurses-dev \
		pkg-config \
		rename \
		rsync \
		scons \
		sudo \
		swig \
		unzip \
		xmlto \
		zlib1g-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	adduser --disabled-password --gecos '' user && \
	adduser user sudo && \
	echo "%users ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/users

# Volume pointing to spksrc sources
VOLUME /spksrc

WORKDIR /spksrc
