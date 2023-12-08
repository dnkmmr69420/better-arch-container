FROM 	quay.io/toolbx-images/archlinux-toolbox:latest

LABEL 	com.github.containers.toolbox="true" \
      	usage="This image is meant to be used with the toolbox or distrobox command" \
      	summary="A cloud-native terminal experience" \
      	maintainer="dnkmmr"

RUN   	pacman -Syu

RUN   	ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      	ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      	ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      	ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      	ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
     
RUN	pacman -S base-devel git

# Create build user
RUN   	useradd -m --shell=/bin/bash build && usermod -L build && \
      	echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
      	echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER	build
WORKDIR	/home/build

RUN	git clone https://aur.archlinux.org/yay.git && \
	cd yay && \
	makepkg -si

USER 	root
WORKDIR /
	
