(define-public cargo-audit
  (package
    (name "cargo-audit")
    (version "0.22.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cargo-audit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0am1bcapzdmj00231ipw65jnfnrsywly8pv79g131lvz1wj2n33h"))))
    (build-system cargo-build-system)
    (inputs (cargo-inputs 'cargo-audit))
    (home-page "https://rustsec.org")
    (synopsis "Audit Cargo.lock for crates with security vulnerabilities")
    (description
     "This package provides Audit Cargo.lock for crates with security vulnerabilities.")
    (license (list license:asl2.0 license:expat))))

(define-cargo-inputs lookup-cargo-inputs
                     (cargo-audit =>
                                  (list rust-abscissa-core-0.9.0
                                   rust-abscissa-derive-0.9.0
                                   rust-addr2line-0.25.1
                                   rust-adler2-2.0.1
                                   rust-aho-corasick-1.1.4
                                   rust-allocator-api2-0.2.21
                                   rust-android-system-properties-0.1.5
                                   rust-anstream-1.0.0
                                   rust-anstyle-1.0.14
                                   rust-anstyle-parse-1.0.0
                                   rust-anstyle-query-1.1.5
                                   rust-anstyle-wincon-3.0.11
                                   rust-anyhow-1.0.102
                                   rust-arc-swap-1.9.1
                                   rust-arrayvec-0.7.6
                                   rust-askama-0.16.0
                                   rust-askama-derive-0.16.0
                                   rust-askama-macros-0.16.0
                                   rust-askama-parser-0.16.0
                                   rust-async-compression-0.4.42
                                   rust-atom-syndication-0.12.8
                                   rust-atomic-waker-1.1.2
                                   rust-auditable-extract-0.3.5
                                   rust-auditable-info-0.10.0
                                   rust-auditable-serde-0.9.0
                                   rust-autocfg-1.5.0
                                   rust-aws-lc-rs-1.16.3
                                   rust-aws-lc-sys-0.40.0
                                   rust-backtrace-0.3.76
                                   rust-base64-0.22.1
                                   rust-basic-toml-0.1.10
                                   rust-binfarce-0.2.1
                                   rust-bitflags-2.11.1
                                   rust-block-buffer-0.10.4
                                   rust-borsh-1.6.1
                                   rust-bstr-1.12.1
                                   rust-bumpalo-3.20.2
                                   rust-byteorder-1.5.0
                                   rust-bytes-1.11.1
                                   rust-camino-1.2.2
                                   rust-canonical-path-2.0.2
                                   rust-caseless-0.2.2
                                   rust-cc-1.2.62
                                   rust-cfg-if-1.0.4
                                   rust-cfg-aliases-0.2.1
                                   rust-chrono-0.4.44
                                   rust-clap-4.6.1
                                   rust-clap-builder-4.6.0
                                   rust-clap-derive-4.6.1
                                   rust-clap-lex-1.1.0
                                   rust-clru-0.6.3
                                   rust-cmake-0.1.58
                                   rust-color-eyre-0.6.5
                                   rust-colorchoice-1.0.5
                                   rust-combine-4.6.7
                                   rust-compression-codecs-0.4.38
                                   rust-compression-core-0.4.32
                                   rust-comrak-0.52.0
                                   rust-core-foundation-0.10.1
                                   rust-core-foundation-sys-0.8.7
                                   rust-cpufeatures-0.2.17
                                   rust-crc32fast-1.5.0
                                   rust-crossbeam-channel-0.5.15
                                   rust-crossbeam-deque-0.8.6
                                   rust-crossbeam-epoch-0.9.18
                                   rust-crossbeam-utils-0.8.21
                                   rust-crypto-common-0.1.7
                                   rust-curl-0.4.49
                                   rust-curl-sys-0.4.88+curl-8.20.0
                                   rust-darling-0.20.11
                                   rust-darling-core-0.20.11
                                   rust-darling-macro-0.20.11
                                   rust-deranged-0.5.8
                                   rust-derive-builder-0.20.2
                                   rust-derive-builder-core-0.20.2
                                   rust-derive-builder-macro-0.20.2
                                   rust-digest-0.10.7
                                   rust-diligent-date-parser-0.1.5
                                   rust-display-error-chain-0.2.2
                                   rust-displaydoc-0.2.5
                                   rust-dunce-1.0.5
                                   rust-either-1.15.0
                                   rust-encoding-rs-0.8.35
                                   rust-entities-1.0.1
                                   rust-equivalent-1.0.2
                                   rust-errno-0.3.14
                                   rust-eyre-0.6.12
                                   rust-faster-hex-0.10.0
                                   rust-fastrand-2.4.1
                                   rust-filetime-0.2.28
                                   rust-find-msvc-tools-0.1.9
                                   rust-finl-unicode-1.4.0
                                   rust-fixedbitset-0.5.7
                                   rust-flate2-1.1.9
                                   rust-fnv-1.0.7
                                   rust-foldhash-0.1.5
                                   rust-foldhash-0.2.0
                                   rust-form-urlencoded-1.2.2
                                   rust-fs-err-3.3.0
                                   rust-fs-extra-1.3.0
                                   rust-futures-channel-0.3.32
                                   rust-futures-core-0.3.32
                                   rust-futures-io-0.3.32
                                   rust-futures-sink-0.3.32
                                   rust-futures-task-0.3.32
                                   rust-futures-util-0.3.32
                                   rust-generic-array-0.14.7
                                   rust-getrandom-0.2.17
                                   rust-getrandom-0.3.4
                                   rust-getrandom-0.4.2
                                   rust-gimli-0.32.3
                                   rust-gix-0.84.0
                                   rust-gix-actor-0.41.1
                                   rust-gix-attributes-0.33.1
                                   rust-gix-bitmap-0.3.2
                                   rust-gix-chunk-0.7.2
                                   rust-gix-command-0.9.1
                                   rust-gix-commitgraph-0.37.1
                                   rust-gix-config-0.57.0
                                   rust-gix-config-value-0.18.1
                                   rust-gix-credentials-0.38.1
                                   rust-gix-date-0.15.4
                                   rust-gix-diff-0.64.0
                                   rust-gix-discover-0.52.0
                                   rust-gix-error-0.2.4
                                   rust-gix-features-0.48.1
                                   rust-gix-filter-0.31.0
                                   rust-gix-fs-0.21.2
                                   rust-gix-glob-0.26.1
                                   rust-gix-hash-0.25.1
                                   rust-gix-hashtable-0.15.1
                                   rust-gix-ignore-0.21.1
                                   rust-gix-index-0.52.0
                                   rust-gix-lock-23.0.0
                                   rust-gix-negotiate-0.32.0
                                   rust-gix-object-0.61.0
                                   rust-gix-odb-0.81.0
                                   rust-gix-pack-0.71.0
                                   rust-gix-packetline-0.21.4
                                   rust-gix-path-0.12.1
                                   rust-gix-pathspec-0.18.1
                                   rust-gix-prompt-0.15.1
                                   rust-gix-protocol-0.62.0
                                   rust-gix-quote-0.7.2
                                   rust-gix-ref-0.64.0
                                   rust-gix-refspec-0.42.0
                                   rust-gix-revision-0.46.0
                                   rust-gix-revwalk-0.32.0
                                   rust-gix-sec-0.14.1
                                   rust-gix-shallow-0.12.1
                                   rust-gix-submodule-0.31.0
                                   rust-gix-tempfile-23.0.0
                                   rust-gix-trace-0.1.20
                                   rust-gix-transport-0.57.1
                                   rust-gix-traverse-0.58.0
                                   rust-gix-url-0.36.1
                                   rust-gix-utils-0.3.3
                                   rust-gix-validate-0.11.2
                                   rust-gix-worktree-0.53.0
                                   rust-gix-worktree-state-0.31.0
                                   rust-gix-worktree-stream-0.33.0
                                   rust-glob-0.3.3
                                   rust-gumdrop-0.8.1
                                   rust-gumdrop-derive-0.8.1
                                   rust-h2-0.4.14
                                   rust-hash32-0.3.1
                                   rust-hashbrown-0.15.5
                                   rust-hashbrown-0.16.1
                                   rust-hashbrown-0.17.1
                                   rust-heapless-0.8.0
                                   rust-heck-0.5.0
                                   rust-home-0.5.12
                                   rust-http-1.4.0
                                   rust-http-body-1.0.1
                                   rust-http-body-util-0.1.3
                                   rust-httparse-1.10.1
                                   rust-hyper-1.9.0
                                   rust-hyper-rustls-0.27.9
                                   rust-hyper-util-0.1.20
                                   rust-iana-time-zone-0.1.65
                                   rust-iana-time-zone-haiku-0.1.2
                                   rust-icu-collections-2.1.1
                                   rust-icu-locale-core-2.1.1
                                   rust-icu-normalizer-2.1.1
                                   rust-icu-normalizer-data-2.1.1
                                   rust-icu-properties-2.1.2
                                   rust-icu-properties-data-2.1.2
                                   rust-icu-provider-2.1.1
                                   rust-id-arena-2.3.0
                                   rust-ident-case-1.0.1
                                   rust-idna-1.1.0
                                   rust-idna-adapter-1.2.1
                                   rust-indenter-0.3.4
                                   rust-indexmap-2.14.0
                                   rust-io-close-0.3.7
                                   rust-ipnet-2.12.0
                                   rust-is-terminal-polyfill-1.70.2
                                   rust-itoa-1.0.18
                                   rust-jetscii-0.5.3
                                   rust-jiff-0.2.28
                                   rust-jiff-static-0.2.28
                                   rust-jiff-tzdb-0.1.6
                                   rust-jiff-tzdb-platform-0.1.3
                                   rust-jni-0.22.4
                                   rust-jni-macros-0.22.4
                                   rust-jni-sys-0.4.1
                                   rust-jni-sys-macros-0.4.1
                                   rust-jobserver-0.1.34
                                   rust-js-sys-0.3.98
                                   rust-kstring-2.0.2
                                   rust-lazy-static-1.5.0
                                   rust-leb128fmt-0.1.0
                                   rust-libc-0.2.186
                                   rust-libz-sys-1.1.28
                                   rust-linux-raw-sys-0.12.1
                                   rust-litemap-0.8.2
                                   rust-lock-api-0.4.14
                                   rust-log-0.4.29
                                   rust-lru-slab-0.1.2
                                   rust-matchers-0.2.0
                                   rust-maybe-async-0.2.10
                                   rust-memchr-2.8.0
                                   rust-memmap2-0.9.10
                                   rust-mime-0.3.17
                                   rust-miniz-oxide-0.8.9
                                   rust-mio-1.2.0
                                   rust-nonempty-0.12.0
                                   rust-nu-ansi-term-0.50.3
                                   rust-num-conv-0.2.1
                                   rust-num-traits-0.2.19
                                   rust-object-0.37.3
                                   rust-object-0.39.1
                                   rust-once-cell-1.21.4
                                   rust-once-cell-polyfill-1.70.2
                                   rust-openssl-probe-0.2.1
                                   rust-owo-colors-4.3.0
                                   rust-parking-lot-0.12.5
                                   rust-parking-lot-core-0.9.12
                                   rust-percent-encoding-2.3.2
                                   rust-petgraph-0.8.3
                                   rust-phf-0.13.1
                                   rust-phf-codegen-0.13.1
                                   rust-phf-generator-0.13.1
                                   rust-phf-shared-0.13.1
                                   rust-pin-project-lite-0.2.17
                                   rust-pkg-config-0.3.33
                                   rust-portable-atomic-1.13.1
                                   rust-portable-atomic-util-0.2.7
                                   rust-potential-utf-0.1.5
                                   rust-powerfmt-0.2.0
                                   rust-ppv-lite86-0.2.21
                                   rust-prettyplease-0.2.37
                                   rust-proc-macro2-1.0.106
                                   rust-prodash-31.0.0
                                   rust-quick-xml-0.39.4
                                   rust-quinn-0.11.9
                                   rust-quinn-proto-0.11.14
                                   rust-quinn-udp-0.5.14
                                   rust-quote-1.0.45
                                   rust-r-efi-5.3.0
                                   rust-r-efi-6.0.0
                                   rust-rand-0.9.4
                                   rust-rand-chacha-0.9.0
                                   rust-rand-core-0.9.5
                                   rust-rayon-1.12.0
                                   rust-rayon-core-1.13.0
                                   rust-redox-syscall-0.5.18
                                   rust-regex-1.12.3
                                   rust-regex-automata-0.4.14
                                   rust-regex-syntax-0.8.10
                                   rust-reqwest-0.13.3
                                   rust-ring-0.17.14
                                   rust-rust-embed-8.11.0
                                   rust-rust-embed-impl-8.11.0
                                   rust-rust-embed-utils-8.11.0
                                   rust-rustc-demangle-0.1.27
                                   rust-rustc-hash-2.1.2
                                   rust-rustc-stable-hash-0.1.2
                                   rust-rustc-version-0.4.1
                                   rust-rustix-1.1.4
                                   rust-rustls-0.23.40
                                   rust-rustls-native-certs-0.8.3
                                   rust-rustls-pki-types-1.14.1
                                   rust-rustls-platform-verifier-0.7.0
                                   rust-rustls-platform-verifier-android-0.1.1
                                   rust-rustls-webpki-0.103.13
                                   rust-rustversion-1.0.22
                                   rust-same-file-1.0.6
                                   rust-schannel-0.1.29
                                   rust-scopeguard-1.2.0
                                   rust-secrecy-0.10.3
                                   rust-security-framework-3.7.0
                                   rust-security-framework-sys-2.17.0
                                   rust-semver-1.0.28
                                   rust-serde-1.0.228
                                   rust-serde-core-1.0.228
                                   rust-serde-derive-1.0.228
                                   rust-serde-json-1.0.149
                                   rust-serde-spanned-1.1.1
                                   rust-sha1-0.10.6
                                   rust-sha1-checked-0.10.0
                                   rust-sha2-0.10.9
                                   rust-sharded-slab-0.1.7
                                   rust-shell-words-1.1.1
                                   rust-shlex-1.3.0
                                   rust-simd-adler32-0.3.9
                                   rust-simd-cesu8-1.1.1
                                   rust-simdutf8-0.1.5
                                   rust-siphasher-1.0.3
                                   rust-slab-0.4.12
                                   rust-smallvec-1.15.1
                                   rust-smol-str-0.3.2
                                   rust-socket2-0.6.3
                                   rust-stable-deref-trait-1.2.1
                                   rust-static-assertions-1.1.0
                                   rust-strsim-0.11.1
                                   rust-subtle-2.6.1
                                   rust-syn-1.0.109
                                   rust-syn-2.0.117
                                   rust-sync-wrapper-1.0.2
                                   rust-synstructure-0.13.2
                                   rust-tame-index-0.26.3
                                   rust-tempfile-3.27.0
                                   rust-termcolor-1.4.1
                                   rust-thiserror-2.0.18
                                   rust-thiserror-impl-2.0.18
                                   rust-thread-local-1.1.9
                                   rust-time-0.3.47
                                   rust-time-core-0.1.8
                                   rust-time-macros-0.2.27
                                   rust-tinystr-0.8.3
                                   rust-tinyvec-1.11.0
                                   rust-tinyvec-macros-0.1.1
                                   rust-tokio-1.52.3
                                   rust-tokio-rustls-0.26.4
                                   rust-tokio-util-0.7.18
                                   rust-toml-0.9.12+spec-1.1.0
                                   rust-toml-1.1.2+spec-1.1.0
                                   rust-toml-span-0.7.1
                                   rust-toml-datetime-0.7.5+spec-1.1.0
                                   rust-toml-datetime-1.1.1+spec-1.1.0
                                   rust-toml-edit-0.25.12+spec-1.1.0
                                   rust-toml-parser-1.1.2+spec-1.1.0
                                   rust-toml-writer-1.1.1+spec-1.1.0
                                   rust-topological-sort-0.2.2
                                   rust-tower-0.5.3
                                   rust-tower-http-0.6.10
                                   rust-tower-layer-0.3.3
                                   rust-tower-service-0.3.3
                                   rust-tracing-0.1.44
                                   rust-tracing-attributes-0.1.31
                                   rust-tracing-core-0.1.36
                                   rust-tracing-log-0.2.0
                                   rust-tracing-subscriber-0.3.23
                                   rust-try-lock-0.2.5
                                   rust-twox-hash-2.1.2
                                   rust-typed-arena-2.0.2
                                   rust-typenum-1.20.0
                                   rust-uluru-3.1.0
                                   rust-unicode-bom-2.0.3
                                   rust-unicode-ident-1.0.24
                                   rust-unicode-normalization-0.1.25
                                   rust-unicode-xid-0.2.6
                                   rust-untrusted-0.9.0
                                   rust-url-2.5.8
                                   rust-utf8-iter-1.0.4
                                   rust-utf8parse-0.2.2
                                   rust-valuable-0.1.1
                                   rust-vcpkg-0.2.15
                                   rust-version-check-0.9.5
                                   rust-wait-timeout-0.2.1
                                   rust-walkdir-2.5.0
                                   rust-want-0.3.1
                                   rust-wasi-0.11.1+wasi-snapshot-preview1
                                   rust-wasip2-1.0.3+wasi-0.2.9
                                   rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06
                                   rust-wasm-bindgen-0.2.121
                                   rust-wasm-bindgen-futures-0.4.71
                                   rust-wasm-bindgen-macro-0.2.121
                                   rust-wasm-bindgen-macro-support-0.2.121
                                   rust-wasm-bindgen-shared-0.2.121
                                   rust-wasm-encoder-0.244.0
                                   rust-wasm-metadata-0.244.0
                                   rust-wasmparser-0.207.0
                                   rust-wasmparser-0.244.0
                                   rust-wasmparser-0.247.0
                                   rust-web-sys-0.3.98
                                   rust-web-time-1.1.0
                                   rust-webpki-root-certs-1.0.7
                                   rust-winapi-0.3.9
                                   rust-winapi-i686-pc-windows-gnu-0.4.0
                                   rust-winapi-util-0.1.11
                                   rust-winapi-x86-64-pc-windows-gnu-0.4.0
                                   rust-windows-core-0.62.2
                                   rust-windows-implement-0.60.2
                                   rust-windows-interface-0.59.3
                                   rust-windows-link-0.2.1
                                   rust-windows-result-0.4.1
                                   rust-windows-strings-0.5.1
                                   rust-windows-sys-0.52.0
                                   rust-windows-sys-0.59.0
                                   rust-windows-sys-0.60.2
                                   rust-windows-sys-0.61.2
                                   rust-windows-targets-0.52.6
                                   rust-windows-targets-0.53.5
                                   rust-windows-aarch64-gnullvm-0.52.6
                                   rust-windows-aarch64-gnullvm-0.53.1
                                   rust-windows-aarch64-msvc-0.52.6
                                   rust-windows-aarch64-msvc-0.53.1
                                   rust-windows-i686-gnu-0.52.6
                                   rust-windows-i686-gnu-0.53.1
                                   rust-windows-i686-gnullvm-0.52.6
                                   rust-windows-i686-gnullvm-0.53.1
                                   rust-windows-i686-msvc-0.52.6
                                   rust-windows-i686-msvc-0.53.1
                                   rust-windows-x86-64-gnu-0.52.6
                                   rust-windows-x86-64-gnu-0.53.1
                                   rust-windows-x86-64-gnullvm-0.52.6
                                   rust-windows-x86-64-gnullvm-0.53.1
                                   rust-windows-x86-64-msvc-0.52.6
                                   rust-windows-x86-64-msvc-0.53.1
                                   rust-winnow-0.7.15
                                   rust-winnow-1.0.2
                                   rust-wit-bindgen-0.51.0
                                   rust-wit-bindgen-0.57.1
                                   rust-wit-bindgen-core-0.51.0
                                   rust-wit-bindgen-rust-0.51.0
                                   rust-wit-bindgen-rust-macro-0.51.0
                                   rust-wit-component-0.244.0
                                   rust-wit-parser-0.244.0
                                   rust-writeable-0.6.3
                                   rust-xml-1.3.0
                                   rust-yoke-0.8.2
                                   rust-yoke-derive-0.8.2
                                   rust-zerocopy-0.8.48
                                   rust-zerocopy-derive-0.8.48
                                   rust-zerofrom-0.1.7
                                   rust-zerofrom-derive-0.1.7
                                   rust-zeroize-1.8.2
                                   rust-zerotrie-0.2.4
                                   rust-zerovec-0.11.6
                                   rust-zerovec-derive-0.11.3
                                   rust-zlib-rs-0.6.3
                                   rust-zmij-1.0.21)))
