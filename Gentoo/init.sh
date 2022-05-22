eselect profile list

read -p "install KDE? " KDE

if [ $KDE in [Yy]* ]; then 
	sudo eselect profile set 9
	sudo touch /etc/portage/package.use/kde
	sudo echo "kde-plasma/plasma-meta bluetooth browser-integration colord crash-handler crypt desktop-portal discover display-manager grub gtk handbook kwallet legacy-systray networkmanager sddm smart systemd wallpapers" >> /etc/portage/package.accept_keywords/kde
	sudo emerge -auDN @world plasma-meta kdeaccessibility-meta kdeadmin-meta kdecore-meta kdegraphics-meta kdenetwork-meta kdeutils-meta libreoffice-bin firefox-bin
	sudo systemctl enable sddm
fi
eselect profile list
