;; manifest.scm
(use-modules (guix packages)
             (gnu)
             (gnu packages rust)
             (gnu packages rust-apps)
             (gnu packages tls)
             (gnu packages pkg-config))

(packages->manifest
 (list openssl
       pkg-config
       rust
       (list rust "cargo")   ; Cargo
       (list rust "tools")   ; clippy, rustfmt, rust-src
       rust-analyzer
       cargo-audit
       cargo-license))
