## Framework specific configuration
# Assumes systemdbootctl
sudo sed -i 's/ $/ nvme.noacpi=1/g' /boot/loader/entries/*conf 

# Fingerprint
sudo pacman -S fprintd
echo "" | sudo tee -a /usr/lib/systemd/system/fprintd.service
echo "[Install]" | sudo tee -a /usr/lib/systemd/system/fprintd.service
echo "WantedBy=multi-user.target" | sudo tee -a /usr/lib/systemd/system/fprintd.service
sudo systemctl restart fprintd.service
sudo systemctl enable fprintd.service
fprintd-delete $USER
frpintd-enroll
fprintd-verify
# Assumes kde
sudo sed -i '1s/^/auth\t\sufficient\tpam_fprintd.so\n/' /etc/pam.d/sddm
sudo sed -i '1s/^/auth\t\[success=1 new_authtok_reqd=1 default=ignore\]\tpam_unix.so try_first_pass likeauth nullok\n/' /etc/pam.d/sddm
# in lock screen press entter to use Fingerprint
sudo sed -i '1s/^/auth\t\sufficient\tpam_fprintd.so\n/' /etc/pam.d/kde
sudo sed -i '1s/^/auth\t\sufficient\tpam_unix.so try_first_pass likeauth nullok\n/' /etc/pam.d/kde 
sudo sed -i '1s/^/auth\t\sufficient\tpam_fprintd.so\n/' /etc/pam.d/login
sudo sed -i '1s/^/auth\t\sufficient\tpam_unix.so try_first_pass likeauth nullok\n/' /etc/pam.d/login 
sudo sed -i '1s/^/auth\t\sufficient\tpam_fprintd.so\n/' /etc/pam.d/su
sudo sed -i '1s/^/auth\t\sufficient\tpam_unix.so try_first_pass likeauth nullok\n/' /etc/pam.d/su 
sudo sed -i '1s/^/auth\t\sufficient\tpam_fprintd.so\n/' /etc/pam.d/sudo
sudo sed -i '1s/^/auth\t\sufficient\tpam_unix.so try_first_pass likeauth nullok\n/' /etc/pam.d/sudo 
sudo sed -i '1s/^/auth\t\sufficient\tpam_fprintd.so\n/' /etc/pam.d/polkit-1
sudo sed -i '1s/^/auth\t\sufficient\tpam_unix.so try_first_pass likeauth nullok\n/' /etc/pam.d/polkit-1 


echo ""
echo "For touchpad\t - Go to system settings > touchpad and activate tap-and-click"
