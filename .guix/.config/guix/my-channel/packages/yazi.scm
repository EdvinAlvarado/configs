(define-module (packages yazi)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (gnu packages compression) ; unzip
  #:use-module (gnu packages elf)         ; patchelf
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:export (yazi))

(define-public yazi
  (package
    (name "yazi")
    (version "26.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sxyazi/yazi/releases/download/v"
             version "/yazi-x86_64-unknown-linux-gnu.zip"))
       (file-name (string-append name "-" version ".zip"))
       ;; sha256 of the zip (hex):
       ;; a02fe91d3304294048c681f010f1100856872a4e98ecf6927328e888d40a6ad2
       (sha256
        (base32 "1lka1ba8is18ff9gdv4q9qm8fmh823qi1w41qr440a846cfyjbx0"))))
    (build-system copy-build-system)
    (arguments
     (list
       ;; unpacks zip file chdirs into folder.
       #:install-plan
       #~'(("yazi" "bin/")
           ("ya" "bin/"))
       #:phases
       #~(modify-phases %standard-phases
                        (add-after 'install 'patchelf
                                   (lambda* (#:key inputs outputs #:allow-other-keys)
                                            (let* ((ld-so (search-input-file
                                                           inputs "/lib/ld-linux-x86-64.so.2"))
                                                   (libgcc-dir (dirname (search-input-file inputs "/lib/libgcc_s.so.1")))
                                                   (rpath (string-append libgcc-dir ":"
                                                                         #$(this-package-input "glibc")
                                                                         "/lib")))
                                                   
                                              (for-each
                                                (lambda (bin)
                                                  (let ((file (string-append #$output "/bin/" bin)))
                                                    (invoke "patchelf" "--set-interpreter"  ld-so  file)
                                                    (invoke "patchelf" "--set-rpath" rpath file)))
                                                '("yazi" "ya"))))))))
    (native-inputs (list unzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://yazi-rs.github.io/")
    (synopsis "Blazing fast terminal file manager (prebuilt binary)")
    (description
     "Yazi is a terminal file manager written in Rust, based on non-blocking
async I/O.  This package installs the official prebuilt x86_64 Linux binary
from the upstream GitHub release, including the @command{ya} CLI companion.")
    (license expat)))

