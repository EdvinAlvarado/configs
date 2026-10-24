;; -*- mode: scheme; -*-

(use-modules (gnu)
       (gnu services)
       (gnu services linux)
       (gnu system nss)
       (gnu packages cryptsetup)
       (gnu packages emacs)
       (gnu packages disk)
       (gnu packages linux)
       (gnu packages rust)
       (gnu packages rust-apps)
       (gnu packages package-management)
       (gnu packages perl)
       (gnu packages shells)
       (gnu packages version-control)
       (gnu packages vim)
       (guix utils)
       (guix packages)
       (nongnu packages linux)
       (nongnu system linux-initrd))
(use-service-modules desktop sddm xorg)

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (host-name "guix")
  (timezone "America/Chicago")
  (locale "en_US.utf8")
  (services
    (cons*
      (service zram-device-service-type
         (zram-device-configuration
          (size "8G")
          (compression-algorithm 'zstd)))
      (service plasma-desktop-service-type)
      (service kwallet-service-type)
      (service sddm-service-type)
      (service bluetooth-service-type)
      (simple-service 'nonguix-substitutes guix-service-type
          (guix-extension
           (substitute-urls (list "https://substitutes.nonguix.org"))
           (authorized-keys (list (local-file "signing-key.pub")))))
      (modify-services %desktop-services
           (delete gdm-service-type))))


  ;; Choose US English keyboard layout.  The "altgr-intl"
  ;; variant provides dead keys for accented characters.
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))

  ;; Use the UEFI variant of GRUB with the EFI System
  ;; Partition mounted on /boot/efi.
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

  ;; Specify a mapped device for the encrypted root partition.
  ;; The UUID is that returned by 'cryptsetup luksUUID'.
  (mapped-devices
   (list (mapped-device
          (source (uuid "UUIDR"))
          (target "ROOT")
          (type luks-device-mapping))))

  (file-systems (append
                 (list (file-system
                         (device (file-system-label "ROOT"))
                         (mount-point "/")
                         (type "btrfs")
                        (options "compress=zstd,subvol=@")
                        (dependencies mapped-devices))
                  (file-system
                          (device (file-system-label "ROOT"))
                          (mount-point "/home")
                          (type "btrfs")
                   (options "compress=zstd,subvol=@home")
                   (dependencies mapped-devices))
                  (file-system
                          (device (file-system-label "ROOT"))
                          (mount-point "/.snapshots")
                          (type "btrfs")
                   (options "compress=zstd,subvol=@snapshots")
                   (dependencies mapped-devices))
                  (file-system
                          (device (file-system-label "ROOT"))
                          (mount-point "/home/.snapshots")
                          (type "btrfs")
                   (options "compress=zstd,subvol=@home/.snapshots")
                   (dependencies mapped-devices))
                  (file-system
                          (device (file-system-label "ROOT"))
                          (mount-point "/gnu/store")
                          (type "btrfs")
                   (options "compress=zstd,subvol=@gnu-store")
                   (dependencies mapped-devices))
                  (file-system
                    (device (uuid "UUIDB" 'fat))
                    (mount-point "/boot/efi")
                    (type "vfat")))
                 %base-file-systems))


  (users (cons (user-account
                (name "edvin")
                (comment "Edvin Alvarado")
                (group "users")
                (shell (file-append fish "/bin/fish"))
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video")))
               %base-user-accounts))


  ;; This is where we specify system-wide packages.
  (packages (append (list
                     git
                     cryptsetup
                     ranger
                     stow
                     vim
                     emacs
                     flatpak
                     fish
                     perl)
                    %base-packages))


  ;; Allow resolution of '.local' host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