(define rust-abscissa-core-0.9.0
  (crate-source "abscissa_core" "0.9.0"
                "1hdid9255a9kjgqy1h92dlgjzdvla3a1lfz9yv3xzaiz0a3pbn3w"))

(define rust-abscissa-derive-0.9.0
  (crate-source "abscissa_derive" "0.9.0"
                "09np3b9ya3a1487wl0pbh8m97bw8vlh3fwbdfccyrgfc5malz99x"))

(define rust-addr2line-0.25.1
  (crate-source "addr2line" "0.25.1"
                "0jwb96gv17vdr29hbzi0ha5q6jkpgjyn7rjlg5nis65k41rk0p8v"))

(define rust-adler2-2.0.1
  (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-aho-corasick-1.1.4
  (crate-source "aho-corasick" "1.1.4"
                "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx"))

(define rust-allocator-api2-0.2.21
  (crate-source "allocator-api2" "0.2.21"
                "08zrzs022xwndihvzdn78yqarv2b9696y67i6h78nla3ww87jgb8"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-anstream-1.0.0
  (crate-source "anstream" "1.0.0"
                "13d2bj0xfg012s4rmq44zc8zgy1q8k9yp7yhvfnarscnmwpj2jl2"))

(define rust-anstyle-1.0.14
  (crate-source "anstyle" "1.0.14"
                "0030szmgj51fxkic1hpakxxgappxzwm6m154a3gfml83lq63l2wl"))

(define rust-anstyle-parse-1.0.0
  (crate-source "anstyle-parse" "1.0.0"
                "03hkv2690s0crssbnmfkr76kw1k7ah2i6s5amdy9yca2n8w7zkjj"))

(define rust-anstyle-query-1.1.5
  (crate-source "anstyle-query" "1.1.5"
                "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20"))

(define rust-anstyle-wincon-3.0.11
  (crate-source "anstyle-wincon" "3.0.11"
                "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9"))

(define rust-anyhow-1.0.102
  (crate-source "anyhow" "1.0.102"
                "0b447dra1v12z474c6z4jmicdmc5yxz5bakympdnij44ckw2s83z"))

(define rust-arc-swap-1.9.1
  (crate-source "arc-swap" "1.9.1"
                "01xjlahcya8igdalxmda375lnlhjqwjz0cdqhy0bc1jkyzb1yfka"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-askama-0.16.0
  (crate-source "askama" "0.16.0"
                "1p5d30z0q1wlnlzcqd6hn1l9ljf5vhvsi8yh36h8gn7d4m8q5gzi"))

(define rust-askama-derive-0.16.0
  (crate-source "askama_derive" "0.16.0"
                "0f37ff849403w7sw2j6sjdrllnz158sj2pr1hkxflc51f9chdiz1"))

(define rust-askama-macros-0.16.0
  (crate-source "askama_macros" "0.16.0"
                "06mf8jz3pav9kf8r1jryj500bzf69kplq4pnf4cs8fdxqk9b28qf"))

(define rust-askama-parser-0.16.0
  (crate-source "askama_parser" "0.16.0"
                "1nhmlxnrb1ylmwasg3micddi4ir8wcpb73rm2d2srrs3j7g9zc3x"))

(define rust-async-compression-0.4.42
  (crate-source "async-compression" "0.4.42"
                "1b59jb3y26pmxdshyjb7slxrp184ydlzq80ryfc2ik6cg653z6z7"))

(define rust-atom-syndication-0.12.8
  (crate-source "atom_syndication" "0.12.8"
                "1fq5kjilcmwp06mhqbyfp947yy9548i8hj2ha4mfngg3k7pvin1r"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-auditable-extract-0.3.5
  (crate-source "auditable-extract" "0.3.5"
                "0yiy1ph2620qlwj4anijmzi6w8gaci6gximn8afa9pjrjygiwds4"))

(define rust-auditable-info-0.10.0
  (crate-source "auditable-info" "0.10.0"
                "1wyzska8fx8blclj9ssb40d3hz0kzykl22dkbp3yncw4axxv74n6"))

(define rust-auditable-serde-0.9.0
  (crate-source "auditable-serde" "0.9.0"
                "0mj0illfrbab7bh9w465s9qd5xiq2gfi4m146hlcg9avwa5229nh"))

(define rust-autocfg-1.5.0
  (crate-source "autocfg" "1.5.0"
                "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0"))

(define rust-aws-lc-rs-1.16.3
  (crate-source "aws-lc-rs" "1.16.3"
                "13q3i8j2nfykpw0yln0n21m70nfgls5b9gz1lxgsf94hwqzzpihf"))

(define rust-aws-lc-sys-0.40.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "aws-lc-sys" "0.40.0"
                "1rrghm82i50zz40ykizqnrn65lavf856hqfiz6wffh8ybvp3f07m"))

(define rust-backtrace-0.3.76
  (crate-source "backtrace" "0.3.76"
                "1mibx75x4jf6wz7qjifynld3hpw3vq6sy3d3c9y5s88sg59ihlxv"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-basic-toml-0.1.10
  (crate-source "basic-toml" "0.1.10"
                "12hp59jl28kk229q4sqx6v4fc9p66v8i2byi0vlc9922h9g6fqms"))

(define rust-binfarce-0.2.1
  (crate-source "binfarce" "0.2.1"
                "18hnqqir3gk5sx1mlndzgpxs0l4rviv7dk3h1piyspayp35lqihq"))

(define rust-bitflags-2.11.1
  (crate-source "bitflags" "2.11.1"
                "1cvqijg3rvwgis20a66vfdxannjsxfy5fgjqkaq3l13gyfcj4lf4"))

(define rust-block-buffer-0.10.4
  (crate-source "block-buffer" "0.10.4"
                "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-borsh-1.6.1
  (crate-source "borsh" "1.6.1"
                "0nhqivq6rp7318hcns1rf25gpsdd7wvwhbxpzblpspasjpwf7lfg"))

(define rust-bstr-1.12.1
  (crate-source "bstr" "1.12.1"
                "1arc1v7h5l86vd6z76z3xykjzldqd5icldn7j9d3p7z6x0d4w133"))

(define rust-bumpalo-3.20.2
  (crate-source "bumpalo" "3.20.2"
                "1jrgxlff76k9glam0akhwpil2fr1w32gbjdf5hpipc7ld2c7h82x"))

(define rust-byteorder-1.5.0
  (crate-source "byteorder" "1.5.0"
                "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z"))

(define rust-bytes-1.11.1
  (crate-source "bytes" "1.11.1"
                "0czwlhbq8z29wq0ia87yass2mzy1y0jcasjb8ghriiybnwrqfx0y"))

(define rust-camino-1.2.2
  (crate-source "camino" "1.2.2"
                "0j0ayqfbbl8bxg0795ssk1hzkjix3dvl2kk63hdgzf9cd5nscag6"))

(define rust-canonical-path-2.0.2
  (crate-source "canonical-path" "2.0.2"
                "0vvsjda6ka5nz8zvx6r08zqi0j59sjccgcbjxj96xj764w9y1sg6"))

(define rust-caseless-0.2.2
  (crate-source "caseless" "0.2.2"
                "1n75pz65q9zn5rqq2xlw43dkq69rljnsd73nzpnwi1j08l3xavwb"))

(define rust-cc-1.2.62
  (crate-source "cc" "1.2.62"
                "164zsxcy2zzvbbh1qpbrsssz8kmria41j4agih47sal3y1cyip51"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-chrono-0.4.44
  (crate-source "chrono" "0.4.44"
                "1c64mk9a235271j5g3v4zrzqqmd43vp9vki7vqfllpqf5rd0fwy6"))

(define rust-clap-4.6.1
  (crate-source "clap" "4.6.1"
                "0lcf88l7vlg796rrqr7wipbbmfa5sgsgx4211b7xmxxv8dz13nqx"))

(define rust-clap-builder-4.6.0
  (crate-source "clap_builder" "4.6.0"
                "17q6np22yxhh5y5v53y4l31ps3hlaz45mvz2n2nicr7n3c056jki"))

(define rust-clap-derive-4.6.1
  (crate-source "clap_derive" "4.6.1"
                "1acpz49hi00iv9jkapixjzcv7s51x8qkfaqscjm36rqgf428dkpj"))

(define rust-clap-lex-1.1.0
  (crate-source "clap_lex" "1.1.0"
                "1ycqkpygnlqnndghhcxjb44lzl0nmgsia64x9581030yifxs7m68"))

(define rust-clru-0.6.3
  (crate-source "clru" "0.6.3"
                "1mb7vx7s8b3xzx7p2frly9w10b7k2yl3lvrpnvcxba0kn6fdjzqr"))

(define rust-cmake-0.1.58
  (crate-source "cmake" "0.1.58"
                "0y06zxw5sv1p5vvpp5rz1qwbrq7ccawrl09nqy5ahx1a5418mxy0"))

(define rust-color-eyre-0.6.5
  (crate-source "color-eyre" "0.6.5"
                "0vgjy8q6c4fin6inh7ik66rkkyjwar3ai8z33vbacckqnkphp4p5"))

(define rust-colorchoice-1.0.5
  (crate-source "colorchoice" "1.0.5"
                "0w75k89hw39p0mnnhlrwr23q50rza1yjki44qvh2mgrnj065a1qx"))

(define rust-combine-4.6.7
  (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-compression-codecs-0.4.38
  (crate-source "compression-codecs" "0.4.38"
                "1kqq2b8hpv7y3jnakkp66cdlrzl6my02dapn3g12j6cw3qwlh9ff"))

(define rust-compression-core-0.4.32
  (crate-source "compression-core" "0.4.32"
                "12bp209x76flr67jm5fql4hq8d14nkjzkk24g9gi0yh2rxjza56c"))

(define rust-comrak-0.52.0
  (crate-source "comrak" "0.52.0"
                "1hllxznr3qml847cn4a7msay1wpraxwvcr6npwpxb71ajdav5h5a"))

(define rust-core-foundation-0.10.1
  (crate-source "core-foundation" "0.10.1"
                "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-cpufeatures-0.2.17
  (crate-source "cpufeatures" "0.2.17"
                "10023dnnaghhdl70xcds12fsx2b966sxbxjq5sxs49mvxqw5ivar"))

(define rust-crc32fast-1.5.0
  (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-crossbeam-channel-0.5.15
  (crate-source "crossbeam-channel" "0.5.15"
                "1cicd9ins0fkpfgvz9vhz3m9rpkh6n8d3437c3wnfsdkd3wgif42"))

(define rust-crossbeam-deque-0.8.6
  (crate-source "crossbeam-deque" "0.8.6"
                "0l9f1saqp1gn5qy0rxvkmz4m6n7fc0b3dbm6q1r5pmgpnyvi3lcx"))

(define rust-crossbeam-epoch-0.9.18
  (crate-source "crossbeam-epoch" "0.9.18"
                "03j2np8llwf376m3fxqx859mgp9f83hj1w34153c7a9c7i5ar0jv"))

(define rust-crossbeam-utils-0.8.21
  (crate-source "crossbeam-utils" "0.8.21"
                "0a3aa2bmc8q35fb67432w16wvi54sfmb69rk9h5bhd18vw0c99fh"))

(define rust-crypto-common-0.1.7
  (crate-source "crypto-common" "0.1.7"
                "02nn2rhfy7kvdkdjl457q2z0mklcvj9h662xrq6dzhfialh2kj3q"))

(define rust-curl-0.4.49
  (crate-source "curl" "0.4.49"
                "1g7dcrh4mwkn2q0iiga7vc8i68pd5jdby5aparpa6yxqs1nkpz3r"))

(define rust-curl-sys-0.4.88+curl-8.20.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "curl-sys" "0.4.88+curl-8.20.0"
                "1l06557wwna8wvk62amn01zj7dqr3kd1s6j99vzmw9a7cpg1cj34"))

(define rust-darling-0.20.11
  (crate-source "darling" "0.20.11"
                "1vmlphlrlw4f50z16p4bc9p5qwdni1ba95qmxfrrmzs6dh8lczzw"))

(define rust-darling-core-0.20.11
  (crate-source "darling_core" "0.20.11"
                "0bj1af6xl4ablnqbgn827m43b8fiicgv180749f5cphqdmcvj00d"))

(define rust-darling-macro-0.20.11
  (crate-source "darling_macro" "0.20.11"
                "1bbfbc2px6sj1pqqq97bgqn6c8xdnb2fmz66f7f40nrqrcybjd7w"))

(define rust-deranged-0.5.8
  (crate-source "deranged" "0.5.8"
                "0711df3w16vx80k55ivkwzwswziinj4dz05xci3rvmn15g615n3w"))

(define rust-derive-builder-0.20.2
  (crate-source "derive_builder" "0.20.2"
                "0is9z7v3kznziqsxa5jqji3ja6ay9wzravppzhcaczwbx84znzah"))

(define rust-derive-builder-core-0.20.2
  (crate-source "derive_builder_core" "0.20.2"
                "1s640r6q46c2iiz25sgvxw3lk6b6v5y8hwylng7kas2d09xwynrd"))

(define rust-derive-builder-macro-0.20.2
  (crate-source "derive_builder_macro" "0.20.2"
                "0g1zznpqrmvjlp2w7p0jzsjvpmw5rvdag0rfyypjhnadpzib0qxb"))

(define rust-digest-0.10.7
  (crate-source "digest" "0.10.7"
                "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))

(define rust-diligent-date-parser-0.1.5
  (crate-source "diligent-date-parser" "0.1.5"
                "1sc1llvmzgblnkzknc9ad4k5f4hjkj46fbrf3s91kx36jgbygvf8"))

(define rust-display-error-chain-0.2.2
  (crate-source "display-error-chain" "0.2.2"
                "1xbcilzyfc8n60vjkmsf8v53kw855xw68jh69hpza6dwhrp19hhb"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-dunce-1.0.5
  (crate-source "dunce" "1.0.5"
                "04y8wwv3vvcqaqmqzssi6k0ii9gs6fpz96j5w9nky2ccsl23axwj"))

(define rust-either-1.15.0
  (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-encoding-rs-0.8.35
  (crate-source "encoding_rs" "0.8.35"
                "1wv64xdrr9v37rqqdjsyb8l8wzlcbab80ryxhrszvnj59wy0y0vm"))

(define rust-entities-1.0.1
  (crate-source "entities" "1.0.1"
                "1jnpr0zvj97wm9pnh7fnl74rzaar39hhg65p03cm08bqqgj0lcmm"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-errno-0.3.14
  (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-eyre-0.6.12
  (crate-source "eyre" "0.6.12"
                "1v1a3vb9gs5zkwp4jzkcfnpg0gvyp4ifydzx37f4qy14kzcibnbw"))

(define rust-faster-hex-0.10.0
  (crate-source "faster-hex" "0.10.0"
                "0wzvv4a1czxfxmh99cza2y0jps97hm3k1j6r6cs816qp5wnsw8vj"))

(define rust-fastrand-2.4.1
  (crate-source "fastrand" "2.4.1"
                "1mnqxxnxvd69ma9mczabpbbsgwlhd6l78yv3vd681453a9s247wz"))

(define rust-filetime-0.2.28
  (crate-source "filetime" "0.2.28"
                "1xmfmyk7l1my44lhlw6919ln19qibg70jmg5fzw6kgxgdzpjwnrd"))

(define rust-find-msvc-tools-0.1.9
  (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-finl-unicode-1.4.0
  (crate-source "finl_unicode" "1.4.0"
                "1md4j32sa8g6y7q9yphpslhhjdjxig1bczkjp8mxccz5lv1xsi4q"))

(define rust-fixedbitset-0.5.7
  (crate-source "fixedbitset" "0.5.7"
                "16fd3v9d2cms2vddf9xhlm56sz4j0zgrk3d2h6v1l7hx760lwrqx"))

(define rust-flate2-1.1.9
  (crate-source "flate2" "1.1.9"
                "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

(define rust-foldhash-0.2.0
  (crate-source "foldhash" "0.2.0"
                "1nvgylb099s11xpfm1kn2wcsql080nqmnhj1l25bp3r2b35j9kkp"))

(define rust-form-urlencoded-1.2.2
  (crate-source "form_urlencoded" "1.2.2"
                "1kqzb2qn608rxl3dws04zahcklpplkd5r1vpabwga5l50d2v4k6b"))

(define rust-fs-err-3.3.0
  (crate-source "fs-err" "3.3.0"
                "1h08mdjhdv3c48j3m32kj487rk6lwv3f5j6jrw1h14pwvd9f1zbk"))

(define rust-fs-extra-1.3.0
  (crate-source "fs_extra" "1.3.0"
                "075i25z70j2mz9r7i9p9r521y8xdj81q7skslyb7zhqnnw33fw22"))

(define rust-futures-channel-0.3.32
  (crate-source "futures-channel" "0.3.32"
                "07fcyzrmbmh7fh4ainilf1s7gnwvnk07phdq77jkb9fpa2ffifq7"))

(define rust-futures-core-0.3.32
  (crate-source "futures-core" "0.3.32"
                "07bbvwjbm5g2i330nyr1kcvjapkmdqzl4r6mqv75ivvjaa0m0d3y"))

(define rust-futures-io-0.3.32
  (crate-source "futures-io" "0.3.32"
                "063pf5m6vfmyxj74447x8kx9q8zj6m9daamj4hvf49yrg9fs7jyf"))

(define rust-futures-sink-0.3.32
  (crate-source "futures-sink" "0.3.32"
                "14q8ml7hn5a6gyy9ri236j28kh0svqmrk4gcg0wh26rkazhm95y3"))

(define rust-futures-task-0.3.32
  (crate-source "futures-task" "0.3.32"
                "14s3vqf8llz3kjza33vn4ixg6kwxp61xrysn716h0cwwsnri2xq3"))

(define rust-futures-util-0.3.32
  (crate-source "futures-util" "0.3.32"
                "1mn60lw5kh32hz9isinjlpw34zx708fk5q1x0m40n6g6jq9a971q"))

(define rust-generic-array-0.14.7
  (crate-source "generic-array" "0.14.7"
                "16lyyrzrljfq424c3n8kfwkqihlimmsg5nhshbbp48np3yjrqr45"))

(define rust-getrandom-0.2.17
  (crate-source "getrandom" "0.2.17"
                "1l2ac6jfj9xhpjjgmcx6s1x89bbnw9x6j9258yy6xjkzpq0bqapz"))

(define rust-getrandom-0.3.4
  (crate-source "getrandom" "0.3.4"
                "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9"))

(define rust-getrandom-0.4.2
  (crate-source "getrandom" "0.4.2"
                "0mb5833hf9pvn9dhvxjgfg5dx0m77g8wavvjdpvpnkp9fil1xr8d"))

(define rust-gimli-0.32.3
  (crate-source "gimli" "0.32.3"
                "1iqk5xznimn5bfa8jy4h7pa1dv3c624hzgd2dkz8mpgkiswvjag6"))

(define rust-gix-0.84.0
  (crate-source "gix" "0.84.0"
                "1kprx2yxg5qsh09mwn7xkgnlygz6lrf3ppcmilzkqnhspl7awm5f"))

(define rust-gix-actor-0.41.1
  (crate-source "gix-actor" "0.41.1"
                "03w2lz39wy827zns29wcblbdkkljnxiqml2haibaipa6yyw9ijcb"))

(define rust-gix-attributes-0.33.1
  (crate-source "gix-attributes" "0.33.1"
                "00lx9kw0pjg65fw6qn3g9iy2pdm4qidc33sccbngffvd4hpg2hwd"))

(define rust-gix-bitmap-0.3.2
  (crate-source "gix-bitmap" "0.3.2"
                "10qjqn9nzzvdiylcxdsffl87jyvasny7nwlyci3mfc5d4q6fzssj"))

(define rust-gix-chunk-0.7.2
  (crate-source "gix-chunk" "0.7.2"
                "1yraqlp07fcas4dx9wc4hmn4ngmd0r4ml9syvn6yaf5n8dwy9blz"))

(define rust-gix-command-0.9.1
  (crate-source "gix-command" "0.9.1"
                "1xhqj78qgj6bjr18cyv9my5xl374ds623mc02sqg8phkxx7nsw00"))

(define rust-gix-commitgraph-0.37.1
  (crate-source "gix-commitgraph" "0.37.1"
                "1frafvbz653dydj0afrjq13xk2gl38qnzgb4gsjgd9w4yh6msrvz"))

(define rust-gix-config-0.57.0
  (crate-source "gix-config" "0.57.0"
                "1pk3krwwf5z9n1zdajqqy281ip2ysawwll6iwwqq98lwnka748sg"))

(define rust-gix-config-value-0.18.1
  (crate-source "gix-config-value" "0.18.1"
                "1axsw5zvajcaff1kddgd9gc4b78r0k0nb5phblp6qbsm561ichpd"))

(define rust-gix-credentials-0.38.1
  (crate-source "gix-credentials" "0.38.1"
                "0pbllgmwlmhyydzi0pvwjphp08yy14bqpryn2az8h6fp1lpx437l"))

(define rust-gix-date-0.15.4
  (crate-source "gix-date" "0.15.4"
                "135llqpx4jnr1bbjnpxr95ylm5rwbvmak419w3wckflbm5japv53"))

(define rust-gix-diff-0.64.0
  (crate-source "gix-diff" "0.64.0"
                "0arhqd3n14wr83jdj65vvm2gr8753z01m6pkxprcx51dycl9av9v"))

(define rust-gix-discover-0.52.0
  (crate-source "gix-discover" "0.52.0"
                "1xr4p098lp0y33ij6yhs9rjy95cr64pqric0i8bx4ybq5g8wvfkp"))

(define rust-gix-error-0.2.4
  (crate-source "gix-error" "0.2.4"
                "0sxhk12wb9kwiz6f59n9kv0798fqpsd4aznd1pwhlj5yk7hk2y75"))

(define rust-gix-features-0.48.1
  (crate-source "gix-features" "0.48.1"
                "1g1dlpxvkz87waa5v1q6wqzckqrq3s3zl55yhlql1g1q9laswj8q"))

(define rust-gix-filter-0.31.0
  (crate-source "gix-filter" "0.31.0"
                "1yh9rrnvs1qqczqp8dkl0mqriiz03g279404lgj4qsgn2rylpxzc"))

(define rust-gix-fs-0.21.2
  (crate-source "gix-fs" "0.21.2"
                "1zki0xj5szadpc3hp79xvp9svidag69lpn17yzi4g3krp1nz9pvc"))

(define rust-gix-glob-0.26.1
  (crate-source "gix-glob" "0.26.1"
                "0mip7w7hmwsi861anrykfv49611wpf58vdp9mdsgig0nbgpviz6i"))

(define rust-gix-hash-0.25.1
  (crate-source "gix-hash" "0.25.1"
                "1kpd9vninaiplr9hfscvij5zcwqyj1a7fg70ni87g0wwh79jc2fb"))

(define rust-gix-hashtable-0.15.1
  (crate-source "gix-hashtable" "0.15.1"
                "0qq5pvqbc08wkz09g07ipdsn34p272wzqlw1gnpqnwd8xs9hpqxh"))

(define rust-gix-ignore-0.21.1
  (crate-source "gix-ignore" "0.21.1"
                "13bxm6nfw79fp1kj2c8mlsn66gsx3p1jbx2lqwfk97rcpywvm4fl"))

(define rust-gix-index-0.52.0
  (crate-source "gix-index" "0.52.0"
                "03d89zvvz1yzlixcggm3j7jjwhaflqabn0l3nnnm7irdb762hssf"))

(define rust-gix-lock-23.0.0
  (crate-source "gix-lock" "23.0.0"
                "1hc6l6jbnbqps09fhv9gfi9lm04mknwrmk9d91xh48sp9q3vrcq9"))

(define rust-gix-negotiate-0.32.0
  (crate-source "gix-negotiate" "0.32.0"
                "0mdz47wwyiyxp1cblix9dg3d4m1frf0vhv07ij0jbbjv45m96349"))

(define rust-gix-object-0.61.0
  (crate-source "gix-object" "0.61.0"
                "09fmsqcd41qngg9f12pyfi3i5k7qhgpmlgzgpl9p572255z8bkfm"))

(define rust-gix-odb-0.81.0
  (crate-source "gix-odb" "0.81.0"
                "0zcahpi7w1xvaxysislvq27wfzf9ngnhai47szr5c5cbhlr4q03x"))

(define rust-gix-pack-0.71.0
  (crate-source "gix-pack" "0.71.0"
                "0x5iavzlac0k3kidajfrpgk32hk18nw9d8f19rkk643xlbr2cdp4"))

(define rust-gix-packetline-0.21.4
  (crate-source "gix-packetline" "0.21.4"
                "09ii2w57bwgis1vgqygh6w9z6y4ckj0l7byicwrv82w3l9xk665v"))

(define rust-gix-path-0.12.1
  (crate-source "gix-path" "0.12.1"
                "19lk1y6rqvzwkiz7b12vkz012rda1m3ffv299alrx4qlrlaar9mg"))

(define rust-gix-pathspec-0.18.1
  (crate-source "gix-pathspec" "0.18.1"
                "17wcg713gsj89zqra0q3yja63041vwimdcwg3qg524gf84xphl1h"))

(define rust-gix-prompt-0.15.1
  (crate-source "gix-prompt" "0.15.1"
                "1n66lb8vzcch7im31qpvgcq5yb6c9ch4ggr321zax030fkbh9riy"))

(define rust-gix-protocol-0.62.0
  (crate-source "gix-protocol" "0.62.0"
                "1vlm6lq7vr38czlzmvwxhrfvk7j4317miygid2w7lw4hnfna7pji"))

(define rust-gix-quote-0.7.2
  (crate-source "gix-quote" "0.7.2"
                "1vz6db830hm89kmgmj27lzna51hcb920s13rg4xphayc6gy43rd6"))

(define rust-gix-ref-0.64.0
  (crate-source "gix-ref" "0.64.0"
                "12rfdfl4ig2hsjzljcnmwmfwr0gkqs6hy1n7fgmnyzpb6x6gc12c"))

(define rust-gix-refspec-0.42.0
  (crate-source "gix-refspec" "0.42.0"
                "1lx6qpkg1hvgc70zkshhfidr62pvjyljc80ls15g5dblxh3aw5mj"))

(define rust-gix-revision-0.46.0
  (crate-source "gix-revision" "0.46.0"
                "03rlfhblm0kfkf38dp5a14lfmk8z4489v8cxlccilg6xhj4chiqb"))

(define rust-gix-revwalk-0.32.0
  (crate-source "gix-revwalk" "0.32.0"
                "1rpr3rlb0yglp3ws33rrpisrinafd09kns5cga11f2gypxm7bxc5"))

(define rust-gix-sec-0.14.1
  (crate-source "gix-sec" "0.14.1"
                "1cq1bl9a3kwlglvx22xqg43r8dwz6q0582klf1i4hzjcdsbik1db"))

(define rust-gix-shallow-0.12.1
  (crate-source "gix-shallow" "0.12.1"
                "15ydacjzi1nkmv3gxwan5zfz3pdh8ns1d7a7fnjxzia8wlpzr4m2"))

(define rust-gix-submodule-0.31.0
  (crate-source "gix-submodule" "0.31.0"
                "10a7i24gv0spksya0c6nvjp0dn50mcz6mz2bm4i6q1jly078jn9h"))

(define rust-gix-tempfile-23.0.0
  (crate-source "gix-tempfile" "23.0.0"
                "1yzp1a7rv4r3qwmm3kradg28550d3jfyq1a7s3afgirm2kis27k9"))

(define rust-gix-trace-0.1.20
  (crate-source "gix-trace" "0.1.20"
                "0y6n39aay8pd7ad9k9mn8m6wyk92dqp1a3ry2wafph45wzm4bp24"))

(define rust-gix-transport-0.57.1
  (crate-source "gix-transport" "0.57.1"
                "1zz78r02cqs4c0197j0rw79zl2vafbdzhapzipxb1amijm4y7l3w"))

(define rust-gix-traverse-0.58.0
  (crate-source "gix-traverse" "0.58.0"
                "1vbs3z6q3p8g0972vz67fa37z7zs4j1jiwk50s3v58w6rh75kpp8"))

(define rust-gix-url-0.36.1
  (crate-source "gix-url" "0.36.1"
                "1cksnqmy50fxpz7ahqw4qfmfdm7a052jd7m1nz684pnmd7n03fv5"))

(define rust-gix-utils-0.3.3
  (crate-source "gix-utils" "0.3.3"
                "0wdpn67c6rlmw67ypz67y6bqb1qs0cl4x9pzh3swl8s131k0kib6"))

(define rust-gix-validate-0.11.2
  (crate-source "gix-validate" "0.11.2"
                "1qzs9bzb0x48ggzbfr1vh9m1q9bnc3xr2yzls9yblqs03ivzrikv"))

(define rust-gix-worktree-0.53.0
  (crate-source "gix-worktree" "0.53.0"
                "1ld2aks5hys16hj9v19zvnq015z17gl03lskbp6hg12y4zni9x6f"))

(define rust-gix-worktree-state-0.31.0
  (crate-source "gix-worktree-state" "0.31.0"
                "0sbxlzzlbpldqa5qdcrxnjipck7bdpq53kbh0gazsn527j5sxzsb"))

(define rust-gix-worktree-stream-0.33.0
  (crate-source "gix-worktree-stream" "0.33.0"
                "0my5vkvhg73k8ni7kah67sjk3xskbqi1qn5wj1skzih0079rwpnj"))

(define rust-glob-0.3.3
  (crate-source "glob" "0.3.3"
                "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc"))

(define rust-gumdrop-0.8.1
  (crate-source "gumdrop" "0.8.1"
                "1qr94qa0h758hn11yhqs2wmb1xaq8adjs8j6hljg1xnji7wh1isv"))

(define rust-gumdrop-derive-0.8.1
  (crate-source "gumdrop_derive" "0.8.1"
                "17d91ai4p9f9cwhqqnyivw9yi7prl9xzpaqq3a1yfxwx8k9rp7vj"))

(define rust-h2-0.4.14
  (crate-source "h2" "0.4.14"
                "0cw7jk7kn2vn6f8w8ssh6gis1mljnfjxd606gvi4sjpyjayfy7qp"))

(define rust-hash32-0.3.1
  (crate-source "hash32" "0.3.1"
                "01h68z8qi5gl9lnr17nz10lay8wjiidyjdyd60kqx8ibj090pmj7"))

(define rust-hashbrown-0.15.5
  (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.16.1
  (crate-source "hashbrown" "0.16.1"
                "004i3njw38ji3bzdp9z178ba9x3k0c1pgy8x69pj7yfppv4iq7c4"))

(define rust-hashbrown-0.17.1
  (crate-source "hashbrown" "0.17.1"
                "0jmqz7i4yl6cm7rbn0i2ffkfrmwi6xkmzkaldr2v8bcsx2v0jngd"))

(define rust-heapless-0.8.0
  (crate-source "heapless" "0.8.0"
                "1b9zpdjv4qkl2511s2c80fz16fx9in4m9qkhbaa8j73032v9xyqb"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-home-0.5.12
  (crate-source "home" "0.5.12"
                "13bjyzgx6q9srnfvl43dvmhn93qc8mh5w7cylk2g13sj3i3pyqnc"))

(define rust-http-1.4.0
  (crate-source "http" "1.4.0"
                "06iind4cwsj1d6q8c2xgq8i2wka4ps74kmws24gsi1bzdlw2mfp3"))

(define rust-http-body-1.0.1
  (crate-source "http-body" "1.0.1"
                "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy"))

(define rust-http-body-util-0.1.3
  (crate-source "http-body-util" "0.1.3"
                "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))

(define rust-httparse-1.10.1
  (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-hyper-1.9.0
  (crate-source "hyper" "1.9.0"
                "1jmwbwqcaficskg76kq402gbymbnh2z4v99xwq3l5aa6n8bg16b2"))

(define rust-hyper-rustls-0.27.9
  (crate-source "hyper-rustls" "0.27.9"
                "03vfnsm873wsp1dk0q85nxvk7w6syp8c2m5bcdjcyfgg4786ijik"))

(define rust-hyper-util-0.1.20
  (crate-source "hyper-util" "0.1.20"
                "186zdc58hmm663csmjvrzgkr6jdh93sfmi3q2pxi57gcaqjpqm4n"))

(define rust-iana-time-zone-0.1.65
  (crate-source "iana-time-zone" "0.1.65"
                "0w64khw5p8s4nzwcf36bwnsmqzf61vpwk9ca1920x82bk6nwj6z3"))

(define rust-iana-time-zone-haiku-0.1.2
  (crate-source "iana-time-zone-haiku" "0.1.2"
                "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k"))

(define rust-icu-collections-2.1.1
  (crate-source "icu_collections" "2.1.1"
                "0hsblchsdl64q21qwrs4hvc2672jrf466zivbj1bwyv606bn8ssc"))

(define rust-icu-locale-core-2.1.1
  (crate-source "icu_locale_core" "2.1.1"
                "1djvdc2f5ylmp1ymzv4gcnmq1s4hqfim9nxlcm173lsd01hpifpd"))

(define rust-icu-normalizer-2.1.1
  (crate-source "icu_normalizer" "2.1.1"
                "16dmn5596la2qm0r3vih0bzjfi0vx9a20yqjha6r1y3vnql8hv2z"))

(define rust-icu-normalizer-data-2.1.1
  (crate-source "icu_normalizer_data" "2.1.1"
                "02jnzizg6q75m41l6c13xc7nkc5q8yr1b728dcgfhpzw076wrvbs"))

(define rust-icu-properties-2.1.2
  (crate-source "icu_properties" "2.1.2"
                "1v3lbmhhi7i6jgw51ikjb1p50qh5rb67grlkdnkc63l7zq1gq2q2"))

(define rust-icu-properties-data-2.1.2
  (crate-source "icu_properties_data" "2.1.2"
                "1bvpkh939rgzrjfdb7hz47v4wijngk0snmcgrnpwc9fpz162jv31"))

(define rust-icu-provider-2.1.1
  (crate-source "icu_provider" "2.1.1"
                "0576b7dizgyhpfa74kacv86y4g1p7v5ffd6c56kf1q82rvq2r5l5"))

(define rust-id-arena-2.3.0
  (crate-source "id-arena" "2.3.0"
                "0m6rs0jcaj4mg33gkv98d71w3hridghp5c4yr928hplpkgbnfc1x"))

(define rust-ident-case-1.0.1
  (crate-source "ident_case" "1.0.1"
                "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-idna-1.1.0
  (crate-source "idna" "1.1.0"
                "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v"))

(define rust-idna-adapter-1.2.1
  (crate-source "idna_adapter" "1.2.1"
                "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis"))

(define rust-indenter-0.3.4
  (crate-source "indenter" "0.3.4"
                "1maq7yl2px9y40f68c2g2gjsq93rabphzp5shinj8nsldplfckcn"))

(define rust-indexmap-2.14.0
  (crate-source "indexmap" "2.14.0"
                "1na9z6f0d5pkjr1lgsni470v98gv2r7c41j8w48skr089x2yjrnl"))

(define rust-io-close-0.3.7
  (crate-source "io-close" "0.3.7"
                "1g4hldfn436rkrx3jlm4az1y5gdmkcixdlhkwy64yx06gx2czbcw"))

(define rust-ipnet-2.12.0
  (crate-source "ipnet" "2.12.0"
                "1qpq2y0asyv0jppw7zww9y96fpnpinwap8a0phhqqgyy3znnz3yr"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-itoa-1.0.18
  (crate-source "itoa" "1.0.18"
                "10jnd1vpfkb8kj38rlkn2a6k02afvj3qmw054dfpzagrpl6achlg"))

(define rust-jetscii-0.5.3
  (crate-source "jetscii" "0.5.3"
                "0pppbawc1v6lshz6zi3d4bkz7xbalph9sd78a5299jd94kz45wa7"))

(define rust-jiff-0.2.28
  (crate-source "jiff" "0.2.28"
                "00lixngcc7amh2fcsxfr0z38j06lllhapz192biv1qj97q1x60s6"))

(define rust-jiff-static-0.2.28
  (crate-source "jiff-static" "0.2.28"
                "0irbhfh2f4i9w5l53jcmh6ssnhdd92wfy76978chgwnxilvk4bbq"))

(define rust-jiff-tzdb-0.1.6
  (crate-source "jiff-tzdb" "0.1.6"
                "0xihzlnnyk0xnrzpq4xcyjdcmy8xc3ychzb9ayjkh4vgha2fy069"))

(define rust-jiff-tzdb-platform-0.1.3
  (crate-source "jiff-tzdb-platform" "0.1.3"
                "1s1ja692wyhbv7f60mc0x90h7kn1pv65xkqi2y4imarbmilmlnl7"))

(define rust-jni-0.22.4
  (crate-source "jni" "0.22.4"
                "161lza8gz071h22pgyqyx4n91ixd691z2dbb1pq2g97k5i49mzay"))

(define rust-jni-macros-0.22.4
  (crate-source "jni-macros" "0.22.4"
                "18v02mcn5c7mb2yw6r930xg6ynsn7hwkxv8z2kdhn3qprjn0j0d0"))

(define rust-jni-sys-0.4.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "jni-sys" "0.4.1"
                "1wlahx6f2zhczdjqyn8mk7kshb8x5vsd927sn3lvw41rrf47ldy6"))

(define rust-jni-sys-macros-0.4.1
  (crate-source "jni-sys-macros" "0.4.1"
                "0r32gbabrak15a7p487765b5wc0jcna2yv88mk6m1zjqyi1bkh1q"))

(define rust-jobserver-0.1.34
  (crate-source "jobserver" "0.1.34"
                "0cwx0fllqzdycqn4d6nb277qx5qwnmjdxdl0lxkkwssx77j3vyws"))

(define rust-js-sys-0.3.98
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.98"
                "024zjwpxp6fri4j79bh1686q1x4nw4a06fh1a28zv2rzc4973pv7"))

(define rust-kstring-2.0.2
  (crate-source "kstring" "2.0.2"
                "1lfvqlqkg2x23nglznb7ah6fk3vv3y5i759h5l2151ami98gk2sm"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-leb128fmt-0.1.0
  (crate-source "leb128fmt" "0.1.0"
                "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89"))

(define rust-libc-0.2.186
  (crate-source "libc" "0.2.186"
                "0rnyhzjyqq9x56skkllbjzzzwym3r61lq3l4hqj64v71gw0r3av8"))

(define rust-libz-sys-1.1.28
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libz-sys" "1.1.28"
                "08hyf9v85zifl3353xc7i5wr53v9b3scri856cmphl3gaxp24fpw"))

(define rust-linux-raw-sys-0.12.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.12.1"
                "0lwasljrqxjjfk9l2j8lyib1babh2qjlnhylqzl01nihw14nk9ij"))

(define rust-litemap-0.8.2
  (crate-source "litemap" "0.8.2"
                "1w7628bc7wwcxc4n4s5kw0610xk06710nh2hn5kwwk2wa91z9nlj"))

(define rust-lock-api-0.4.14
  (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-log-0.4.29
  (crate-source "log" "0.4.29"
                "15q8j9c8g5zpkcw0hnd6cf2z7fxqnvsjh3rw5mv5q10r83i34l2y"))

(define rust-lru-slab-0.1.2
  (crate-source "lru-slab" "0.1.2"
                "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi"))

(define rust-matchers-0.2.0
  (crate-source "matchers" "0.2.0"
                "1sasssspdj2vwcwmbq3ra18d3qniapkimfcbr47zmx6750m5llni"))

(define rust-maybe-async-0.2.10
  (crate-source "maybe-async" "0.2.10"
                "04fvg2ywb2p9dzf7i35xqfibxc05k1pirv36jswxcqg3qw82ryaw"))

(define rust-memchr-2.8.0
  (crate-source "memchr" "2.8.0"
                "0y9zzxcqxvdqg6wyag7vc3h0blhdn7hkq164bxyx2vph8zs5ijpq"))

(define rust-memmap2-0.9.10
  (crate-source "memmap2" "0.9.10"
                "1qz0n4ch68pz2mp07sdwnk27imdjjqy6aqir3hp9j4g0iw19hh3i"))

(define rust-mime-0.3.17
  (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.2.0
  (crate-source "mio" "1.2.0"
                "1hanrh4fwsfkdqdaqfidz48zz1wdix23zwn3r2x78am0garfbdsh"))

(define rust-nonempty-0.12.0
  (crate-source "nonempty" "0.12.0"
                "1dpc3xi8bd8dynkh42b0ysv8w4b5hvidmvcqdxrx0p1y6lkf0dwp"))

(define rust-nu-ansi-term-0.50.3
  (crate-source "nu-ansi-term" "0.50.3"
                "1ra088d885lbd21q1bxgpqdlk1zlndblmarn948jz2a40xsbjmvr"))

(define rust-num-conv-0.2.1
  (crate-source "num-conv" "0.2.1"
                "0rqrr29brafaa2za352pbmhkk556n7f8z9rrkgmjp1idvdl3fry6"))

(define rust-num-traits-0.2.19
  (crate-source "num-traits" "0.2.19"
                "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))

(define rust-object-0.37.3
  (crate-source "object" "0.37.3"
                "1zikiy9xhk6lfx1dn2gn2pxbnfpmlkn0byd7ib1n720x0cgj0xpz"))

(define rust-object-0.39.1
  (crate-source "object" "0.39.1"
                "16vkcaamik55jd9f04g73hvgsm5w636gb4w06x3nafvsih4nqnif"))

(define rust-once-cell-1.21.4
  (crate-source "once_cell" "1.21.4"
                "0l1v676wf71kjg2khch4dphwh1jp3291ffiymr2mvy1kxd5kwz4z"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-openssl-probe-0.2.1
  (crate-source "openssl-probe" "0.2.1"
                "1gpwpb7smfhkscwvbri8xzbab39wcnby1jgz1s49vf1aqgsdx1vw"))

(define rust-owo-colors-4.3.0
  (crate-source "owo-colors" "4.3.0"
                "0kgrf4r9vcczhw5r30nkcl6abm99l0ay8dr2fxl0ymvbkcxq04fj"))

(define rust-parking-lot-0.12.5
  (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-percent-encoding-2.3.2
  (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-petgraph-0.8.3
  (crate-source "petgraph" "0.8.3"
                "0mblnaqbx1y20h5y7pz6y11hk9jjk6k87lsmn7jxaq3hm67ba0c7"))

(define rust-phf-0.13.1
  (crate-source "phf" "0.13.1"
                "1pzswx5gdglgjgp4azyzwyr4gh031r0kcnpqq6jblga72z3jsmn1"))

(define rust-phf-codegen-0.13.1
  (crate-source "phf_codegen" "0.13.1"
                "1qfnsl2hiny0yg4lwn888xla5iwccszgxnx8dhbwl6s2h2fpzaj9"))

(define rust-phf-generator-0.13.1
  (crate-source "phf_generator" "0.13.1"
                "0dwpp11l41dy9mag4phkyyvhpf66lwbp79q3ik44wmhyfqxcwnhk"))

(define rust-phf-shared-0.13.1
  (crate-source "phf_shared" "0.13.1"
                "0rpjchnswm0x5l4mz9xqfpw0j4w68sjvyqrdrv13h7lqqmmyyzz5"))

(define rust-pin-project-lite-0.2.17
  (crate-source "pin-project-lite" "0.2.17"
                "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8"))

(define rust-pkg-config-0.3.33
  (crate-source "pkg-config" "0.3.33"
                "17jnqmcbxsnwhg9gjf0nh6dj5k0x3hgwi3mb9krjnmfa9v435w8r"))

(define rust-portable-atomic-1.13.1
  (crate-source "portable-atomic" "1.13.1"
                "0j8vlar3n5acyigq8q6f4wjx3k3s5yz0rlpqrv76j73gi5qr8fn3"))

(define rust-portable-atomic-util-0.2.7
  (crate-source "portable-atomic-util" "0.2.7"
                "0616j0fhy6y71hyxg3n86f6hng0fmsc269s3wp4gl8ww4p8hd8f2"))

(define rust-potential-utf-0.1.5
  (crate-source "potential_utf" "0.1.5"
                "0r0518fr32xbkgzqap509s3r60cr0iancsg9j1jgf37cyz7b20q1"))

(define rust-powerfmt-0.2.0
  (crate-source "powerfmt" "0.2.0"
                "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppv-lite86-0.2.21
  (crate-source "ppv-lite86" "0.2.21"
                "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5"))

(define rust-prettyplease-0.2.37
  (crate-source "prettyplease" "0.2.37"
                "0azn11i1kh0byabhsgab6kqs74zyrg69xkirzgqyhz6xmjnsi727"))

(define rust-proc-macro2-1.0.106
  (crate-source "proc-macro2" "1.0.106"
                "0d09nczyaj67x4ihqr5p7gxbkz38gxhk4asc0k8q23g9n85hzl4g"))

(define rust-prodash-31.0.0
  (crate-source "prodash" "31.0.0"
                "0k304x706f6ykvm313hrvad02x432f2wxzfrjw94alfmszi008ln"))

(define rust-quick-xml-0.39.4
  (crate-source "quick-xml" "0.39.4"
                "0plfhnna58ad2hlym3q02zrmmh7xdpikzs7hll4x6w7nwba8vk6d"))

(define rust-quinn-0.11.9
  (crate-source "quinn" "0.11.9"
                "086gzj666dr3slmlynkvxlndy28hahgl361d6bf93hk3i6ahmqmr"))

(define rust-quinn-proto-0.11.14
  (crate-source "quinn-proto" "0.11.14"
                "1660jkxhzi1pnywzs13ifczwrlv6ds9qds111vsnxjciqpz44js3"))

(define rust-quinn-udp-0.5.14
  (crate-source "quinn-udp" "0.5.14"
                "1gacawr17a2zkyri0r3m0lc9spzmxbq1by3ilyb8v2mdvjhcdpmd"))

(define rust-quote-1.0.45
  (crate-source "quote" "1.0.45"
                "095rb5rg7pbnwdp6v8w5jw93wndwyijgci1b5lw8j1h5cscn3wj1"))

(define rust-r-efi-5.3.0
  (crate-source "r-efi" "5.3.0"
                "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9"))

(define rust-r-efi-6.0.0
  (crate-source "r-efi" "6.0.0"
                "1gyrl2k5fyzj9k7kchg2n296z5881lg7070msabid09asp3wkp7q"))

(define rust-rand-0.9.4
  (crate-source "rand" "0.9.4"
                "1sknbxgs6nfg0nxdd7689lwbyr2i4vaswchrv4b34z8vpc3azia4"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.9.5
  (crate-source "rand_core" "0.9.5"
                "0g6qc5r3f0hdmz9b11nripyp9qqrzb0xqk9piip8w8qlvqkcibvn"))

(define rust-rayon-1.12.0
  (crate-source "rayon" "1.12.0"
                "0vcj63xgnk72c30vdrak7dhl53snnaqv9x2faf1d94hzg1kb2fgv"))

(define rust-rayon-core-1.13.0
  (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-redox-syscall-0.5.18
  (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-regex-1.12.3
  (crate-source "regex" "1.12.3"
                "0xp2q0x7ybmpa5zlgaz00p8zswcirj9h8nry3rxxsdwi9fhm81z1"))

(define rust-regex-automata-0.4.14
  (crate-source "regex-automata" "0.4.14"
                "13xf7hhn4qmgfh784llcp2kzrvljd13lb2b1ca0mwnf15w9d87bf"))

(define rust-regex-syntax-0.8.10
  (crate-source "regex-syntax" "0.8.10"
                "02jx311ka0daxxc7v45ikzhcl3iydjbbb0mdrpc1xgg8v7c7v2fw"))

(define rust-reqwest-0.13.3
  (crate-source "reqwest" "0.13.3"
                "1h7fgnllk7ihw7836b7z73h9fb5vk90y3irvcm0ysan2l8g05q32"))

(define rust-ring-0.17.14
  (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-rust-embed-8.11.0
  (crate-source "rust-embed" "8.11.0"
                "09wdk33zavfn2w3id20jidywvf4abfjg1wbfy21psdss6nwkq484"))

(define rust-rust-embed-impl-8.11.0
  (crate-source "rust-embed-impl" "8.11.0"
                "1ancyg87vx07w5m39538bwvj3hlizk8fd15kk8argsf8qzj042fs"))

(define rust-rust-embed-utils-8.11.0
  (crate-source "rust-embed-utils" "8.11.0"
                "1cf3wmwdivxqzizav813y42ln9r9jya3q1xi6finyzzywq5yzkav"))

(define rust-rustc-demangle-0.1.27
  (crate-source "rustc-demangle" "0.1.27"
                "17f0jl6lgsy8kwxdzxp3s2wmipvlpna03kkc4vkqr1gwv5lqh2xm"))

(define rust-rustc-hash-2.1.2
  (crate-source "rustc-hash" "2.1.2"
                "1gjdc5bw9982cj176jvgz9rrqf9xvr1q1ddpzywf5qhs7yzhlc4l"))

(define rust-rustc-stable-hash-0.1.2
  (crate-source "rustc-stable-hash" "0.1.2"
                "026drx2ly2b8b1pp1c2v3p3ws6k0jaa5bbc5f4xwkibhj7r4453q"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustix-1.1.4
  (crate-source "rustix" "1.1.4"
                "14511f9yjqh0ix07xjrjpllah3325774gfwi9zpq72sip5jlbzmn"))

(define rust-rustls-0.23.40
  (crate-source "rustls" "0.23.40"
                "12qnv3ag4wrw7aj8jng74kgrilpjm2b1rfcjaac8h691frccv1pg"))

(define rust-rustls-native-certs-0.8.3
  (crate-source "rustls-native-certs" "0.8.3"
                "0qrajg2n90bcr3bcq6j95gjm7a9lirfkkdmjj32419dyyzan0931"))

(define rust-rustls-pki-types-1.14.1
  (crate-source "rustls-pki-types" "1.14.1"
                "1a9pr54y0f3qr97bxpd3ahjldq0gqdld0h799xbnwdzbwxx1k9rh"))

(define rust-rustls-platform-verifier-0.7.0
  (crate-source "rustls-platform-verifier" "0.7.0"
                "181v4d0vl53vdh2wq56vghal1zyhdgqvy4xa8r45zwz4di9y5l96"))

(define rust-rustls-platform-verifier-android-0.1.1
  (crate-source "rustls-platform-verifier-android" "0.1.1"
                "13vq6sxsgz9547xm2zbdxiw8x7ad1g8n8ax6xvxsjqszk7q6awgq"))

(define rust-rustls-webpki-0.103.13
  (crate-source "rustls-webpki" "0.103.13"
                "0vkm7z9pnxz5qz66p2kmyy2pwx0g4jnsbqk5xzfhs4czcjl2ki31"))

(define rust-rustversion-1.0.22
  (crate-source "rustversion" "1.0.22"
                "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-schannel-0.1.29
  (crate-source "schannel" "0.1.29"
                "0ffrzz5vf2s3gnzvphgb5gg8fqifvryl07qcf7q3x1scj3jbghci"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-secrecy-0.10.3
  (crate-source "secrecy" "0.10.3"
                "0nmfsf9qm8921v2jliz08bj8zrryqar4gj3d6irqfc3kaj2az4g8"))

(define rust-security-framework-3.7.0
  (crate-source "security-framework" "3.7.0"
                "07fd0j29j8yczb3hd430vwz784lx9knb5xwbvqna1nbkbivvrx5p"))

(define rust-security-framework-sys-2.17.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "security-framework-sys" "2.17.0"
                "1qr0w0y9iwvmv3hwg653q1igngnc5b74xcf0679cbv23z0fnkqkc"))

(define rust-semver-1.0.28
  (crate-source "semver" "1.0.28"
                "1kaimrpy876bcgi8bfj0qqfxk77zm9iz2zhn1hp9hj685z854y4a"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-json-1.0.149
  (crate-source "serde_json" "1.0.149"
                "11jdx4vilzrjjd1dpgy67x5lgzr0laplz30dhv75lnf5ffa07z43"))

(define rust-serde-spanned-1.1.1
  (crate-source "serde_spanned" "1.1.1"
                "09jzk7i6wihn3d8i3wi4j4n98ghi93c3b8m8k64nxq0ijn3vaqk6"))

(define rust-sha1-0.10.6
  (crate-source "sha1" "0.10.6"
                "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha1-checked-0.10.0
  (crate-source "sha1-checked" "0.10.0"
                "08s4h1drgwxzfn1mk11rn0r9i0rbjra1m0l2c0fbngij1jn9kxc9"))

(define rust-sha2-0.10.9
  (crate-source "sha2" "0.10.9"
                "10xjj843v31ghsksd9sl9y12qfc48157j1xpb8v1ml39jy0psl57"))

(define rust-sharded-slab-0.1.7
  (crate-source "sharded-slab" "0.1.7"
                "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shell-words-1.1.1
  (crate-source "shell-words" "1.1.1"
                "0xzd5p53xl0ndnk63r0by52rhdrh6pd37szfxszkg73zb6ffcvyw"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-simd-adler32-0.3.9
  (crate-source "simd-adler32" "0.3.9"
                "0532ysdwcvzyp2bwpk8qz0hijplcdwpssr5gy5r7qwqqy5z5qgbh"))

(define rust-simd-cesu8-1.1.1
  (crate-source "simd_cesu8" "1.1.1"
                "0crcbgvyycmazji2vqj9vxn2czdyl3gxmicp4xqdzkc7pdbh3ycl"))

(define rust-simdutf8-0.1.5
  (crate-source "simdutf8" "0.1.5"
                "0vmpf7xaa0dnaikib5jlx6y4dxd3hxqz6l830qb079g7wcsgxag3"))

(define rust-siphasher-1.0.3
  (crate-source "siphasher" "1.0.3"
                "0jg6l9xyzca5vy4h6gf8r6p4kk84g98fk95pzig1kq6cr4z8grcf"))

(define rust-slab-0.4.12
  (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-smallvec-1.15.1
  (crate-source "smallvec" "1.15.1"
                "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7"))

(define rust-smol-str-0.3.2
  (crate-source "smol_str" "0.3.2"
                "039mj6lc1vkljj17ndlzzkak8kvlmw8ppi6yjdxsh433snfbhxln"))

(define rust-socket2-0.6.3
  (crate-source "socket2" "0.6.3"
                "0gkjjcyn69hqhhlh5kl8byk5m0d7hyrp2aqwzbs3d33q208nwxis"))

(define rust-stable-deref-trait-1.2.1
  (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-static-assertions-1.1.0
  (crate-source "static_assertions" "1.1.0"
                "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-subtle-2.6.1
  (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-syn-1.0.109
  (crate-source "syn" "1.0.109"
                "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))

(define rust-syn-2.0.117
  (crate-source "syn" "2.0.117"
                "16cv7c0wbn8amxc54n4w15kxlx5ypdmla8s0gxr2l7bv7s0bhrg6"))

(define rust-sync-wrapper-1.0.2
  (crate-source "sync_wrapper" "1.0.2"
                "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb"))

(define rust-synstructure-0.13.2
  (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-tame-index-0.26.3
  (crate-source "tame-index" "0.26.3"
                "1pkxx8l21m4q93ypifz6wa15x6z90yif083l0yf22icjcg3665f5"))

(define rust-tempfile-3.27.0
  (crate-source "tempfile" "3.27.0"
                "1gblhnyfjsbg9wjg194n89wrzah7jy3yzgnyzhp56f3v9jd7wj9j"))

(define rust-termcolor-1.4.1
  (crate-source "termcolor" "1.4.1"
                "0mappjh3fj3p2nmrg4y7qv94rchwi9mzmgmfflr8p2awdj7lyy86"))

(define rust-thiserror-2.0.18
  (crate-source "thiserror" "2.0.18"
                "1i7vcmw9900bvsmay7mww04ahahab7wmr8s925xc083rpjybb222"))

(define rust-thiserror-impl-2.0.18
  (crate-source "thiserror-impl" "2.0.18"
                "1mf1vrbbimj1g6dvhdgzjmn6q09yflz2b92zs1j9n3k7cxzyxi7b"))

(define rust-thread-local-1.1.9
  (crate-source "thread_local" "1.1.9"
                "1191jvl8d63agnq06pcnarivf63qzgpws5xa33hgc92gjjj4c0pn"))

(define rust-time-0.3.47
  (crate-source "time" "0.3.47"
                "0b7g9ly2iabrlgizliz6v5x23yq5d6bpp0mqz6407z1s526d8fvl"))

(define rust-time-core-0.1.8
  (crate-source "time-core" "0.1.8"
                "1jidl426mw48i7hjj4hs9vxgd9lwqq4vyalm4q8d7y4iwz7y353n"))

(define rust-time-macros-0.2.27
  (crate-source "time-macros" "0.2.27"
                "058ja265waq275wxvnfwavbz9r1hd4dgwpfn7a1a9a70l32y8w1f"))

(define rust-tinystr-0.8.3
  (crate-source "tinystr" "0.8.3"
                "0vfr8x285w6zsqhna0a9jyhylwiafb2kc8pj2qaqaahw48236cn8"))

(define rust-tinyvec-1.11.0
  (crate-source "tinyvec" "1.11.0"
                "1wvycrghzmaysnw34kzwnf0mfx6r75045s24r214wnnjadqfcq9y"))

(define rust-tinyvec-macros-0.1.1
  (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-tokio-1.52.3
  (crate-source "tokio" "1.52.3"
                "1zpzazypkg61sw91na1m85x5s4rsjym335fwwhwm1hcs70dz1iwg"))

(define rust-tokio-rustls-0.26.4
  (crate-source "tokio-rustls" "0.26.4"
                "0qggwknz9w4bbsv1z158hlnpkm97j3w8v31586jipn99byaala8p"))

(define rust-tokio-util-0.7.18
  (crate-source "tokio-util" "0.7.18"
                "1600rd47pylwn7cap1k7s5nvdaa9j7w8kqigzp1qy7mh0p4cxscs"))

(define rust-toml-0.9.12+spec-1.1.0
  (crate-source "toml" "0.9.12+spec-1.1.0"
                "0qwqbrymqn88mg2yqyq3rj52z6p20448z0jxdbpjsbpwg5g894ng"))

(define rust-toml-1.1.2+spec-1.1.0
  (crate-source "toml" "1.1.2+spec-1.1.0"
                "1vpggpamqhw4852kic7465zsidczsla06wz6friqkkfbhigd3ww1"))

(define rust-toml-datetime-0.7.5+spec-1.1.0
  (crate-source "toml_datetime" "0.7.5+spec-1.1.0"
                "0iqkgvgsxmszpai53dbip7sf2igic39s4dby29dbqf1h9bnwzqcj"))

(define rust-toml-datetime-1.1.1+spec-1.1.0
  (crate-source "toml_datetime" "1.1.1+spec-1.1.0"
                "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i"))

(define rust-toml-edit-0.25.12+spec-1.1.0
  (crate-source "toml_edit" "0.25.12+spec-1.1.0"
                "1mx5paq837rjw7w51zprrjynk1vaig9yzxfqz9ac79jmd7f3w5fj"))

(define rust-toml-parser-1.1.2+spec-1.1.0
  (crate-source "toml_parser" "1.1.2+spec-1.1.0"
                "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2"))

(define rust-toml-span-0.7.1
  (crate-source "toml-span" "0.7.1"
                "1dsici17lfypzs4lswjv652qiwqldjypvhm6rdfzmd9pshbs8azj"))

(define rust-toml-writer-1.1.1+spec-1.1.0
  (crate-source "toml_writer" "1.1.1+spec-1.1.0"
                "1nwjhvvrxz8f4ck1qi4xcz2x9qhpci37nrknhxxf9sqk22dsyvbm"))

(define rust-topological-sort-0.2.2
  (crate-source "topological-sort" "0.2.2"
                "0gcxahg24c058izagz642vs0kfb2zja48my3qrd0kkaf2d730s7a"))

(define rust-tower-0.5.3
  (crate-source "tower" "0.5.3"
                "1m5i3a2z1sgs8nnz1hgfq2nr4clpdmizlp1d9qsg358ma5iyzrgb"))

(define rust-tower-http-0.6.10
  (crate-source "tower-http" "0.6.10"
                "0lfbddgrhmxhnb3afazawsl4cxqfcs8wvq5hm34ija0wz3czvmk8"))

(define rust-tower-layer-0.3.3
  (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.44
  (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-attributes-0.1.31
  (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.36
  (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-tracing-log-0.2.0
  (crate-source "tracing-log" "0.2.0"
                "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-subscriber-0.3.23
  (crate-source "tracing-subscriber" "0.3.23"
                "06fkr0qhggvrs861d7f74pn3i3a10h5jsp4n70jj9ys5b675fzyb"))

(define rust-try-lock-0.2.5
  (crate-source "try-lock" "0.2.5"
                "0jqijrrvm1pyq34zn1jmy2vihd4jcrjlvsh4alkjahhssjnsn8g4"))

(define rust-twox-hash-2.1.2
  (crate-source "twox-hash" "2.1.2"
                "1721278f1yc5zvkpdb8gsb1x6nlfjdmwm5fk9ff3fismcxmi78wy"))

(define rust-typed-arena-2.0.2
  (crate-source "typed-arena" "2.0.2"
                "0shj0jpmglhgw2f1i4b33ycdzwd1z205pbs1rd5wx7ks2qhaxxka"))

(define rust-typenum-1.20.0
  (crate-source "typenum" "1.20.0"
                "1pj35y6q11d3y55gdl6g1h2dfhmybjming0jdi9bh0bpnqm11kj0"))

(define rust-uluru-3.1.0
  (crate-source "uluru" "3.1.0"
                "1njp6vvy1mm8idnsp6ljyxx5znfsk3xkmk9cr2am0vkfwmlj92kw"))

(define rust-unicode-bom-2.0.3
  (crate-source "unicode-bom" "2.0.3"
                "05s2sqyjanqrbds3fxam35f92npp5ci2wz9zg7v690r0448mvv3y"))

(define rust-unicode-ident-1.0.24
  (crate-source "unicode-ident" "1.0.24"
                "0xfs8y1g7syl2iykji8zk5hgfi5jw819f5zsrbaxmlzwsly33r76"))

(define rust-unicode-normalization-0.1.25
  (crate-source "unicode-normalization" "0.1.25"
                "1s76dcrxw7vs32yhpi0p074apdc3s7lak7809f3qvclwij3zdm2z"))

(define rust-unicode-xid-0.2.6
  (crate-source "unicode-xid" "0.2.6"
                "0lzqaky89fq0bcrh6jj6bhlz37scfd8c7dsj5dq7y32if56c1hgb"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-url-2.5.8
  (crate-source "url" "2.5.8"
                "1v8f7nx3hpr1qh76if0a04sj08k86amsq4h8cvpw6wvk76jahrzz"))

(define rust-utf8-iter-1.0.4
  (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-valuable-0.1.1
  (crate-source "valuable" "0.1.1"
                "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-vcpkg-0.2.15
  (crate-source "vcpkg" "0.2.15"
                "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-wait-timeout-0.2.1
  (crate-source "wait-timeout" "0.2.1"
                "04azqv9mnfxgvnc8j2wp362xraybakh2dy1nj22gj51rdl93pb09"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-want-0.3.1
  (crate-source "want" "0.3.1"
                "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-wasip2-1.0.3+wasi-0.2.9
  (crate-source "wasip2" "1.0.3+wasi-0.2.9"
                "1mi3w855dz99xzjqc4aa8c9q5b6z1y5c963pkk4cvmr6vdr4c1i0"))

(define rust-wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06
  (crate-source "wasip3" "0.4.0+wasi-0.3.0-rc-2026-01-06"
                "19dc8p0y2mfrvgk3qw3c3240nfbylv22mvyxz84dqpgai2zzha2l"))

(define rust-wasm-bindgen-0.2.121
  (crate-source "wasm-bindgen" "0.2.121"
                "14375vc40l67lk9rxp59my4r6s64h2an3vjfh9j0hnqngk8f3b29"))

(define rust-wasm-bindgen-futures-0.4.71
  (crate-source "wasm-bindgen-futures" "0.4.71"
                "1f3k8r13nqshrlxwq0naxpbh250b4l6p526wlw2m78pv7w6jsjcn"))

(define rust-wasm-bindgen-macro-0.2.121
  (crate-source "wasm-bindgen-macro" "0.2.121"
                "0y45ghbkvs5rmxvdyhqrx8nzyy45rdx6619c01iaarykmzsfcs4f"))

(define rust-wasm-bindgen-macro-support-0.2.121
  (crate-source "wasm-bindgen-macro-support" "0.2.121"
                "1wjr69qa8rwmk4v7243dr100k393qi0avznk6p5sgck4bk1rwnnr"))

(define rust-wasm-bindgen-shared-0.2.121
  (crate-source "wasm-bindgen-shared" "0.2.121"
                "0h9la4176j5bvgbr64cqkmirif8z59vrcax9i4qx1w79045i1q64"))

(define rust-wasm-encoder-0.244.0
  (crate-source "wasm-encoder" "0.244.0"
                "06c35kv4h42vk3k51xjz1x6hn3mqwfswycmr6ziky033zvr6a04r"))

(define rust-wasm-metadata-0.244.0
  (crate-source "wasm-metadata" "0.244.0"
                "02f9dhlnryd2l7zf03whlxai5sv26x4spfibjdvc3g9gd8z3a3mv"))

(define rust-wasmparser-0.207.0
  (crate-source "wasmparser" "0.207.0"
                "0b694q3frf4xvavj0rw7xk3j852gqljdp2pghajnsq87mgwbk6z1"))

(define rust-wasmparser-0.244.0
  (crate-source "wasmparser" "0.244.0"
                "1zi821hrlsxfhn39nqpmgzc0wk7ax3dv6vrs5cw6kb0v5v3hgf27"))

(define rust-wasmparser-0.247.0
  (crate-source "wasmparser" "0.247.0"
                "101azbjvsbz8r3qmdv0qcybws98p2dfdp30gsjj5wv74pv1b8vwf"))

(define rust-web-sys-0.3.98
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "web-sys" "0.3.98"
                "1aijiwx7wsfzj37p1gnqn6wv4j2ppf4rqwhrzb8blf6gigzjsmsb"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-webpki-root-certs-1.0.7
  (crate-source "webpki-root-certs" "1.0.7"
                "0b59x5mzsilk42w59nif3lfhc24pgzb0v35pi6p01qy37z7424gk"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.11
  (crate-source "winapi-util" "0.1.11"
                "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-gnullvm-0.53.1
  (crate-source "windows_aarch64_gnullvm" "0.53.1"
                "0lqvdm510mka9w26vmga7hbkmrw9glzc90l4gya5qbxlm1pl3n59"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-aarch64-msvc-0.53.1
  (crate-source "windows_aarch64_msvc" "0.53.1"
                "01jh2adlwx043rji888b22whx4bm8alrk3khjpik5xn20kl85mxr"))

(define rust-windows-core-0.62.2
  (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnu-0.53.1
  (crate-source "windows_i686_gnu" "0.53.1"
                "18wkcm82ldyg4figcsidzwbg1pqd49jpm98crfz0j7nqd6h6s3ln"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-gnullvm-0.53.1
  (crate-source "windows_i686_gnullvm" "0.53.1"
                "030qaxqc4salz6l4immfb6sykc6gmhyir9wzn2w8mxj8038mjwzs"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-i686-msvc-0.53.1
  (crate-source "windows_i686_msvc" "0.53.1"
                "1hi6scw3mn2pbdl30ji5i4y8vvspb9b66l98kkz350pig58wfyhy"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-result-0.4.1
  (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-strings-0.5.1
  (crate-source "windows-strings" "0.5.1"
                "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq"))

(define rust-windows-sys-0.52.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-sys-0.60.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.60.2"
                "1jrbc615ihqnhjhxplr2kw7rasrskv9wj3lr80hgfd42sbj01xgj"))

(define rust-windows-sys-0.61.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-targets-0.53.5
  (crate-source "windows-targets" "0.53.5"
                "1wv9j2gv3l6wj3gkw5j1kr6ymb5q6dfc42yvydjhv3mqa7szjia9"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnu-0.53.1
  (crate-source "windows_x86_64_gnu" "0.53.1"
                "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-gnullvm-0.53.1
  (crate-source "windows_x86_64_gnullvm" "0.53.1"
                "1qbspgv4g3q0vygkg8rnql5c6z3caqv38japiynyivh75ng1gyhg"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-windows-x86-64-msvc-0.53.1
  (crate-source "windows_x86_64_msvc" "0.53.1"
                "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn"))

(define rust-winnow-0.7.15
  (crate-source "winnow" "0.7.15"
                "0i9rkl2rqpbnnxlgs20gmkj3nd0b2k8q55mjmpc2ybb84xwxjyfz"))

(define rust-winnow-1.0.2
  (crate-source "winnow" "1.0.2"
                "1l7xnfvlgy4da6gq5ip2bgcm8i9d0rwzaxg1p88nlw8lxy5p1q9f"))

(define rust-wit-bindgen-0.51.0
  (crate-source "wit-bindgen" "0.51.0"
                "19fazgch8sq5cvjv3ynhhfh5d5x08jq2pkw8jfb05vbcyqcr496p"))

(define rust-wit-bindgen-0.57.1
  (crate-source "wit-bindgen" "0.57.1"
                "0vjk2jb593ri9k1aq4iqs2si9mrw5q46wxnn78im7hm7hx799gqy"))

(define rust-wit-bindgen-core-0.51.0
  (crate-source "wit-bindgen-core" "0.51.0"
                "1p2jszqsqbx8k7y8nwvxg65wqzxjm048ba5phaq8r9iy9ildwqga"))

(define rust-wit-bindgen-rust-0.51.0
  (crate-source "wit-bindgen-rust" "0.51.0"
                "08bzn5fsvkb9x9wyvyx98qglknj2075xk1n7c5jxv15jykh6didp"))

(define rust-wit-bindgen-rust-macro-0.51.0
  (crate-source "wit-bindgen-rust-macro" "0.51.0"
                "0ymizapzv2id89igxsz2n587y2hlfypf6n8kyp68x976fzyrn3qc"))

(define rust-wit-component-0.244.0
  (crate-source "wit-component" "0.244.0"
                "1clwxgsgdns3zj2fqnrjcp8y5gazwfa1k0sy5cbk0fsmx4hflrlx"))

(define rust-wit-parser-0.244.0
  (crate-source "wit-parser" "0.244.0"
                "0dm7avvdxryxd5b02l0g5h6933z1cw5z0d4wynvq2cywq55srj7c"))

(define rust-writeable-0.6.3
  (crate-source "writeable" "0.6.3"
                "1i54d13h9bpap2hf13xcry1s4lxh7ap3923g8f3c0grd7c9fbyhz"))

(define rust-xml-1.3.0
  (crate-source "xml" "1.3.0"
                "128s58qhq8whrx90zbw8r5algr7lakgbf7mn05jfk234rbjqavv3"))

(define rust-yoke-0.8.2
  (crate-source "yoke" "0.8.2"
                "1jprcs7a98a5whvfs6r3jvfh1nnfp6zyijl7y4ywmn88lzywbs5b"))

(define rust-yoke-derive-0.8.2
  (crate-source "yoke-derive" "0.8.2"
                "13l5y5sz4lqm7rmyakjbh6vwgikxiql51xfff9hq2j485hk4r16y"))

(define rust-zerocopy-0.8.48
  (crate-source "zerocopy" "0.8.48"
                "1sb8plax8jbrsng1jdval7bdhk7hhrx40dz3hwh074k6knzkgm7f"))

(define rust-zerocopy-derive-0.8.48
  (crate-source "zerocopy-derive" "0.8.48"
                "1m5s0g92cxggqc74j83k1priz24k3z93sj5gadppd20p9c4cvqvh"))

(define rust-zerofrom-0.1.7
  (crate-source "zerofrom" "0.1.7"
                "1py40in4rirc9q8w36q67pld0zk8ssg024xhh0cncxgal7ra3yk9"))

(define rust-zerofrom-derive-0.1.7
  (crate-source "zerofrom-derive" "0.1.7"
                "18c4wsnznhdxx6m80piil1lbyszdiwsshgjrybqcm4b6qic22lqi"))

(define rust-zeroize-1.8.2
  (crate-source "zeroize" "1.8.2"
                "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr"))

(define rust-zerotrie-0.2.4
  (crate-source "zerotrie" "0.2.4"
                "1gr0pkcn3qsr6in6iixqyp0vbzwf2j1jzyvh7yl2yydh3p9m548g"))

(define rust-zerovec-0.11.6
  (crate-source "zerovec" "0.11.6"
                "0fdjsy6b31q9i0d73sl7xjd12xadbwi45lkpfgqnmasrqg5i3ych"))

(define rust-zerovec-derive-0.11.3
  (crate-source "zerovec-derive" "0.11.3"
                "0m85qj92mmfvhjra6ziqky5b1p4kcmp5069k7kfadp5hr8jw8pb2"))

(define rust-zlib-rs-0.6.3
  (crate-source "zlib-rs" "0.6.3"
                "04qmv85amq6sv73bzqgvnlsk9mnrl97rygzf2v4zjcx1807d9qrv"))

(define rust-zmij-1.0.21
  (crate-source "zmij" "1.0.21"
                "1amb5i6gz7yjb0dnmz5y669674pqmwbj44p4yfxfv2ncgvk8x15q"))

