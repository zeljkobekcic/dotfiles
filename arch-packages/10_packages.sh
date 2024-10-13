packages=(
	# base packages
	base 
	base-devel
	linux 
	linux-firmware
	amd-ucode
	lvm2 
	cryptsetup

	# certificates
	ca-certificates
	ca-certificates-mozilla
	ca-certificates-utils

	# desktop environment
	sway
	swaybg
	sway-contrib
	i3blocks
	mako
	kitty
	wofi
	udiskie # also follow: https://github.com/coldfix/udiskie/wiki/Permissions
	udisks2

	# file manager
	thunar
	thunar-volman
	thunar-archive-plugin

	# editing
	neovim
	tree-sitter
	tree-sitter-cli

	# shell utils
	stow
	zsh
	starship
	direnv
	eza
	lazygit
	lsof
	fzf
	jq
	wl-clipboard
	zip 
	unzip
	wget
	ripgrep
	git-delta
	less
	coreutils
	openssh
	openssl
	grim
	slurp
	libisoburn
	dmidecode

	# kubernetes stuff
	kubectl
	helm
	k9s

	# virtualization stuff
	docker
	qemu-full
	virt-manager # mange VMs via GUI

	# enable for user by running
	# systemctl --user enable syncthing.service
	syncthing

	# network packages
	networkmanager

	# blutooth packages
  	bluez
  	bluez-utils
  	blueman

	# development packages
	git 
	gcc
	python-pip # needed for mason (neovim) too
	nodejs
	npm
	go
	tflint # I manage my terraform via tfenv
	make
	mdformat # for formatting md files consistently (used with neovim together)

	# fonts
	noto-fonts
	noto-fonts-extra 
	noto-fonts-emoji
	ttf-font-awesome

	# desktop applications
	gtk3
	qt5-wayland # to make qt5 applications work on wayland
	keepassxc
	firefox
	chromium # some applications still behave badly with firefox, that's why I use chromium sometimes
	imv # image viewer
	mpv # media player (video)

	# music
	strawberry
	gst-libav
	playerctl

	# audio packages
	# please read: https://wiki.archlinux.org/title/PipeWire#Audio
	# - make sure to read the docs and enable the user systemd services
	# note for myself:
	# - make sure the USB microphone is only configured as a input device and not as an output device, this will break audio!
	# - make sure the USB to 3.5mm split jack is configured as stereo audio + mono input, although there is no microphone on this part record audio
	pipewire 
	pipewire-pulse
	pipewire-audio
	pipewire-alsa
	wireplumber
	pavucontrol

	# android packages
	android-file-transfer
)

sudo pacman -S ${packages[@]}
