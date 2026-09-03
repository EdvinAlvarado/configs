#!/usr/bin/env fish
wget https://guix.gnu.org/guix-install.sh &&
chmod +x guix-install.sh &&
# Using ftpmirror.gnu.org instead of main site to reduce load on the main server and get faster downloads
sed -i 's/ftp.gnu.org/ftpmirror.gnu.org/g' guix-install.sh &&
./guix-install.sh

if guix build hello
then
	guix pull --url=https://codeberg.org/guix/guix 
	hash guix
	# Custmom locales
	guix package -f my-locales.scm &&
		export GUIX_LOCPATH=$HOME/.guix-profile/lib/locale &&
		guix package --search-paths -p "/home/edvin/.guix-profile"
	# Fonts
	guix install font-ghostscript font-dejavu font-gnu-freefont &&
		guix install fontconfig &&
		fc-cache -rv &&
		guix package --search-paths -p "/home/edvin/.guix-profile"
	# Fonts for Chinese, Japanese, and Korean
	guix install font-adobe-source-han-sans
	# Certificates
	guix install nss-certs
else:
	echo "Guix build failed. Please check the installation."
end
