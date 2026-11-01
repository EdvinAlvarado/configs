(define-module (packages zellij)
               #:use-module (guix licenses)
               #:use-module (guix packages)
               #:use-module (guix build-system cargo)
               #:use-module (guix download)
               #:use-module (guix git-download)
               #:use-module (gnu packages rust-crates)
               #:use-module (gnu packages rust-sources)
               #:use-module (gnu packages perl)
               #:use-module (gnu packages sqlite)
               #:export (zellij lookup-cargo-inputs))


(define rust-addr2line-0.17.0
  (crate-source "addr2line" "0.17.0"
                "0sw16zqy6w0ar633z69m7lw6gb0k1y7xj3387a8wly43ij5div5r"))

(define rust-adler-1.0.2
  (crate-source "adler" "1.0.2"
                "1zim79cvzd5yrkzl3nyfx0avijwgk9fqv3yrscdy1cc79ih02qpj"))

(define rust-ahash-0.8.11
  (crate-source "ahash" "0.8.11"
                "04chdfkls5xmhp1d48gnjsmglbqibizs3bpbj6rsj604m10si7g8"))

(define rust-aho-corasick-0.7.20
  (crate-source "aho-corasick" "0.7.20"
                "1b3if3nav4qzgjz9bf75b2cv2h2yisrqfs0np70i38kgz4cn94yc"))

(define rust-aho-corasick-1.0.1
  (crate-source "aho-corasick" "1.0.1"
                "014ddyrlbwg18m74fa52wrfik8y3pzhwqg811yvsyc8cjb70iz37"))

(define rust-allocator-api2-0.2.21
  (crate-source "allocator-api2" "0.2.21"
                "08zrzs022xwndihvzdn78yqarv2b9696y67i6h78nla3ww87jgb8"))

(define rust-ambient-authority-0.0.2
  (crate-source "ambient-authority" "0.0.2"
                "0fxsfyhy64jx7zrkb85h1vhr5nfqncja3pwpikid471d8w6yxm79"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-android-tzdata-0.1.1
  (crate-source "android-tzdata" "0.1.1"
                "1w7ynjxrfs97xg3qlcdns4kgfpwcdv824g611fq32cag4cdr96g9"))

(define rust-ansi-term-0.12.1
  (crate-source "ansi_term" "0.12.1"
                "1ljmkbilxgmhavxvxqa7qvm6f3fjggi7q2l3a72q9x0cxjvrnanm"))

(define rust-anyhow-1.0.95
  (crate-source "anyhow" "1.0.95"
                "010vd1ki8w84dzgx6c81sc8qm9n02fxic1gkpv52zp4nwrn0kb1l"))

(define rust-arc-swap-1.5.0
  (crate-source "arc-swap" "1.5.0"
                "07sb99f18spqmjx7f4cmqx7hc8ayspcmw9shl4zjvf300ki8rmy5"))

(define rust-arrayvec-0.5.2
  (crate-source "arrayvec" "0.5.2"
                "12q6hn01x5435bprwlb7w9m7817dyfq55yrl4psygr78bp32zdi3"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-async-channel-1.8.0
  (crate-source "async-channel" "1.8.0"
                "0cv8ha6y7s6scsgjipn7ciybry9g57rklw8404igrksw7vlgwing"))

(define rust-async-trait-0.1.80
  (crate-source "async-trait" "0.1.80"
                "1jip2xkv8l67bbg6jrz3b1sdb7api77vy38wrjl7sfkmya3j1yn6"))

(define rust-atomic-waker-1.0.0
  (crate-source "atomic-waker" "1.0.0"
                "0ansiq5vlw684fhks2x4a4is2rqlbv50q5mi8x0fxxvx5q2p8lq6"))

(define rust-atty-0.2.14
  (crate-source "atty" "0.2.14"
                "1s7yslcs6a28c5vz7jwj63lkfgyx8mx99fdirlhi9lbhhzhrpcyr"))

(define rust-autocfg-1.1.0
  (crate-source "autocfg" "1.1.0"
                "1ylp3cb47ylzabimazvbz9ms6ap784zhb6syaz6c1jqpmcmq0s6l"))

(define rust-aws-lc-rs-1.16.2
  (crate-source "aws-lc-rs" "1.16.2"
                "1z6i8qs0xjnzvslxnkhvywzzwfkafb1s4nrpg3f2k1nii4i92m50"))

(define rust-aws-lc-sys-0.39.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "aws-lc-sys" "0.39.0"
                "02jga4605vwqcxzd4k3ikd01x27k4gqwd8hh2rs7qm2w9hmfb9qz"))

(define rust-axum-0.8.4
  (crate-source "axum" "0.8.4"
                "1d99kb3vcjnhbgrf6hysllf25hzagw7m1i1nidjpgsaa30n8c7h2"))

(define rust-axum-core-0.5.2
  (crate-source "axum-core" "0.5.2"
                "19kwzksb4hwr3qfbrhjbqf83z6fjyng14wrkzck6fj1g8784qik8"))

(define rust-axum-extra-0.10.1
  (crate-source "axum-extra" "0.10.1"
                "0gbi6p5944rfm545cml8ns2i23yl0nrjarbm7iyin4zm64w4dgs5"))

(define rust-axum-server-0.7.2
  (crate-source "axum-server" "0.7.2"
                "1azq83vhnwl3c8b7cvgrp9md02kahjjlmrxniwz0kw3d1pv0ap29"))

(define rust-backtrace-0.3.65
  (crate-source "backtrace" "0.3.65"
                "0qggp0d8pbw5vfnpm0r7lrn6wmh5yjiz4yc4bzynb8l26i2pv88i"))

(define rust-backtrace-ext-0.2.1
  (crate-source "backtrace-ext" "0.2.1"
                "0l4xacjnx4jrn9k14xbs2swks018mviq03sp7c1gn62apviywysk"))

(define rust-base64-0.13.0
  (crate-source "base64" "0.13.0"
                "1z82g23mbzjgijkpcrilc7nljpxpvpf7zxf6iyiapkgka2ngwkch"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.11.0
  (crate-source "bitflags" "2.11.0"
                "1bwjibwry5nfwsfm9kjg2dqx5n5nja9xymwbfl6svnn8jsz6ff44"))

(define rust-block-buffer-0.10.4
  (crate-source "block-buffer" "0.10.4"
                "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-bstr-1.5.0
  (crate-source "bstr" "1.5.0"
                "1xafaq57fzwa38yjwdzvqlbm8h207sjm585y4kdxjv1znj5ycim2"))

(define rust-bumpalo-3.16.0
  (crate-source "bumpalo" "3.16.0"
                "0b015qb4knwanbdlp1x48pkb4pm57b8gidbhhhxr900q2wb6fabr"))

(define rust-byteorder-1.4.3
  (crate-source "byteorder" "1.4.3"
                "0456lv9xi1a5bcm32arknf33ikv76p3fr9yzki4lb2897p2qkh8l"))

(define rust-bytes-1.11.1
  (crate-source "bytes" "1.11.1"
                "0czwlhbq8z29wq0ia87yass2mzy1y0jcasjb8ghriiybnwrqfx0y"))

(define rust-cap-fs-ext-3.4.4
  (crate-source "cap-fs-ext" "3.4.4"
                "0g0pdhz3w09pdza8xamzrzicjpmwk73y7h8mdzxfhgqra62w2774"))

(define rust-cap-primitives-3.4.4
  (crate-source "cap-primitives" "3.4.4"
                "0apni9ybd60z3d2zzbwv3c57zghd0464r7gm4syghfags573j7ha"))

(define rust-cap-rand-3.4.4
  (crate-source "cap-rand" "3.4.4"
                "0h0vjjmdwpf0139y1silf84frkps1mix1280y21qd8lqyz68kjqa"))

(define rust-cap-std-3.4.4
  (crate-source "cap-std" "3.4.4"
                "12a1k1633flbznkfzjg3xmhkh5l4ss4j9hf3fvqmipc3lmf3bh07"))

(define rust-cap-time-ext-3.4.4
  (crate-source "cap-time-ext" "3.4.4"
                "0nqskcskhki1chj3ylln333nh0xrbp3phsa6l3d8a03pp0hga6j9"))

(define rust-cassowary-0.3.0
  (crate-source "cassowary" "0.3.0"
                "0lvanj0gsk6pc1chqrh4k5k0vi1rfbgzmsk46dwy3nmrqyw711nz"))

(define rust-castaway-0.1.2
  (crate-source "castaway" "0.1.2"
                "1xhspwy477qy5yg9c3jp713asxckjpx0vfrmz5l7r5zg7naqysd2"))

(define rust-cc-1.2.57
  (crate-source "cc" "1.2.57"
                "08q464b62d03zm7rgiixavkrh5lzfq18lwf884vgycj9735d23bs"))

(define rust-cfg-if-1.0.0
  (crate-source "cfg-if" "1.0.0"
                "1za0vb97n4brpzpv8lsbnzmq5r8f2b0cpqqr0sy8h5bn751xxwds"))

(define rust-chrono-0.4.39
  (crate-source "chrono" "0.4.39"
                "09g8nf409lb184kl9j4s85k0kn8wzgjkp5ls9zid50b886fwqdky"))

(define rust-clap-3.2.4
  (crate-source "clap" "3.2.4"
                "0yn861xzwxwsfdl3xa6pamvcqs8pm904z0ipg2hlbyxl74vxw83d"))

(define rust-clap-complete-3.2.1
  (crate-source "clap_complete" "3.2.1"
                "0h6z59gxzkyyrz15f52kwsb4n82mlwqcn1zs5lqz1r15bymvlvhg"))

(define rust-clap-derive-3.2.4
  (crate-source "clap_derive" "3.2.4"
                "1xwqpyjqqffdyy5ddbdziij6j3pgg29yq0k0hcrd7ywzp04aysq2"))

(define rust-clap-lex-0.2.2
  (crate-source "clap_lex" "0.2.2"
                "04rn568mpbc4smk1wlsh9ky4z12b53rgiv6g6i1fpssh0ikcsf2m"))

(define rust-close-fds-0.3.2
  (crate-source "close_fds" "0.3.2"
                "1vd2i1gkvfcgdlzgrkgivhx3ky0zs98g8q3mwmwrxmg97pridi1v"))

(define rust-cmake-0.1.54
  (crate-source "cmake" "0.1.54"
                "1w41ma28yzad9x757s9sfq1wigjs9j902hbzc0nbxpc9vvws7jp7"))

(define rust-colored-2.0.0
  (crate-source "colored" "2.0.0"
                "1gbcijscmznzy42rn213yp9ima7210zakgaqibgg1n441dsnyqdk"))

(define rust-colorsys-0.6.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "colorsys" "0.6.5"
                "0w5vvcq3497m184a399x2rh9fgmarwzdkjc87zzmasslklbzkzad"))

(define rust-concurrent-queue-2.2.0
  (crate-source "concurrent-queue" "2.2.0"
                "0z0bnpgcblhrms6gph7x78yplj3qmlr5mvl38v9641zsxiqngv32"))

(define rust-console-0.15.0
  (crate-source "console" "0.15.0"
                "0c9wif28i3q231gvjprqdq1glmgmmcdxpmxcwk1p0jx45k9k52x2"))

(define rust-cookie-0.18.1
  (crate-source "cookie" "0.18.1"
                "0iy749flficrlvgr3hjmf3igr738lk81n5akzf4ym4cs6cxg7pjd"))

(define rust-core-foundation-0.10.1
  (crate-source "core-foundation" "0.10.1"
                "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-cpufeatures-0.2.2
  (crate-source "cpufeatures" "0.2.2"
                "0jsyrw41g5sqdpc9jgk57969hc0xw4c52j9amvmll4mbcwb019jr"))

(define rust-crossbeam-0.8.1
  (crate-source "crossbeam" "0.8.1"
                "0ibq943sxbli0d03aihys3n4l9apy88d22z9759b0g1wdf7miraa"))

(define rust-crossbeam-channel-0.5.4
  (crate-source "crossbeam-channel" "0.5.4"
                "0lvcpv6hg1g1r6aamiq9b4958p4hjy8dsqzrnmj6hp36zgappajs"))

(define rust-crossbeam-deque-0.8.1
  (crate-source "crossbeam-deque" "0.8.1"
                "07nypn86id2lf912ahiww1jvqp0zbk2xa25ra7vzplph375c0mb4"))

(define rust-crossbeam-epoch-0.9.8
  (crate-source "crossbeam-epoch" "0.9.8"
                "137ydqj18qddmazgqd16kjn766byixinmavra1hs0src389wyi8i"))

(define rust-crossbeam-queue-0.3.5
  (crate-source "crossbeam-queue" "0.3.5"
                "18kpa83m1ivz3230f4ax95f9pgcclj227rg4y1w5fyja1x0dh98z"))

(define rust-crossbeam-utils-0.8.15
  (crate-source "crossbeam-utils" "0.8.15"
                "0jwq8srmjcwvq9q883k9zyb26qqznaj4jjqdxmvw7xcmrkc3q1iw"))

(define rust-crossterm-0.28.1
  (crate-source "crossterm" "0.28.1"
                "1im9vs6fvkql0sr378dfr4wdm1rrkrvr22v4i8byz05k1dd9b7c2"))

(define rust-crossterm-winapi-0.9.1
  (crate-source "crossterm_winapi" "0.9.1"
                "0axbfb2ykbwbpf1hmxwpawwfs8wvmkcka5m561l7yp36ldi7rpdc"))

(define rust-crypto-common-0.1.6
  (crate-source "crypto-common" "0.1.6"
                "1cvby95a6xg7kxdz5ln3rl9xh66nz66w46mm3g56ri1z5x815yqv"))

(define rust-ctor-0.1.22
  (crate-source "ctor" "0.1.22"
                "1712zdlrmcfkfw38dkj67xg72fd0p9slyqqi64c6n94zgi7vwxzq"))

(define rust-curl-0.4.44
  (crate-source "curl" "0.4.44"
                "08hsq6ssy228df56adv2wbgam05f5rw1f2wzs7mhkb678qbx36sh"))

(define rust-curl-sys-0.4.68+curl-8.4.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "curl-sys" "0.4.68+curl-8.4.0"
                "0bvmslw0g3hhdgws8jhxzj7jamsy5f1kq9xj2r5kf3ini26x385l"))

(define rust-daemonize-0.5.0
  (crate-source "daemonize" "0.5.0"
                "0vhikx85f85r46xghsb4avsv6ww8mz9lipqvsia7m21wrfmgv2xb"))

(define rust-data-encoding-2.9.0
  (crate-source "data-encoding" "2.9.0"
                "0xm46371aw613ghc12ay4vsnn49hpcmcwlijnqy8lbp2bpd308ra"))

(define rust-deranged-0.5.8
  (crate-source "deranged" "0.5.8"
                "0711df3w16vx80k55ivkwzwswziinj4dz05xci3rvmn15g615n3w"))

(define rust-derivative-2.2.0
  (crate-source "derivative" "2.2.0"
                "02vpb81wisk2zh1d5f44szzxamzinqgq2k8ydrfjj2wwkrgdvhzw"))

(define rust-dialoguer-0.10.4
  (crate-source "dialoguer" "0.10.4"
                "11rgzrhi677w9gf1r3ip2x361svdkjkr2m5dsfca9fcljacg5ijr"))

(define rust-digest-0.10.7
  (crate-source "digest" "0.10.7"
                "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))

(define rust-directories-5.0.1
  (crate-source "directories" "5.0.1"
                "0dba6xzk79s1clqzxh2qlgzk3lmvvks1lzzjhhi3hd70hhxifjcs"))

(define rust-dirs-4.0.0
  (crate-source "dirs" "4.0.0"
                "0n8020zl4f0frfnzvgb9agvk4a14i1kjz4daqnxkgslndwmaffna"))

(define rust-dirs-sys-0.3.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "dirs-sys" "0.3.7"
                "19md1cnkazham8a6kh22v12d8hh3raqahfk6yb043vrjr68is78v"))

(define rust-dirs-sys-0.4.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "dirs-sys" "0.4.1"
                "071jy0pvaad9lsa6mzawxrh7cmr7hsmsdxwzm7jzldfkrfjha3sj"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-dissimilar-1.0.6
  (crate-source "dissimilar" "1.0.6"
                "0phdkg9d9c1vmn5v74lq7rmaba2m52fkwcryd3cbw46pww5cc3i1"))

(define rust-doctest-file-1.0.0
  (crate-source "doctest-file" "1.0.0"
                "0qkmnrsx2kszm58wxyry63bs35msj9chdb6jlh54a8cdwaiizj5a"))

(define rust-dunce-1.0.5
  (crate-source "dunce" "1.0.5"
                "04y8wwv3vvcqaqmqzssi6k0ii9gs6fpz96j5w9nky2ccsl23axwj"))

(define rust-either-1.6.1
  (crate-source "either" "1.6.1"
                "0mwl9vngqf5jvrhmhn9x60kr5hivxyjxbmby2pybncxfqhf4z3g7"))

(define rust-embed-resource-3.0.6
  (crate-source "embed-resource" "3.0.6"
                "0bm02623nhwb5k2yp0rgk5imhqwhg6y9mvnp70052r1wazy7b82m"))

(define rust-encode-unicode-0.3.6
  (crate-source "encode_unicode" "0.3.6"
                "07w3vzrhxh9lpjgsg2y5bwzfar2aq35mdznvcp3zjl0ssj7d4mx3"))

(define rust-encoding-rs-0.8.34
  (crate-source "encoding_rs" "0.8.34"
                "0nagpi1rjqdpvakymwmnlxzq908ncg868lml5b70n08bm82fjpdl"))

(define rust-equivalent-1.0.1
  (crate-source "equivalent" "1.0.1"
                "1malmx5f4lkfvqasz319lq6gb3ddg19yzf9s8cykfsgzdmyq0hsl"))

(define rust-erased-serde-0.3.20
  (crate-source "erased-serde" "0.3.20"
                "1zbzqr50vj05q0gphygrwls4pldaj4qwp1kxils4ddfhs3c2s4xd"))

(define rust-errno-0.3.10
  (crate-source "errno" "0.3.10"
                "0pgblicz1kjz9wa9m0sghkhh2zw1fhq1mxzj7ndjm746kg5m5n1k"))

(define rust-event-listener-2.5.2
  (crate-source "event-listener" "2.5.2"
                "0wgbyhw4piqrrln6s61y3sc06wd3liwzzz18hazji3wk2ya31wvp"))

(define rust-expect-test-1.4.1
  (crate-source "expect-test" "1.4.1"
                "1lzqx5hqh1g4llzqby4z1d18xmrjjx63c5l0na7ycf6mmpzfmn9h"))

(define rust-fallible-iterator-0.3.0
  (crate-source "fallible-iterator" "0.3.0"
                "0ja6l56yka5vn4y4pk6hn88z0bpny7a8k1919aqjzp0j1yhy9k1a"))

(define rust-fallible-streaming-iterator-0.1.9
  (crate-source "fallible-streaming-iterator" "0.1.9"
                "0nj6j26p71bjy8h42x6jahx1hn0ng6mc2miwpgwnp8vnwqf4jq3k"))

(define rust-fastrand-1.7.0
  (crate-source "fastrand" "1.7.0"
                "1pvci54f2cm69ybc308z213xdybgqpvf2pcvq1kch69mwp7g1z63"))

(define rust-fastrand-2.1.0
  (crate-source "fastrand" "2.1.0"
                "06p5d0rxq7by260m4ym9ial0bwgi0v42lrvhl6nm2g7h0h2m3h4z"))

(define rust-fd-lock-4.0.2
  (crate-source "fd-lock" "4.0.2"
                "0ixrsd19k2cpl773p9hd0yk3hac684d9aphbxy0jq9q64bd6hmvy"))

(define rust-file-id-0.2.2
  (crate-source "file-id" "0.2.2"
                "0dmylm34z6g8cg3b60sc6bk9v5wv9930vyx9wgcdpjpgpfwh9jbb"))

(define rust-filetime-0.2.25
  (crate-source "filetime" "0.2.25"
                "11l5zr86n5sr6g6k6sqldswk0jzklm0q95rzikxcns0yk0p55h1m"))

(define rust-find-msvc-tools-0.1.9
  (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-fixedbitset-0.4.2
  (crate-source "fixedbitset" "0.4.2"
                "101v41amgv5n9h4hcghvrbfk5vrncx1jwm35rn5szv4rk55i7rqc"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.4
  (crate-source "foldhash" "0.1.4"
                "0vsxw2iwpgs7yy6l7pndm7b8nllaq5vdxwnmjn1qpm5kyzhzvlm0"))

(define rust-form-urlencoded-1.2.1
  (crate-source "form_urlencoded" "1.2.1"
                "0milh8x7nl4f450s3ddhg57a3flcv6yq8hlkyk6fyr3mcb128dp1"))

(define rust-fs-err-3.1.0
  (crate-source "fs-err" "3.1.0"
                "1al2sj8src02wwww70vv2gypsrs6wyzx6zlpk82h84m2qajbv28z"))

(define rust-fs-extra-1.3.0
  (crate-source "fs_extra" "1.3.0"
                "075i25z70j2mz9r7i9p9r521y8xdj81q7skslyb7zhqnnw33fw22"))

(define rust-fs-set-times-0.20.1
  (crate-source "fs-set-times" "0.20.1"
                "1yxqkl8khk1593ribn4s9v60vf375gi9sgw9hq6nk5svf9yk6fq3"))

(define rust-fsevent-sys-4.1.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "fsevent-sys" "4.1.0"
                "1liz67v8b0gcs8r31vxkvm2jzgl9p14i78yfqx81c8sdv817mvkn"))

(define rust-futures-0.3.31
  (crate-source "futures" "0.3.31"
                "0xh8ddbkm9jy8kc5gbvjp9a4b6rqqxvc8471yb2qaz5wm2qhgg35"))

(define rust-futures-channel-0.3.31
  (crate-source "futures-channel" "0.3.31"
                "040vpqpqlbk099razq8lyn74m0f161zd0rp36hciqrwcg2zibzrd"))

(define rust-futures-core-0.3.31
  (crate-source "futures-core" "0.3.31"
                "0gk6yrxgi5ihfanm2y431jadrll00n5ifhnpx090c2f2q1cr1wh5"))

(define rust-futures-executor-0.3.31
  (crate-source "futures-executor" "0.3.31"
                "17vcci6mdfzx4gbk0wx64chr2f13wwwpvyf3xd5fb1gmjzcx2a0y"))

(define rust-futures-io-0.3.31
  (crate-source "futures-io" "0.3.31"
                "1ikmw1yfbgvsychmsihdkwa8a1knank2d9a8dk01mbjar9w1np4y"))

(define rust-futures-lite-1.13.0
  (crate-source "futures-lite" "1.13.0"
                "1kkbqhaib68nzmys2dc8j9fl2bwzf2s91jfk13lb2q3nwhfdbaa9"))

(define rust-futures-macro-0.3.31
  (crate-source "futures-macro" "0.3.31"
                "0l1n7kqzwwmgiznn0ywdc5i24z72zvh9q1dwps54mimppi7f6bhn"))

(define rust-futures-sink-0.3.31
  (crate-source "futures-sink" "0.3.31"
                "1xyly6naq6aqm52d5rh236snm08kw8zadydwqz8bip70s6vzlxg5"))

(define rust-futures-task-0.3.31
  (crate-source "futures-task" "0.3.31"
                "124rv4n90f5xwfsm9qw6y99755y021cmi5dhzh253s920z77s3zr"))

(define rust-futures-util-0.3.31
  (crate-source "futures-util" "0.3.31"
                "10aa1ar8bgkgbr4wzxlidkqkcxf77gffyj8j7768h831pcaq784z"))

(define rust-fuzzy-matcher-0.3.7
  (crate-source "fuzzy-matcher" "0.3.7"
                "153csv8rsk2vxagb68kpmiknvdd3bzqj03x805khckck28rllqal"))

(define rust-generic-array-0.14.5
  (crate-source "generic-array" "0.14.5"
                "00qqhls43bzvyb7s26iw6knvsz3mckbxl3rhaahvypzhqwzd6j7x"))

(define rust-getopts-0.2.21
  (crate-source "getopts" "0.2.21"
                "1mgb3qvivi26gs6ihqqhh8iyhp3vgxri6vwyrwg28w0xqzavznql"))

(define rust-getrandom-0.2.10
  (crate-source "getrandom" "0.2.10"
                "09zlimhhskzf7cmgcszix05wyz2i6fcpvh711cv1klsxl6r3chdy"))

(define rust-getrandom-0.3.1
  (crate-source "getrandom" "0.3.1"
                "1y154yzby383p63ndw6zpfm0fz3vf6c0zdwc7df6vkl150wrr923"))

(define rust-ghost-0.1.4
  (crate-source "ghost" "0.1.4"
                "0jpr9df3xq5zvi20nkfyq8m63iwjlcgcrhqsdzgx73rynvzi7j3n"))

(define rust-gimli-0.26.1
  (crate-source "gimli" "0.26.1"
                "1m0vi36ypv4gx9gzcw6y456yqnlypizhwlcqrmg6vkwd0lnkgk3q"))

(define rust-globset-0.4.10
  (crate-source "globset" "0.4.10"
                "1z4slzdx80qmv5l7pv2ac82jihwm4rrz9i50w6fybzfyk9c79782"))

(define rust-h2-0.4.10
  (crate-source "h2" "0.4.10"
                "19f0va87lhzrc0lmwkgcz1z0haf6glajb4icp0b7n50vdmkilhm9"))

(define rust-hashbrown-0.11.2
  (crate-source "hashbrown" "0.11.2"
                "0vkjsf5nzs7qcia5ya79j9sq2p1caz4crrncr1675wwyj3ag0pmb"))

(define rust-hashbrown-0.14.5
  (crate-source "hashbrown" "0.14.5"
                "1wa1vy1xs3mp11bn3z9dv0jricgr6a2j0zkf1g19yz3vw4il89z5"))

(define rust-hashbrown-0.15.2
  (crate-source "hashbrown" "0.15.2"
                "12dj0yfn59p3kh3679ac0w1fagvzf4z2zp87a13gbbqbzw0185dz"))

(define rust-hashlink-0.8.4
  (crate-source "hashlink" "0.8.4"
                "1xy8agkyp0llbqk9fcffc1xblayrrywlyrm2a7v93x8zygm4y2g8"))

(define rust-heck-0.4.0
  (crate-source "heck" "0.4.0"
                "1ygphsnfwl2xpa211vbqkz1db6ri1kvkg8p8sqybi37wclg7fh15"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.1.19
  (crate-source "hermit-abi" "0.1.19"
                "0cxcm8093nf5fyn114w8vxbrbcyvv91d4015rdnlgfll7cs6gd32"))

(define rust-hermit-abi-0.3.1
  (crate-source "hermit-abi" "0.3.1"
                "11j2v3q58kmi5mhjvh6hfrb7il2yzg7gmdf5lpwnwwv6qj04im7y"))

(define rust-hermit-abi-0.5.2
  (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-highway-0.6.4
  (crate-source "highway" "0.6.4"
                "0p9r4ss563gj44qamnrr5bqf0p9lb8gjc0w5jqmk3jlmyrlbjq9l"))

(define rust-http-0.2.9
  (crate-source "http" "0.2.9"
                "10j4jjpngaymxjvi92hllr2y6acr09pq61cvzxd44qzvkb4zyvmx"))

(define rust-http-1.3.1
  (crate-source "http" "1.3.1"
                "0r95i5h7dr1xadp1ac9453w0s62s27hzkam356nyx2d9mqqmva7l"))

(define rust-http-body-1.0.1
  (crate-source "http-body" "1.0.1"
                "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy"))

(define rust-http-body-util-0.1.3
  (crate-source "http-body-util" "0.1.3"
                "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))

(define rust-httparse-1.10.1
  (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-httpdate-1.0.3
  (crate-source "httpdate" "1.0.3"
                "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))

(define rust-humantime-2.1.0
  (crate-source "humantime" "2.1.0"
                "1r55pfkkf5v0ji1x6izrjwdq9v6sc7bv99xj6srywcar37xmnfls"))

(define rust-hyper-1.6.0
  (crate-source "hyper" "1.6.0"
                "103ggny2k31z0iq2gzwk2vbx601wx6xkpjpxn40hr3p3b0b5fayc"))

(define rust-hyper-util-0.1.11
  (crate-source "hyper-util" "0.1.11"
                "1wj3svb1r6yv6kgk5fsz6wwajmngc4zxcw4wxpwlmpbgl8rvqys9"))

(define rust-iana-time-zone-0.1.60
  (crate-source "iana-time-zone" "0.1.60"
                "0hdid5xz3jznm04lysjm3vi93h3c523w0hcc3xba47jl3ddbpzz7"))

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

(define rust-idna-1.1.0
  (crate-source "idna" "1.1.0"
                "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v"))

(define rust-idna-adapter-1.2.1
  (crate-source "idna_adapter" "1.2.1"
                "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis"))

(define rust-ignore-0.4.20
  (crate-source "ignore" "0.4.20"
                "14kl9fv83klbnjxdv0y8lpwlj3gkypxf3vbrmm29m2jkmcyqgryv"))

(define rust-include-dir-0.7.3
  (crate-source "include_dir" "0.7.3"
                "17pinxhivh3chkbjmbg9sl0x3h7wwry2zc2p12gfh8kizyp2yxhq"))

(define rust-include-dir-macros-0.7.3
  (crate-source "include_dir_macros" "0.7.3"
                "0gsa6z58wxgw9j58w60wyjpk2nv3pd86kimw2akwyzpmbi5jhfdi"))

(define rust-indexmap-1.8.2
  (crate-source "indexmap" "1.8.2"
                "0nnaw0whv3xysrpjrz69bsibbscd81rwx63s6f4kbajv1ia2s0g6"))

(define rust-indexmap-2.7.1
  (crate-source "indexmap" "2.7.1"
                "0lmnm1zbr5gq3wic3d8a76gpvampridzwckfl97ckd5m08mrk74c"))

(define rust-inotify-0.9.6
  (crate-source "inotify" "0.9.6"
                "1zxb04c4qccp8wnr3v04l503qpxzxzzzph61amlqbsslq4z9s1pq"))

(define rust-inotify-sys-0.1.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "inotify-sys" "0.1.5"
                "1syhjgvkram88my04kv03s0zwa66mdwa5v7ddja3pzwvx2sh4p70"))

(define rust-insta-1.14.0
  (crate-source "insta" "1.14.0"
                "154f3ncpibbljkz4yvfqk5299asmdyybcpw01ijh2g64hzqn16b8"))

(define rust-instant-0.1.12
  (crate-source "instant" "0.1.12"
                "0b2bx5qdlwayriidhrag8vhy10kdfimfhmb3jnjmsz2h9j1bwnvs"))

(define rust-interprocess-2.3.1
  (crate-source "interprocess" "2.3.1"
                "0sn68jrkrnl04a9pmci97iim7imr9xy6vxljfd53kic50w72pgsk"))

(define rust-inventory-0.2.3
  (crate-source "inventory" "0.2.3"
                "06h9xw67wx18rank4yyz93iq89j0fk6fbazryfvf5ach1dp4qd44"))

(define rust-io-extras-0.18.4
  (crate-source "io-extras" "0.18.4"
                "0raay0wyzgmfdi0p9lphm19fmldwqgw9x47ynbs7w2al63zdv192"))

(define rust-io-lifetimes-1.0.10
  (crate-source "io-lifetimes" "1.0.10"
                "08625nsz0lgbd7c9lly6b6l45viqpsnj9jbsixd9mrz7596wfrlw"))

(define rust-io-lifetimes-2.0.3
  (crate-source "io-lifetimes" "2.0.3"
                "1373iwawish51r5dbd7fav1hp89idk30wkmbphyrg60y8xqi6qas"))

(define rust-ipnet-2.9.0
  (crate-source "ipnet" "2.9.0"
                "1hzrcysgwf0knf83ahb3535hrkw63mil88iqc6kjaryfblrqylcg"))

(define rust-is-ci-1.1.1
  (crate-source "is_ci" "1.1.1"
                "1ywra2z56x6d4pc02zq24a4x7gvpixynh9524icbpchbf9ydwv31"))

(define rust-is-terminal-0.4.7
  (crate-source "is-terminal" "0.4.7"
                "07xyfla3f2jjb666s72la5jvl9zq7mixbqkjvyfi5j018rhr7kxd"))

(define rust-isahc-1.7.2
  (crate-source "isahc" "1.7.2"
                "1scfgyv3dpjbkqa9im25cd12cs6rbd8ygcaw67f3dx41sys08kik"))

(define rust-itertools-0.10.5
  (crate-source "itertools" "0.10.5"
                "0ww45h7nxx5kj6z2y6chlskxd1igvs4j507anr6dzg99x1h25zdh"))

(define rust-itoa-1.0.14
  (crate-source "itoa" "1.0.14"
                "0x26kr9m062mafaxgcf2p6h2x7cmixm0zw95aipzn2hr3d5jlnnp"))

(define rust-jobserver-0.1.31
  (crate-source "jobserver" "0.1.31"
                "0vnyfxr5gm03j3lpnd1zswnyvqa40kbssy08pz2m35salfm9kc6j"))

(define rust-js-sys-0.3.64
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.64"
                "0nlkiwpm8dyqcf1xyc6qmrankcgdd3fpzc0qyfq2sw3z97z9bwf5"))

(define rust-kdl-4.5.0
  (crate-source "kdl" "4.5.0"
                "19kljlwdhfyidz0g1vgwrrjsrd25rmplfknrpccdwbhf3qvqlf58"))

(define rust-kqueue-1.0.7
  (crate-source "kqueue" "1.0.7"
                "165dvjbf7s0nv6q8r9zkzi1v0g81c65a81wqm9bi5xavl45wd3rc"))

(define rust-kqueue-sys-1.0.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "kqueue-sys" "1.0.3"
                "11z5labbms9vn9m6csi5383dmrlmdgsxq13ls9fwa6zhi5a5hrw3"))

(define rust-lazy-static-1.4.0
  (crate-source "lazy_static" "1.4.0"
                "0in6ikhw8mgl33wjv6q6xfrb5b9jr16q8ygjy803fay4zcisvaz2"))

(define rust-leb128-0.2.5
  (crate-source "leb128" "0.2.5"
                "0rxxjdn76sjbrb08s4bi7m4x47zg68f71jzgx8ww7j0cnivjckl8"))

(define rust-leb128fmt-0.1.0
  (crate-source "leb128fmt" "0.1.0"
                "1chxm1484a0bly6anh6bd7a99sn355ymlagnwj3yajafnpldkv89"))

(define rust-lev-distance-0.1.1
  (crate-source "lev_distance" "0.1.1"
                "0pk26fp1fcjyg2ml8g5ma1jj2gvgnmmri4md8y3bqdjr46yx3nbj"))

(define rust-libc-0.2.176
  (crate-source "libc" "0.2.176"
                "0x7ivn80h7nz2l46vra7bxx36s6r8d0lkax14dx97skjsss2kyaq"))

(define rust-libm-0.2.15
  (crate-source "libm" "0.2.15"
                "1plpzf0p829viazdj57yw5dhmlr8ywf3apayxc2f2bq5a6mvryzr"))

(define rust-libnghttp2-sys-0.1.8+1.55.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libnghttp2-sys" "0.1.8+1.55.1"
                "0h53v0jg0ihlqy6v7iz7rhrp70hbz9qxp5nfvaswvb9d35n9bbjg"))

(define rust-libredox-0.1.3
  (crate-source "libredox" "0.1.3"
                "139602gzgs0k91zb7dvgj1qh4ynb8g1lbxsswdim18hcb6ykgzy0"))

(define rust-libsqlite3-sys-0.27.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libsqlite3-sys" "0.27.0"
                "05pp60ncrmyjlxxjj187808jkvpxm06w5lvvdwwvxd2qrmnj4kng"))

(define rust-libssh2-sys-0.2.23
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libssh2-sys" "0.2.23"
                "1jplndqhlsygjmsni1ydb4zbw0j5jjr47bmqnjkwif5qnipa755h"))

(define rust-libz-sys-1.1.8
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libz-sys" "1.1.8"
                "1gqb8nk7j4ngvlcll8plm2fvjwic40p2g4qp20pwry1m74f7c0lp"))

(define rust-linked-hash-map-0.5.4
  (crate-source "linked-hash-map" "0.5.4"
                "1ww8zsraqnvrsknd315481185igwkx5n14xnhq5i8216z65b7fbz"))

(define rust-linux-raw-sys-0.11.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.11.0"
                "0fghx0nn8nvbz5yzgizfcwd6ap2pislp68j8c1bwyr6sacxkq7fz"))

(define rust-linux-raw-sys-0.3.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.3.7"
                "17s7qr5h82blrxy29014zzhr30jcxcjc8r16v2p31rzcfal7xsgc"))

(define rust-linux-raw-sys-0.4.15
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.15"
                "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j"))

(define rust-litemap-0.8.1
  (crate-source "litemap" "0.8.1"
                "0xsy8pfp9s802rsj1bq2ys2kbk1g36w5dr3gkfip7gphb5x60wv3"))

(define rust-lock-api-0.4.11
  (crate-source "lock_api" "0.4.11"
                "0iggx0h4jx63xm35861106af3jkxq06fpqhpkhgw0axi2n38y5iw"))

(define rust-log-0.4.17
  (crate-source "log" "0.4.17"
                "0biqlaaw1lsr8bpnmbcc0fvgjj34yy79ghqzyi0ali7vgil2xcdb"))

(define rust-log-mdc-0.1.0
  (crate-source "log-mdc" "0.1.0"
                "1iw1x3qhjvrac35spikn5h06a1rxd9vw216jk8h52jhz9i0j2kd9"))

(define rust-log4rs-1.2.0
  (crate-source "log4rs" "1.2.0"
                "1z9kfnba38smyrpmq49pjl82yqbvj2h81m3878cvhycydmwa2v6k"))

(define rust-matchit-0.8.4
  (crate-source "matchit" "0.8.4"
                "1hzl48fwq1cn5dvshfly6vzkzqhfihya65zpj7nz7lfx82mgzqa7"))

(define rust-maybe-owned-0.3.4
  (crate-source "maybe-owned" "0.3.4"
                "1d3sqiv59i06k73x6p7mf294zgdfb2qkky127ipfnjj9mr9wgb2g"))

(define rust-memchr-2.7.6
  (crate-source "memchr" "2.7.6"
                "0wy29kf6pb4fbhfksjbs05jy2f32r2f3r1ga6qkmpz31k79h0azm"))

(define rust-memoffset-0.6.5
  (crate-source "memoffset" "0.6.5"
                "1kkrzll58a3ayn5zdyy9i1f1v3mx0xgl29x0chq614zazba638ss"))

(define rust-miette-5.8.0
  (crate-source "miette" "5.8.0"
                "0mxkxawyqc6ybl3xp997kakwm89h5vw03rnqxylwlyam3n4r5acj"))

(define rust-miette-derive-5.8.0
  (crate-source "miette-derive" "5.8.0"
                "0ls1hdsnx6afpzhknzmai73axcg127jvx54kd7kcr6va30jwcrac"))

(define rust-mime-0.3.17
  (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-minimal-lexical-0.2.1
  (crate-source "minimal-lexical" "0.2.1"
                "16ppc5g84aijpri4jzv14rvcnslvlpphbszc7zzp6vfkddf4qdb8"))

(define rust-miniz-oxide-0.5.3
  (crate-source "miniz_oxide" "0.5.3"
                "1k1wfxb35v129mhqy14yqhrj3wvknafrwygiq7zvi0m5iml7ap3g"))

(define rust-mio-0.8.11
  (crate-source "mio" "0.8.11"
                "034byyl0ardml5yliy1hmvx8arkmn9rv479pid794sm07ia519m4"))

(define rust-mio-1.0.3
  (crate-source "mio" "1.0.3"
                "1gah0h4ia3avxbwym0b6bi6lr6rpysmj9zvw6zis5yq0z0xq91i8"))

(define rust-multimap-0.8.3
  (crate-source "multimap" "0.8.3"
                "0sicyz4n500vdhgcxn4g8jz97cp1ijir1rnbgph3pmx9ckz4dkp5"))

(define rust-names-0.14.0
  (crate-source "names" "0.14.0"
                "1g1rxifcsvj9zj2nmwbdix8b5ynpghs4rq40vs966jqlylxwvpbv"))

(define rust-nix-0.23.1
  (crate-source "nix" "0.23.1"
                "1iimixk7y2qk0jswqich4mkd8kqyzdghcgy6203j8fmxmhbn71lz"))

(define rust-nom-7.1.1
  (crate-source "nom" "7.1.1"
                "0djc3lq5xihnwhrvkc4bj0fd58sjf632yh6hfiw545x355d3x458"))

(define rust-notify-6.1.1
  (crate-source "notify" "6.1.1"
                "0bad98r0ilkhhq2jg3zs11zcqasgbvxia8224wpasm74n65vs1b2"))

(define rust-notify-debouncer-full-0.3.2
  (crate-source "notify-debouncer-full" "0.3.2"
                "0kpkz1y4v2kwh5rgkhx4h2fxnwqka30lsrcy2vzwk2cpfdkd2zzv"))

(define rust-ntapi-0.4.2
  (crate-source "ntapi" "0.4.2"
                "10ghcc1kmj5ygy4ls81as6s5akd1wflwcc0b1k3nf8ql46g223y7"))

(define rust-num-conv-0.2.0
  (crate-source "num-conv" "0.2.0"
                "0l4hj7lp8zbb9am4j3p7vlcv47y9bbazinvnxx9zjhiwkibyr5yg"))

(define rust-num-cpus-1.17.0
  (crate-source "num_cpus" "1.17.0"
                "0fxjazlng4z8cgbmsvbzv411wrg7x3hyxdq8nxixgzjswyylppwi"))

(define rust-num-traits-0.2.15
  (crate-source "num-traits" "0.2.15"
                "1kfdqqw2ndz0wx2j75v9nbjx7d3mh3150zs4p5595y02rwsdx3jp"))

(define rust-object-0.28.4
  (crate-source "object" "0.28.4"
                "0964501nlfh806mik3f9v6n05mx74qa0w7byvn0sqpwm5lprhb74"))

(define rust-once-cell-1.21.3
  (crate-source "once_cell" "1.21.3"
                "0b9x77lb9f1j6nqgf5aka4s2qj0nly176bpbrv6f9iakk5ff3xa2"))

(define rust-openssl-probe-0.1.5
  (crate-source "openssl-probe" "0.1.5"
                "1kq18qm48rvkwgcggfkqq6pm948190czqc94d6bm2sir5hq1l0gz"))

(define rust-openssl-probe-0.2.1
  (crate-source "openssl-probe" "0.2.1"
                "1gpwpb7smfhkscwvbri8xzbab39wcnby1jgz1s49vf1aqgsdx1vw"))

(define rust-openssl-src-300.5.4+3.5.4
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "openssl-src" "300.5.4+3.5.4"
                "0wnbqw38pzp66axaw2wz5my8nhg8f4viw74avyqfknlm55wv61x5"))

(define rust-openssl-sys-0.9.111
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "openssl-sys" "0.9.111"
                "08f3mpsabivfi3fd0qv9231qidqy68lr8a4qi32y6xda43av5jl2"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-os-str-bytes-6.1.0
  (crate-source "os_str_bytes" "6.1.0"
                "1ykav0kv9152z4cmv8smwmd9pac9q42sihi4wphnrzlwx4c6hci1"))

(define rust-owo-colors-3.4.0
  (crate-source "owo-colors" "3.4.0"
                "0yx8glp9vipa6gybbqmpg8lyrcsrv9z6dia94p5lvshzja0p7kyy"))

(define rust-parking-2.0.0
  (crate-source "parking" "2.0.0"
                "0wnxxnizfxlax3n709s5r83f4n8awy3m4a18q4fdk0z7z693hz22"))

(define rust-parking-lot-0.11.2
  (crate-source "parking_lot" "0.11.2"
                "16gzf41bxmm10x82bla8d6wfppy9ym3fxsmdjyvn61m66s0bf5vx"))

(define rust-parking-lot-0.12.1
  (crate-source "parking_lot" "0.12.1"
                "13r2xk7mnxfc5g0g6dkdxqdqad99j7s7z8zhzz4npw5r0g0v4hip"))

(define rust-parking-lot-core-0.8.5
  (crate-source "parking_lot_core" "0.8.5"
                "05ij4zxsylx99srbq8qd1k2wiwaq8krkf9y4cqkhvb5wjca8wvnp"))

(define rust-parking-lot-core-0.9.9
  (crate-source "parking_lot_core" "0.9.9"
                "13h0imw1aq86wj28gxkblhkzx6z1gk8q18n0v76qmmj6cliajhjc"))

(define rust-pem-3.0.6
  (crate-source "pem" "3.0.6"
                "1glia9vv51wx79cysqxgdha6g1bwbbr20bfhijlk2nxw4qycac0x"))

(define rust-percent-encoding-2.3.1
  (crate-source "percent-encoding" "2.3.1"
                "0gi8wgx0dcy8rnv1kywdv98lwcx67hz0a0zwpib5v2i08r88y573"))

(define rust-pest-2.7.15
  (crate-source "pest" "2.7.15"
                "1p4rq45xprw9cx0pb8mmbfa0ih49l0baablv3cpfdy3c1pkayz4b"))

(define rust-petgraph-0.6.3
  (crate-source "petgraph" "0.6.3"
                "1912xw827flj8mzqm62jcbg0cv54qfhzm48c13ilzr9px67d5msd"))

(define rust-pin-project-1.1.3
  (crate-source "pin-project" "1.1.3"
                "08k4cpy8q3j93qqgnrbzkcgpn7g0a88l4a9nm33kyghpdhffv97x"))

(define rust-pin-project-internal-1.1.3
  (crate-source "pin-project-internal" "1.1.3"
                "01a4l3vb84brv9v7wl71chzxra2kynm6yvcjca66xv3ij6fgsna3"))

(define rust-pin-project-lite-0.2.14
  (crate-source "pin-project-lite" "0.2.14"
                "00nx3f04agwjlsmd3mc5rx5haibj2v8q9b52b0kwn63wcv4nz9mx"))

(define rust-pin-utils-0.1.0
  (crate-source "pin-utils" "0.1.0"
                "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb"))

(define rust-pkg-config-0.3.25
  (crate-source "pkg-config" "0.3.25"
                "1bh3vij79cshj884py4can1f8rvk52niaii1vwxya9q69gnc9y0x"))

(define rust-polling-2.2.0
  (crate-source "polling" "2.2.0"
                "0najvslgg2zclsnxay071jdw0bna7f0abqvgx3isv7w817ah8m38"))

(define rust-potential-utf-0.1.4
  (crate-source "potential_utf" "0.1.4"
                "0xxg0pkfpq299wvwln409z4fk80rbv55phh3f1jhjajy5x1ljfdp"))

(define rust-powerfmt-0.2.0
  (crate-source "powerfmt" "0.2.0"
                "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppv-lite86-0.2.16
  (crate-source "ppv-lite86" "0.2.16"
                "0wkqwnvnfcgqlrahphl45vdlgi2f1bs7nqcsalsllp1y4dp9x7zb"))

(define rust-pretty-bytes-0.2.2
  (crate-source "pretty-bytes" "0.2.2"
                "05jkd1f824b93jh0jwfskba9hd70crvjz2nl1hf2xgqx5kfnx780"))

(define rust-proc-macro-error-1.0.4
  (crate-source "proc-macro-error" "1.0.4"
                "1373bhxaf0pagd8zkyd03kkx6bchzf6g0dkwrwzsnal9z47lj9fs"))

(define rust-proc-macro-error-attr-1.0.4
  (crate-source "proc-macro-error-attr" "1.0.4"
                "0sgq6m5jfmasmwwy8x4mjygx5l7kp8s4j60bv25ckv2j1qc41gm1"))

(define rust-proc-macro2-1.0.93
  (crate-source "proc-macro2" "1.0.93"
                "169dw9wch753if1mgyi2nfl1il77gslvh6y2q46qplprwml6m530"))

(define rust-prost-0.11.9
  (crate-source "prost" "0.11.9"
                "1kc1hva2h894hc0zf6r4r8fsxfpazf7xn5rj3jya9sbrsyhym0hb"))

(define rust-prost-build-0.11.9
  (crate-source "prost-build" "0.11.9"
                "0w5jx97q96ydhkg67wx3lb11kfy8195c56g0476glzws5iak758i"))

(define rust-prost-derive-0.11.9
  (crate-source "prost-derive" "0.11.9"
                "1d3mw2s2jba1f7wcjmjd6ha2a255p2rmynxhm1nysv9w1z8xilp5"))

(define rust-prost-types-0.11.9
  (crate-source "prost-types" "0.11.9"
                "04ryk38sqkp2nf4dgdqdfbgn6zwwvjraw6hqq6d9a6088shj4di1"))

(define rust-quote-1.0.36
  (crate-source "quote" "1.0.36"
                "19xcmh445bg6simirnnd4fvkmp6v2qiwxh5f6rw4a70h76pnm9qg"))

(define rust-rand-0.8.5
  (crate-source "rand" "0.8.5"
                "013l6931nn7gkc23jz5mm3qdhf93jjf0fg64nz2lp4i51qd8vbrl"))

(define rust-rand-0.9.0
  (crate-source "rand" "0.9.0"
                "156dyvsfa6fjnv6nx5vzczay1scy5183dvjchd7bvs47xd5bjy9p"))

(define rust-rand-chacha-0.3.1
  (crate-source "rand_chacha" "0.3.1"
                "123x2adin558xbhvqb8w4f6syjsdkmqff8cxwhmjacpsl1ihmhg6"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.6.3
  (crate-source "rand_core" "0.6.3"
                "1rxlxc3bpzgwphcg9c9yasvv9idipcg2z2y4j0vlb52jyl418kyk"))

(define rust-rand-core-0.9.0
  (crate-source "rand_core" "0.9.0"
                "1zqmgsv276iy1jfxnndwpqjrgva39zck2f8i4ldpwbwn0ac3r3xh"))

(define rust-rcgen-0.13.2
  (crate-source "rcgen" "0.13.2"
                "18l0rz228pvnc44bjmvq8cchhh5d2rrkk98y9lqvan9243jnkrkm"))

(define rust-recvmsg-1.0.0
  (crate-source "recvmsg" "1.0.0"
                "0xa173gbg1cx8q7wyzi6c4kmcsz5rka68r4jb6kg14icskax9vfk"))

(define rust-redox-syscall-0.2.13
  (crate-source "redox_syscall" "0.2.13"
                "0hpgwvgjlg1j9z7bjf5y18fkd8ag7y4znhqxg85hnpp5qz25pwk2"))

(define rust-redox-syscall-0.4.1
  (crate-source "redox_syscall" "0.4.1"
                "1aiifyz5dnybfvkk4cdab9p2kmphag1yad6iknc7aszlxxldf8j7"))

(define rust-redox-syscall-0.5.13
  (crate-source "redox_syscall" "0.5.13"
                "1mlzna9bcd7ss1973bmysr3hpjrys82b3bd7l03h4jkbxv8bf10d"))

(define rust-redox-users-0.4.3
  (crate-source "redox_users" "0.4.3"
                "0asw3s4iy69knafkhvlbchy230qawc297vddjdwjs5nglwvxhcxh"))

(define rust-regex-1.8.1
  (crate-source "regex" "1.8.1"
                "0w2kgdvs2fsv39hrsb912zjq3bx5vw1cchslvbi6mk1iycbyd0xg"))

(define rust-regex-syntax-0.7.1
  (crate-source "regex-syntax" "0.7.1"
                "0g1s6ra0ra8xy1fxscspd406c3pn53bjm1is8phamlwvy6a656d5"))

(define rust-ring-0.17.14
  (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-rusqlite-0.30.0
  (crate-source "rusqlite" "0.30.0"
                "0kgjk7h53wp8k2di2j83ivf50f0bk6rg7bq8j36ygxb42lb4d057"))

(define rust-rustc-demangle-0.1.21
  (crate-source "rustc-demangle" "0.1.21"
                "0hn3xyd2n3bg3jnc5a5jbzll32n4r5a65bqzs287l30m5c53xw3y"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustix-0.37.28
  (crate-source "rustix" "0.37.28"
                "1dn131z1vj1ani37acirby3rwh6ksm3m1qdv8k554xxrg39nb4ai"))

(define rust-rustix-0.38.44
  (crate-source "rustix" "0.38.44"
                "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx"))

(define rust-rustix-1.1.2
  (crate-source "rustix" "1.1.2"
                "0gpz343xfzx16x82s1x336n0kr49j02cvhgxdvaq86jmqnigh5fd"))

(define rust-rustix-linux-procfs-0.1.1
  (crate-source "rustix-linux-procfs" "0.1.1"
                "0mi0w4zgw263gaf2ss5a2qg38hcqvh979wjqqzrc85max7vlpj1g"))

(define rust-rustls-0.23.27
  (crate-source "rustls" "0.23.27"
                "08d3nipyhmy4apksjyrb98s9k91wjyg1k7y0flx2671w135482bk"))

(define rust-rustls-native-certs-0.8.3
  (crate-source "rustls-native-certs" "0.8.3"
                "0qrajg2n90bcr3bcq6j95gjm7a9lirfkkdmjj32419dyyzan0931"))

(define rust-rustls-pemfile-2.2.0
  (crate-source "rustls-pemfile" "2.2.0"
                "0l3f3mrfkgdjrava7ibwzgwc4h3dljw3pdkbsi9rkwz3zvji9qyw"))

(define rust-rustls-pki-types-1.12.0
  (crate-source "rustls-pki-types" "1.12.0"
                "0yawbdpix8jif6s8zj1p2hbyb7y3bj66fhx0y7hyf4qh4964m6i2"))

(define rust-rustls-webpki-0.103.13
  (crate-source "rustls-webpki" "0.103.13"
                "0vkm7z9pnxz5qz66p2kmyy2pwx0g4jnsbqk5xzfhs4czcjl2ki31"))

(define rust-rustversion-1.0.20
  (crate-source "rustversion" "1.0.20"
                "1lhwjb16dsm8brd18bn2bh0ryzc7qi29bi2jjsc6ny2zbwn3ivgd"))

(define rust-ryu-1.0.10
  (crate-source "ryu" "1.0.10"
                "15960rzj6jkjhxrjfr3kid2hbnia84s6h8l1ga7vkla9rwmgkxpk"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-scc-2.3.4
  (crate-source "scc" "2.3.4"
                "1x1739jz8bx9x46d26aagwin9psykka1siw9fn0lbwi8zdsxgci2"))

(define rust-schannel-0.1.22
  (crate-source "schannel" "0.1.22"
                "126zy5jb95fc5hvzyjwiq6lc81r08rdcn6affn00ispp9jzk6dqc"))

(define rust-scopeguard-1.1.0
  (crate-source "scopeguard" "1.1.0"
                "1kbqm85v43rq92vx7hfiay6pmcga03vrjbbfwqpyj3pwsg3b16nj"))

(define rust-sdd-3.0.8
  (crate-source "sdd" "3.0.8"
                "08gfrs3cz2ncbqz7v1xm5687hggl166pic1frfk7s0f7244hfkjq"))

(define rust-security-framework-3.7.0
  (crate-source "security-framework" "3.7.0"
                "07fd0j29j8yczb3hd430vwz784lx9knb5xwbvqna1nbkbivvrx5p"))

(define rust-security-framework-sys-2.17.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "security-framework-sys" "2.17.0"
                "1qr0w0y9iwvmv3hwg653q1igngnc5b74xcf0679cbv23z0fnkqkc"))

(define rust-semver-0.11.0
  (crate-source "semver" "0.11.0"
                "1dn6064fipjymnmjccyjhb70miyvqvp08gvw1wbg8vbg4c8ay0gk"))

(define rust-semver-1.0.27
  (crate-source "semver" "1.0.27"
                "1qmi3akfrnqc2hfkdgcxhld5bv961wbk8my3ascv5068mc5fnryp"))

(define rust-semver-parser-0.10.2
  (crate-source "semver-parser" "0.10.2"
                "1xqijhqhx3bn77xnl1mlcp032hz8nv7n2fbdacbdzq7rnzsvxc00"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-json-1.0.140
  (crate-source "serde_json" "1.0.140"
                "0wwkp4vc20r87081ihj3vpyz5qf7wqkqipq17v99nv6wjrp8n1i0"))

(define rust-serde-path-to-error-0.1.17
  (crate-source "serde_path_to_error" "0.1.17"
                "0alb447z25dvczd6ll3vfjbf51pypn23mgs5hv8978vzjczv3yjr"))

(define rust-serde-spanned-1.0.4
  (crate-source "serde_spanned" "1.0.4"
                "0xkp0qdzams5sqwndbw3xrhf4c0bb5r46w2ywkp1aqsdb8ggkfzq"))

(define rust-serde-urlencoded-0.7.1
  (crate-source "serde_urlencoded" "0.7.1"
                "1zgklbdaysj3230xivihs30qi5vkhigg323a9m62k8jwf4a1qjfk"))

(define rust-serde-yaml-0.8.24
  (crate-source "serde_yaml" "0.8.24"
                "1g5f4hlk2wlvwm3hdisd5r99iic8if1pqwrb6cl6dnqmaj4iazbh"))

(define rust-serial-test-3.2.0
  (crate-source "serial_test" "3.2.0"
                "1a8zg87gi28952hzj363ykwd8p1ssrakl1gi3f4xdqa4y84q298v"))

(define rust-serial-test-derive-3.2.0
  (crate-source "serial_test_derive" "3.2.0"
                "1vwyz2k5kiy5jmba0fvp6ph8ia707801bz918n2ff7bm11d2csax"))

(define rust-sha1-0.10.6
  (crate-source "sha1" "0.10.6"
                "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha2-0.10.8
  (crate-source "sha2" "0.10.8"
                "1j1x78zk9il95w9iv46dh9wm73r6xrgj32y6lzzw7bxws9dbfgbr"))

(define rust-shell-words-1.1.0
  (crate-source "shell-words" "1.1.0"
                "1plgwx8r0h5ismbbp6cp03740wmzgzhip85k5hxqrrkaddkql614"))

(define rust-shellexpand-3.0.0
  (crate-source "shellexpand" "3.0.0"
                "1qc0d1zsaha7hphmyp0323zbndby5c6hrz9r9i44sab5lvg7s76x"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-signal-hook-0.3.18
  (crate-source "signal-hook" "0.3.18"
                "1qnnbq4g2vixfmlv28i1whkr0hikrf1bsc4xjy2aasj2yina30fq"))

(define rust-signal-hook-mio-0.2.5
  (crate-source "signal-hook-mio" "0.2.5"
                "1k20rr76ngvmzr6kskkl7dv8iyb84cbydpjbjk3mpcj0lykijnmp"))

(define rust-signal-hook-registry-1.4.0
  (crate-source "signal-hook-registry" "1.4.0"
                "1c2mhijg54y6c1zi4630yki1vpq3z96ljfnsrdy0rb64ilr767p5"))

(define rust-similar-2.1.0
  (crate-source "similar" "2.1.0"
                "1lw33na01r35h09s47jqhjgz3m29wapl20f6ybsla5d1cfgrf91f"))

(define rust-sixel-image-0.2.1
  (crate-source "sixel-image" "0.2.1"
                "17q4f21v4iixqngb06rc1nf5fhpin23ipdi61f8d5lsi3h2x8l83"))

(define rust-sixel-tokenizer-0.1.0
  (crate-source "sixel-tokenizer" "0.1.0"
                "0xnlg3vfmh96bqj1fnj6qdgjdnl0zc6v07ww2xh4v5mc55k7y6xp"))

(define rust-slab-0.4.6
  (crate-source "slab" "0.4.6"
                "0cmvcy9ppsh3dz8mi6jljx7bxyknvgpas4aid2ayxk1vjpz3qw7b"))

(define rust-sluice-0.5.5
  (crate-source "sluice" "0.5.5"
                "1d9ywr5039ibgaby8sc72f8fs5lpp8j5y6p3npya4jplxz000x3d"))

(define rust-smallvec-1.13.2
  (crate-source "smallvec" "1.13.2"
                "0rsw5samawl3wsw6glrsb127rx6sh89a8wyikicw6dkdcjd1lpiw"))

(define rust-smawk-0.3.1
  (crate-source "smawk" "0.3.1"
                "0hv0q1mw1r1brk7v3g4a80j162p7g1dri4bdidykrakzfqjd4ypn"))

(define rust-socket2-0.4.9
  (crate-source "socket2" "0.4.9"
                "0qnn1r41jqj20m0a2nzzjgzndlmpg5maiyjchccaypfqxq8sk934"))

(define rust-socket2-0.5.7
  (crate-source "socket2" "0.5.7"
                "070r941wbq76xpy039an4pyiy3rfj7mp7pvibf1rcri9njq5wc6f"))

(define rust-spin-0.9.8
  (crate-source "spin" "0.9.8"
                "0rvam5r0p3a6qhc18scqpvpgb3ckzyqxpgdfyjnghh8ja7byi039"))

(define rust-ssh2-0.9.3
  (crate-source "ssh2" "0.9.3"
                "1cgfwarj5k8s9fbf1pcnp27ifk30xk2f7q3sjca7l1ih8kk474r6"))

(define rust-stable-deref-trait-1.2.1
  (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-string-interner-0.19.0
  (crate-source "string-interner" "0.19.0"
                "1h6jy7q32gjipylgwfiwsqr54dfrapx1cy56kff3875kg220ipi3"))

(define rust-strip-ansi-escapes-0.1.1
  (crate-source "strip-ansi-escapes" "0.1.1"
                "1n36ly9vxb1wr5q76i7995xr7c0pb1pc8g7a3a3n47vwrwwvn701"))

(define rust-strip-ansi-escapes-0.2.1
  (crate-source "strip-ansi-escapes" "0.2.1"
                "0980min1s9f5g47rwlq8l9njks952a0jlz0v7yxrm5p7www813ra"))

(define rust-strsim-0.10.0
  (crate-source "strsim" "0.10.0"
                "08s69r4rcrahwnickvi0kq49z524ci50capybln83mg6b473qivk"))

(define rust-strum-0.27.2
  (crate-source "strum" "0.27.2"
                "1ksb9jssw4bg9kmv9nlgp2jqa4vnsa3y4q9zkppvl952q7vdc8xg"))

(define rust-strum-macros-0.27.2
  (crate-source "strum_macros" "0.27.2"
                "19xwikxma0yi70fxkcy1yxcv0ica8gf3jnh5gj936jza8lwcx5bn"))

(define rust-subtle-2.6.1
  (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-suggest-0.4.0
  (crate-source "suggest" "0.4.0"
                "0nb6axl4i58g7k0q3p3bg6m363aw6qnqdg31y5c8b43x6bbd0n15"))

(define rust-supports-color-2.0.0
  (crate-source "supports-color" "2.0.0"
                "0m5kayz225f23k5jyjin82sfkrqhfdq3j72ianafkazz9cbyfl29"))

(define rust-supports-hyperlinks-2.1.0
  (crate-source "supports-hyperlinks" "2.1.0"
                "0g93nh1db3f9lyd0ry35bqjrxkg6sbysn36x9hgd9m5h5rlk2hpq"))

(define rust-supports-unicode-2.0.0
  (crate-source "supports-unicode" "2.0.0"
                "1xxscsdjmdp7i3ikqnnivfn4hnpy4gp9as4hshgd4pdb82r2qv2b"))

(define rust-syn-1.0.96
  (crate-source "syn" "1.0.96"
                "1gqymymz4202nfj76dkhr177wmcidch580vzf6w3qi943qjxsj07"))

(define rust-syn-2.0.96
  (crate-source "syn" "2.0.96"
                "102wk3cgawimi3i0q3r3xw3i858zkyingg6y7gsxfy733amsvl6m"))

(define rust-sync-wrapper-1.0.2
  (crate-source "sync_wrapper" "1.0.2"
                "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb"))

(define rust-synstructure-0.13.2
  (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-sysinfo-0.33.1
  (crate-source "sysinfo" "0.33.1"
                "00bcbj9rk39n07ylclj9klggkshxyianv2lfkpqnc6x0iqj5ij2g"))

(define rust-system-interface-0.27.2
  (crate-source "system-interface" "0.27.2"
                "19hh608hj3f3c0lc1vmd2dzkgmgbmhm3qbngnflqh03m49nm4n5q"))

(define rust-tempfile-3.10.1
  (crate-source "tempfile" "3.10.1"
                "1wdzz35ri168jn9al4s1g2rnsrr5ci91khgarc2rvpb3nappzdw5"))

(define rust-termcolor-1.4.1
  (crate-source "termcolor" "1.4.1"
                "0mappjh3fj3p2nmrg4y7qv94rchwi9mzmgmfflr8p2awdj7lyy86"))

(define rust-terminal-size-0.1.17
  (crate-source "terminal_size" "0.1.17"
                "1pq60ng1a7fjp597ifk1cqlz8fv9raz9xihddld1m1pfdia1lg33"))

(define rust-textwrap-0.15.0
  (crate-source "textwrap" "0.15.0"
                "1yw513k61lfiwgqrfvsjw1a5wpvm0azhpjr2kr0jhnq9c56is55i"))

(define rust-thiserror-1.0.61
  (crate-source "thiserror" "1.0.61"
                "028prh962l16cmjivwb1g9xalbpqip0305zhq006mg74dc6whin5"))

(define rust-thiserror-2.0.12
  (crate-source "thiserror" "2.0.12"
                "024791nsc0np63g2pq30cjf9acj38z3jwx9apvvi8qsqmqnqlysn"))

(define rust-thiserror-impl-1.0.61
  (crate-source "thiserror-impl" "1.0.61"
                "0cvm37hp0kbcyk1xac1z0chpbd9pbn2g456iyid6sah0a113ihs6"))

(define rust-thiserror-impl-2.0.12
  (crate-source "thiserror-impl" "2.0.12"
                "07bsn7shydaidvyyrm7jz29vp78vrxr9cr9044rfmn078lmz8z3z"))

(define rust-thread-id-4.0.0
  (crate-source "thread-id" "4.0.0"
                "0zvikdngp0950hi0jgiipr8l36rskk1wk7pc8cd43xr3g5if1psz"))

(define rust-thread-local-1.1.7
  (crate-source "thread_local" "1.1.7"
                "0lp19jdgvp5m4l60cgxdnl00yw1hlqy8gcywg9bddwng9h36zp9z"))

(define rust-time-0.3.47
  (crate-source "time" "0.3.47"
                "0b7g9ly2iabrlgizliz6v5x23yq5d6bpp0mqz6407z1s526d8fvl"))

(define rust-time-core-0.1.8
  (crate-source "time-core" "0.1.8"
                "1jidl426mw48i7hjj4hs9vxgd9lwqq4vyalm4q8d7y4iwz7y353n"))

(define rust-time-macros-0.2.27
  (crate-source "time-macros" "0.2.27"
                "058ja265waq275wxvnfwavbz9r1hd4dgwpfn7a1a9a70l32y8w1f"))

(define rust-tinystr-0.8.2
  (crate-source "tinystr" "0.8.2"
                "0sa8z88axdsf088hgw5p4xcyi6g3w3sgbb6qdp81bph9bk2fkls2"))

(define rust-tokio-1.44.2
  (crate-source "tokio" "1.44.2"
                "0j4w3qvlcqzgbxlnap0czvspqj6x461vyk1sbqcf97g4rci8if76"))

(define rust-tokio-macros-2.5.0
  (crate-source "tokio-macros" "2.5.0"
                "1f6az2xbvqp7am417b78d1za8axbvjvxnmkakz9vr8s52czx81kf"))

(define rust-tokio-rustls-0.26.2
  (crate-source "tokio-rustls" "0.26.2"
                "16wf007q3584j46wc4s0zc4szj6280g23hka6x6bgs50l4v7nwlf"))

(define rust-tokio-stream-0.1.18
  (crate-source "tokio-stream" "0.1.18"
                "0w3cj33605ab58wqd382gnla5pnd9hnr00xgg333np5bka04knij"))

(define rust-tokio-tungstenite-0.20.1
  (crate-source "tokio-tungstenite" "0.20.1"
                "0v1v24l27hxi5hlchs7hfd5rgzi167x0ygbw220nvq0w5b5msb91"))

(define rust-tokio-tungstenite-0.26.2
  (crate-source "tokio-tungstenite" "0.26.2"
                "117hwxfwmpxazxks076w5i73xj7cgv5iqs7x2rnbzln60zvaz7bs"))

(define rust-tokio-util-0.7.15
  (crate-source "tokio-util" "0.7.15"
                "1pypd9lm1fdnpw0779pqvc16qqrxjy63dgfm20ajhpbdmnlkk9b6"))

(define rust-toml-0.5.10
  (crate-source "toml" "0.5.10"
                "13srgxa0d92k8vdjyw8cyyax1pvi66smlyq1s7cs8s7891kwfcqk"))

(define rust-toml-0.9.6
  (crate-source "toml" "0.9.6"
                "00g2y1r2znl73s03qfb2sgc977hhqajxyp617gax28yshprlqamf"))

(define rust-toml-datetime-0.7.5+spec-1.1.0
  (crate-source "toml_datetime" "0.7.5+spec-1.1.0"
                "0iqkgvgsxmszpai53dbip7sf2igic39s4dby29dbqf1h9bnwzqcj"))

(define rust-toml-parser-1.0.9+spec-1.1.0
  (crate-source "toml_parser" "1.0.9+spec-1.1.0"
                "1i54qpvvcppy8ybdn9gssas81vfzq0kmgkcnxzhyf8w9w0al8bbh"))

(define rust-toml-writer-1.0.6+spec-1.1.0
  (crate-source "toml_writer" "1.0.6+spec-1.1.0"
                "01r6x42d1p8p5kzfsi1fm4dakm3w53vi69f2ivyqpvi1xm5g25mb"))

(define rust-tower-0.5.2
  (crate-source "tower" "0.5.2"
                "1ybmd59nm4abl9bsvy6rx31m4zvzp5rja2slzpn712y9b68ssffh"))

(define rust-tower-http-0.6.4
  (crate-source "tower-http" "0.6.4"
                "0bladfcd75dkh3ikmf2m4f971nc0zn8b5pb9mdbryym27hhhrnqg"))

(define rust-tower-layer-0.3.3
  (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.41
  (crate-source "tracing" "0.1.41"
                "1l5xrzyjfyayrwhvhldfnwdyligi1mpqm8mzbi2m1d6y6p2hlkkq"))

(define rust-tracing-attributes-0.1.28
  (crate-source "tracing-attributes" "0.1.28"
                "0v92l9cxs42rdm4m5hsa8z7ln1xsiw1zc2iil8c6k7lzq0jf2nir"))

(define rust-tracing-core-0.1.33
  (crate-source "tracing-core" "0.1.33"
                "170gc7cxyjx824r9kr17zc9gvzx89ypqfdzq259pr56gg5bwjwp6"))

(define rust-tracing-futures-0.2.5
  (crate-source "tracing-futures" "0.2.5"
                "1wimg0iwa2ldq7xv98lvivvf3q9ykfminig8r1bs0ig22np9bl4p"))

(define rust-tungstenite-0.20.1
  (crate-source "tungstenite" "0.20.1"
                "1fbgcv3h4h1bhhf5sqbwqsp7jnc44bi4m41sgmhzdsk2zl8aqgcy"))

(define rust-tungstenite-0.26.2
  (crate-source "tungstenite" "0.26.2"
                "04rwwcxx95m3avi46rmn0kmpb6nynqimnla3v2qwn3k8argcp4s7"))

(define rust-typenum-1.15.0
  (crate-source "typenum" "1.15.0"
                "11yrvz1vd43gqv738yw1v75rzngjbs7iwcgzjy3cq5ywkv2imy6w"))

(define rust-typetag-0.1.8
  (crate-source "typetag" "0.1.8"
                "12jva00k063gb48bvx0p0ixwbq1l48411disynzvah92bd65d020"))

(define rust-typetag-impl-0.1.8
  (crate-source "typetag-impl" "0.1.8"
                "03lw15ad39bgr4m6fmr5b9lb4wapkcfsnfxsbz0362635iw4f0g6"))

(define rust-ucd-trie-0.1.7
  (crate-source "ucd-trie" "0.1.7"
                "0wc9p07sqwz320848i52nvyjvpsxkx3kv5bfbmm6s35809fdk5i8"))

(define rust-unicode-ident-1.0.1
  (crate-source "unicode-ident" "1.0.1"
                "131niycgp77aiwvgjdyh47389xfnb7fmlc8ybrxys8v0a0kgxljv"))

(define rust-unicode-linebreak-0.1.2
  (crate-source "unicode-linebreak" "0.1.2"
                "0grq6bsn967q4vpifld53s7a140nlmpq5vy8ghgr73f4n2mdqlis"))

(define rust-unicode-width-0.1.10
  (crate-source "unicode-width" "0.1.10"
                "12vc3wv0qwg8rzcgb9bhaf5119dlmd6lmkhbfy1zfls6n7jx3vf0"))

(define rust-unicode-width-0.2.1
  (crate-source "unicode-width" "0.2.1"
                "0k0mlq7xy1y1kq6cgv1r2rs2knn6rln3g3af50rhi0dkgp60f6ja"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-url-2.5.4
  (crate-source "url" "2.5.4"
                "0q6sgznyy2n4l5lm16zahkisvc9nip9aa5q1pps7656xra3bdy1j"))

(define rust-urlencoding-2.1.3
  (crate-source "urlencoding" "2.1.3"
                "1nj99jp37k47n0hvaz5fvz7z6jd0sb4ppvfy3nphr1zbnyixpy6s"))

(define rust-utf-8-0.7.6
  (crate-source "utf-8" "0.7.6"
                "1a9ns3fvgird0snjkd3wbdhwd3zdpc2h5gpyybrfr6ra5pkqxk09"))

(define rust-utf8-iter-1.0.4
  (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.0
  (crate-source "utf8parse" "0.2.0"
                "0wjkvy22cxg023vkmvq2wwkgqyqam0d4pjld3m13blfg594lnvlk"))

(define rust-uuid-1.16.0
  (crate-source "uuid" "1.16.0"
                "1a9dkv6jm4lz7ip9l9i1mcx7sh389xjsr03l6jgwqjpmkdvpm3s5"))

(define rust-vcpkg-0.2.15
  (crate-source "vcpkg" "0.2.15"
                "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))

(define rust-version-check-0.9.4
  (crate-source "version_check" "0.9.4"
                "0gs8grwdlgh0xq660d7wr80x14vxbizmd8dbp29p2pdncx8lp1s9"))

(define rust-vswhom-0.1.0
  (crate-source "vswhom" "0.1.0"
                "12v0fjjzxdc3y5c0lcwycfhphz7zf2s06hl5krwhawah0xzrp5xy"))

(define rust-vswhom-sys-0.1.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "vswhom-sys" "0.1.3"
                "0l0i4fijapsybmfckfqh53yqxsg0bm5ikja6vz8ngw0zpm67w1pv"))

(define rust-vte-0.10.1
  (crate-source "vte" "0.10.1"
                "10srmy9ssircrwsb5lpx3fbhx71460j77kvz0krz38jcmf9fdg3c"))

(define rust-vte-0.11.0
  (crate-source "vte" "0.11.0"
                "0iah6qvi8r6a1lslcwjg2g0jnczz72f3cvr3ihb2vv6j5b0j3bhs"))

(define rust-vte-0.14.1
  (crate-source "vte" "0.14.1"
                "0xy01fgkzb2080prh2ncd8949hm2248fc5wf1lryhdrhxzbxq7r3"))

(define rust-vte-generate-state-changes-0.1.1
  (crate-source "vte_generate_state_changes" "0.1.1"
                "1zs5q766q7jmc80c5c80gpzy4qpg5lnydf94mgdzrpy7h5q82myj"))

(define rust-waker-fn-1.1.0
  (crate-source "waker-fn" "1.1.0"
                "1jpfiis0frk2b36krqvk8264kgxk2dyhfzjsr8g3wah1nii2qnwx"))

(define rust-walkdir-2.3.3
  (crate-source "walkdir" "2.3.3"
                "16768hy32kcvghq7v4ci8llfjvdiwrwg6sj9nzcdiisnv9699prn"))

(define rust-wasi-0.11.0+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.0+wasi-snapshot-preview1"
                "08z4hxwkpdpalxjps1ai9y7ihin26y9f476i53dv98v45gkqg3cw"))

(define rust-wasi-0.13.3+wasi-0.2.2
  (crate-source "wasi" "0.13.3+wasi-0.2.2"
                "1lnapbvdcvi3kc749wzqvwrpd483win2kicn1faa4dja38p6v096"))

(define rust-wasi-common-34.0.2
  (crate-source "wasi-common" "34.0.2"
                "075f056dxwbkzjizfg7hajiqc76jj01rr8swjqkngs2q1hc5lww2"))

(define rust-wasm-bindgen-0.2.87
  (crate-source "wasm-bindgen" "0.2.87"
                "0hm3k42gcnrps2jh339h186scx1radqy1w7v1zwb333dncmaf1kp"))

(define rust-wasm-bindgen-backend-0.2.87
  (crate-source "wasm-bindgen-backend" "0.2.87"
                "1gcsh3bjxhw3cirmin45107pcsnn0ymhkxg6bxg65s8hqp9vdwjy"))

(define rust-wasm-bindgen-macro-0.2.87
  (crate-source "wasm-bindgen-macro" "0.2.87"
                "07cg0b6zkcxa1yg1n10h62paid59s9zr8yss214bv8w2b7jrbr6y"))

(define rust-wasm-bindgen-macro-support-0.2.87
  (crate-source "wasm-bindgen-macro-support" "0.2.87"
                "0yqc46pr6mlgb9bsnfdnd50qvsqnrz8g5243fnaz0rb7lhc1ns2l"))

(define rust-wasm-bindgen-shared-0.2.87
  (crate-source "wasm-bindgen-shared" "0.2.87"
                "18bmjwvfyhvlq49nzw6mgiyx4ys350vps4cmx5gvzckh91dd0sna"))

(define rust-wasm-encoder-0.239.0
  (crate-source "wasm-encoder" "0.239.0"
                "0k0q5nxl91fphaa0fgh14aa3qnpaqg90ki0qwrpwfl295fm0zq2v"))

(define rust-wasmi-0.51.5
  (crate-source "wasmi" "0.51.5"
                "1zr381vdjj8r77w8nyr50am1i68x7phhiaapfs178hjrrq1i8cmv"))

(define rust-wasmi-collections-0.51.5
  (crate-source "wasmi_collections" "0.51.5"
                "0wlifks0r4aqh7jha9h7g0q9mjzirdjyf9c2kx4399d28n7fkf79"))

(define rust-wasmi-core-0.51.5
  (crate-source "wasmi_core" "0.51.5"
                "1rhjhmp1kwzxcx8aaiy715prdm0l3zv35x87mc78256z1if3fpy2"))

(define rust-wasmi-ir-0.51.5
  (crate-source "wasmi_ir" "0.51.5"
                "1nf36g5s5298acswwsxsxnrz775jjj1vcq22as7wngi9lil2lkk2"))

(define rust-wasmi-wasi-0.51.5
  (crate-source "wasmi_wasi" "0.51.5"
                "09b807fbawbz6xakmfmkk9cb1ksr0408jv00lqf0gp8dll6d2q1v"))

(define rust-wasmparser-0.228.0
  (crate-source "wasmparser" "0.228.0"
                "1qwa34ia97p8hn5rc3w76vrp0320a8hva6xwdgalgxzxq4r13gsa"))

(define rust-wasmparser-0.239.0
  (crate-source "wasmparser" "0.239.0"
                "1c386dryy1yx311aqqryb2k5c88aqwl21l7imfzgcr77jfxr17cc"))

(define rust-wast-239.0.0
  (crate-source "wast" "239.0.0"
                "0pgal4misdn1jx18xq6xqf9wn95jfgrwmkbln47hwnd2x1piffci"))

(define rust-wast-35.0.2
  (crate-source "wast" "35.0.2"
                "0s2d43g326dw21bygpalzjnr1fi83lx4afimg1h5hilrnkql1w9f"))

(define rust-wat-1.239.0
  (crate-source "wat" "1.239.0"
                "0x9vdz6bg0cj5r1m15jamgw0a80sj3w6d0amapr0jiyk4wcr871y"))

(define rust-wepoll-ffi-0.1.2
  (crate-source "wepoll-ffi" "0.1.2"
                "1yxpkva08d5f6ih3b5hdb8h45mkz3jq3dh1bzjspfhy6qpnzshyp"))

(define rust-which-4.2.5
  (crate-source "which" "4.2.5"
                "1bi4gklz7qcw19z4d2a4c1wsq083zc2387745rvsidhkc57baksw"))

(define rust-widestring-1.2.1
  (crate-source "widestring" "1.2.1"
                "0wg4qdbs70xqnlbm8wb0bs4idm2mxk3b6kaqwllsncmb2cqrq1kj"))

(define rust-wiggle-34.0.2
  (crate-source "wiggle" "34.0.2"
                "009i3sxfji1r6xpn5b3k1m574b5djm28ywvlnzl364lqdb5kn7dn"))

(define rust-wiggle-generate-34.0.2
  (crate-source "wiggle-generate" "34.0.2"
                "1ynndq1c4zg8im46ljzgvvgm4c810bivcs5gq38jn3bx6lb9hzvf"))

(define rust-wiggle-macro-34.0.2
  (crate-source "wiggle-macro" "34.0.2"
                "1fdkijdi5az3dz14pdscr8rfdy3anw4vv239zdbxqy1ahsbma88y"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.5
  (crate-source "winapi-util" "0.1.5"
                "0y71bp7f6d536czj40dhqk0d55wfbbwqfp2ymqf1an5ibgl6rv3h"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-0.57.0
  (crate-source "windows" "0.57.0"
                "0hqid10bqvxa3pbpgvrh2cilf950lxsd9zqfv3rldc73v2s2qd0j"))

(define rust-windows-aarch64-gnullvm-0.48.0
  (crate-source "windows_aarch64_gnullvm" "0.48.0"
                "1g71yxi61c410pwzq05ld7si4p9hyx6lf5fkw21sinvr3cp5gbli"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-msvc-0.48.0
  (crate-source "windows_aarch64_msvc" "0.48.0"
                "1wvwipchhywcjaw73h998vzachf668fpqccbhrxzrz5xszh2gvxj"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-core-0.52.0
  (crate-source "windows-core" "0.52.0"
                "1nc3qv7sy24x0nlnb32f7alzpd6f72l4p24vl65vydbyil669ark"))

(define rust-windows-core-0.57.0
  (crate-source "windows-core" "0.57.0"
                "0bc3jxw2jw76xkk3ddvnp5b2m76qmbzv1qncgvb6qrlhl8wj9vfj"))

(define rust-windows-i686-gnu-0.48.0
  (crate-source "windows_i686_gnu" "0.48.0"
                "0hd2v9kp8fss0rzl83wzhw0s5z8q1b4875m6s1phv0yvlxi1jak2"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-msvc-0.48.0
  (crate-source "windows_i686_msvc" "0.48.0"
                "004fkyqv3if178xx9ksqc4qqv8sz8n72mpczsr2vy8ffckiwchj5"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-implement-0.57.0
  (crate-source "windows-implement" "0.57.0"
                "1mqs7qypclnmx5r8yq5jy3g2d8i27vzag9yzzzxzpdnmb70ds1wi"))

(define rust-windows-interface-0.57.0
  (crate-source "windows-interface" "0.57.0"
                "19zwlzr0q1z9s692681yb5w2lhvwcyx4v95s25hfdkd3isry9gi9"))

(define rust-windows-result-0.1.2
  (crate-source "windows-result" "0.1.2"
                "1y274q1v0vy21lhkgslpxpq1m08hvr1mcs2l88h1b1gcx0136f2y"))

(define rust-windows-sys-0.48.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.48.0"
                "1aan23v5gs7gya1lc46hqn9mdh8yph3fhxmhxlw36pn6pqc28zb7"))

(define rust-windows-sys-0.52.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-targets-0.48.0
  (crate-source "windows-targets" "0.48.0"
                "1mfzg94w0c8h4ya9sva7rra77f3iy1712af9b6bwg03wrpqbc7kv"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-x86-64-gnu-0.48.0
  (crate-source "windows_x86_64_gnu" "0.48.0"
                "1cblz5m6a8q6ha09bz4lz233dnq5sw2hpra06k9cna3n3xk8laya"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnullvm-0.48.0
  (crate-source "windows_x86_64_gnullvm" "0.48.0"
                "0lxryz3ysx0145bf3i38jkr7f9nxiym8p3syklp8f20yyk0xp5kq"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-msvc-0.48.0
  (crate-source "windows_x86_64_msvc" "0.48.0"
                "12ipr1knzj2rwjygyllfi5mkd0ihnbi3r61gag5n2jgyk5bmyl8s"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-winnow-0.7.15
  (crate-source "winnow" "0.7.15"
                "0i9rkl2rqpbnnxlgs20gmkj3nd0b2k8q55mjmpc2ybb84xwxjyfz"))

(define rust-winreg-0.55.0
  (crate-source "winreg" "0.55.0"
                "15xy060vylrsp91bc0ximx3xziwipzlrn1n2ab19w3n56x9pcnnb"))

(define rust-winx-0.36.3
  (crate-source "winx" "0.36.3"
                "0ikk6cnlfiq7dm36jqwrczxa8jyh9m2zmrdbxi3d430cha1knr7r"))

(define rust-wit-bindgen-rt-0.33.0
  (crate-source "wit-bindgen-rt" "0.33.0"
                "0g4lwfp9x6a2i1hgjn8k14nr4fsnpd5izxhc75zpi2s5cvcg6s1j"))

(define rust-witx-0.9.1
  (crate-source "witx" "0.9.1"
                "0jzgmayh2jjbv70jzfka38g4bk4g1fj9d0m70qkxpkdbbixg4rp3"))

(define rust-writeable-0.6.2
  (crate-source "writeable" "0.6.2"
                "1fg08y97n6vk7l0rnjggw3xyrii6dcqg54wqaxldrlk98zdy1pcy"))

(define rust-xflags-0.3.2
  (crate-source "xflags" "0.3.2"
                "0i490jzw7z9riqfnyginkc07j4k7isr19qq6055lamfyngxib7kx"))

(define rust-xflags-macros-0.3.2
  (crate-source "xflags-macros" "0.3.2"
                "0md1sh3h0yadrhjz2mh50xc65p0kx8qh19jvqbva5zx7zva26937"))

(define rust-xshell-0.2.2
  (crate-source "xshell" "0.2.2"
                "10d9xi5751p3bjpb8dfxxwxrplfn5m1b6l8qwjqk8ln8qmyhjivd"))

(define rust-xshell-macros-0.2.2
  (crate-source "xshell-macros" "0.2.2"
                "06n406clanafsg2zppk78xvggwynha7m6n6q8dfbznbdq9b1nc48"))

(define rust-yaml-rust-0.4.5
  (crate-source "yaml-rust" "0.4.5"
                "118wbqrr4n6wgk5rjjnlrdlahawlxc1bdsx146mwk8f79in97han"))

(define rust-yasna-0.5.2
  (crate-source "yasna" "0.5.2"
                "1ka4ixrplnrfqyl1kymdj8cwpdp2k0kdr73b57hilcn1kiab6yz1"))

(define rust-yoke-0.8.1
  (crate-source "yoke" "0.8.1"
                "0m29dm0bf5iakxgma0bj6dbmc3b8qi9b1vaw9sa76kdqmz3fbmkj"))

(define rust-yoke-derive-0.8.1
  (crate-source "yoke-derive" "0.8.1"
                "0pbyja133jnng4mrhimzdq4a0y26421g734ybgz8wsgbfhl0andn"))

(define rust-zerocopy-0.7.34
  (crate-source "zerocopy" "0.7.34"
                "11xhrwixm78m6ca1jdxf584wdwvpgg7q00vg21fhwl0psvyf71xf"))

(define rust-zerocopy-0.8.17
  (crate-source "zerocopy" "0.8.17"
                "04r7y63q0qanyk9ar9668sw8558mc0kvwfp0dp2nhfnfmiyl14da"))

(define rust-zerocopy-derive-0.7.34
  (crate-source "zerocopy-derive" "0.7.34"
                "0fqvglw01w3hp7xj9gdk1800x9j7v58s9w8ijiyiz2a7krb39s8m"))

(define rust-zerocopy-derive-0.8.17
  (crate-source "zerocopy-derive" "0.8.17"
                "09l698q12ni5470qajmxfhh9m5a6sfm37c8bzzax7jk5hcb8lw86"))

(define rust-zerofrom-0.1.6
  (crate-source "zerofrom" "0.1.6"
                "19dyky67zkjichsb7ykhv0aqws3q0jfvzww76l66c19y6gh45k2h"))

(define rust-zerofrom-derive-0.1.6
  (crate-source "zerofrom-derive" "0.1.6"
                "00l5niw7c1b0lf1vhvajpjmcnbdp2vn96jg4nmkhq2db0rp5s7np"))

(define rust-zeroize-1.8.1
  (crate-source "zeroize" "1.8.1"
                "1pjdrmjwmszpxfd7r860jx54cyk94qk59x13sc307cvr5256glyf"))

(define rust-zerotrie-0.2.3
  (crate-source "zerotrie" "0.2.3"
                "0lbqznlqazmrwwzslw0ci7p3pqxykrbfhq29npj0gmb2amxc2n9a"))

(define rust-zerovec-0.11.5
  (crate-source "zerovec" "0.11.5"
                "00m0p47k2g9mkv505hky5xh3r6ps7v8qc0dy4pspg542jj972a3c"))

(define rust-zerovec-derive-0.11.2
  (crate-source "zerovec-derive" "0.11.2"
                "1wsig4h5j7a1scd5hrlnragnazjny9qjc44hancb6p6a76ay7p7a"))

(define-cargo-inputs lookup-cargo-inputs
                     (zellij =>
                             (list rust-addr2line-0.17.0
                                   rust-adler-1.0.2
                                   rust-ahash-0.8.11
                                   rust-aho-corasick-0.7.20
                                   rust-aho-corasick-1.0.1
                                   rust-allocator-api2-0.2.21
                                   rust-ambient-authority-0.0.2
                                   rust-android-tzdata-0.1.1
                                   rust-android-system-properties-0.1.5
                                   rust-ansi-term-0.12.1
                                   rust-anyhow-1.0.95
                                   rust-arc-swap-1.5.0
                                   rust-arrayvec-0.5.2
                                   rust-arrayvec-0.7.6
                                   rust-async-channel-1.8.0
                                   rust-async-trait-0.1.80
                                   rust-atomic-waker-1.0.0
                                   rust-atty-0.2.14
                                   rust-autocfg-1.1.0
                                   rust-aws-lc-rs-1.16.2
                                   rust-aws-lc-sys-0.39.0
                                   rust-axum-0.8.4
                                   rust-axum-core-0.5.2
                                   rust-axum-extra-0.10.1
                                   rust-axum-server-0.7.2
                                   rust-backtrace-0.3.65
                                   rust-backtrace-ext-0.2.1
                                   rust-base64-0.13.0
                                   rust-base64-0.22.1
                                   rust-bitflags-1.3.2
                                   rust-bitflags-2.11.0
                                   rust-block-buffer-0.10.4
                                   rust-bstr-1.5.0
                                   rust-bumpalo-3.16.0
                                   rust-byteorder-1.4.3
                                   rust-bytes-1.11.1
                                   rust-cap-fs-ext-3.4.4
                                   rust-cap-primitives-3.4.4
                                   rust-cap-rand-3.4.4
                                   rust-cap-std-3.4.4
                                   rust-cap-time-ext-3.4.4
                                   rust-cassowary-0.3.0
                                   rust-castaway-0.1.2
                                   rust-cc-1.2.57
                                   rust-cfg-if-1.0.0
                                   rust-chrono-0.4.39
                                   rust-clap-3.2.4
                                   rust-clap-complete-3.2.1
                                   rust-clap-derive-3.2.4
                                   rust-clap-lex-0.2.2
                                   rust-close-fds-0.3.2
                                   rust-cmake-0.1.54
                                   rust-colored-2.0.0
                                   rust-colorsys-0.6.5
                                   rust-concurrent-queue-2.2.0
                                   rust-console-0.15.0
                                   rust-cookie-0.18.1
                                   rust-core-foundation-0.10.1
                                   rust-core-foundation-sys-0.8.7
                                   rust-cpufeatures-0.2.2
                                   rust-crossbeam-0.8.1
                                   rust-crossbeam-channel-0.5.4
                                   rust-crossbeam-deque-0.8.1
                                   rust-crossbeam-epoch-0.9.8
                                   rust-crossbeam-queue-0.3.5
                                   rust-crossbeam-utils-0.8.15
                                   rust-crossterm-0.28.1
                                   rust-crossterm-winapi-0.9.1
                                   rust-crypto-common-0.1.6
                                   rust-ctor-0.1.22
                                   rust-curl-0.4.44
                                   rust-curl-sys-0.4.68+curl-8.4.0
                                   rust-daemonize-0.5.0
                                   rust-data-encoding-2.9.0
                                   rust-deranged-0.5.8
                                   rust-derivative-2.2.0
                                   rust-dialoguer-0.10.4
                                   rust-digest-0.10.7
                                   rust-directories-5.0.1
                                   rust-dirs-4.0.0
                                   rust-dirs-sys-0.3.7
                                   rust-dirs-sys-0.4.1
                                   rust-displaydoc-0.2.5
                                   rust-dissimilar-1.0.6
                                   rust-doctest-file-1.0.0
                                   rust-dunce-1.0.5
                                   rust-either-1.6.1
                                   rust-embed-resource-3.0.6
                                   rust-encode-unicode-0.3.6
                                   rust-encoding-rs-0.8.34
                                   rust-equivalent-1.0.1
                                   rust-erased-serde-0.3.20
                                   rust-errno-0.3.10
                                   rust-event-listener-2.5.2
                                   rust-expect-test-1.4.1
                                   rust-fallible-iterator-0.3.0
                                   rust-fallible-streaming-iterator-0.1.9
                                   rust-fastrand-1.7.0
                                   rust-fastrand-2.1.0
                                   rust-fd-lock-4.0.2
                                   rust-file-id-0.2.2
                                   rust-filetime-0.2.25
                                   rust-find-msvc-tools-0.1.9
                                   rust-fixedbitset-0.4.2
                                   rust-fnv-1.0.7
                                   rust-foldhash-0.1.4
                                   rust-form-urlencoded-1.2.1
                                   rust-fs-err-3.1.0
                                   rust-fs-set-times-0.20.1
                                   rust-fs-extra-1.3.0
                                   rust-fsevent-sys-4.1.0
                                   rust-futures-0.3.31
                                   rust-futures-channel-0.3.31
                                   rust-futures-core-0.3.31
                                   rust-futures-executor-0.3.31
                                   rust-futures-io-0.3.31
                                   rust-futures-lite-1.13.0
                                   rust-futures-macro-0.3.31
                                   rust-futures-sink-0.3.31
                                   rust-futures-task-0.3.31
                                   rust-futures-util-0.3.31
                                   rust-fuzzy-matcher-0.3.7
                                   rust-generic-array-0.14.5
                                   rust-getopts-0.2.21
                                   rust-getrandom-0.2.10
                                   rust-getrandom-0.3.1
                                   rust-ghost-0.1.4
                                   rust-gimli-0.26.1
                                   rust-globset-0.4.10
                                   rust-h2-0.4.10
                                   rust-hashbrown-0.11.2
                                   rust-hashbrown-0.14.5
                                   rust-hashbrown-0.15.2
                                   rust-hashlink-0.8.4
                                   rust-heck-0.4.0
                                   rust-heck-0.5.0
                                   rust-hermit-abi-0.1.19
                                   rust-hermit-abi-0.3.1
                                   rust-hermit-abi-0.5.2
                                   rust-highway-0.6.4
                                   rust-http-0.2.9
                                   rust-http-1.3.1
                                   rust-http-body-1.0.1
                                   rust-http-body-util-0.1.3
                                   rust-httparse-1.10.1
                                   rust-httpdate-1.0.3
                                   rust-humantime-2.1.0
                                   rust-hyper-1.6.0
                                   rust-hyper-util-0.1.11
                                   rust-iana-time-zone-0.1.60
                                   rust-iana-time-zone-haiku-0.1.2
                                   rust-icu-collections-2.1.1
                                   rust-icu-locale-core-2.1.1
                                   rust-icu-normalizer-2.1.1
                                   rust-icu-normalizer-data-2.1.1
                                   rust-icu-properties-2.1.2
                                   rust-icu-properties-data-2.1.2
                                   rust-icu-provider-2.1.1
                                   rust-idna-1.1.0
                                   rust-idna-adapter-1.2.1
                                   rust-ignore-0.4.20
                                   rust-include-dir-0.7.3
                                   rust-include-dir-macros-0.7.3
                                   rust-indexmap-1.8.2
                                   rust-indexmap-2.7.1
                                   rust-inotify-0.9.6
                                   rust-inotify-sys-0.1.5
                                   rust-insta-1.14.0
                                   rust-instant-0.1.12
                                   rust-interprocess-2.3.1
                                   rust-inventory-0.2.3
                                   rust-io-extras-0.18.4
                                   rust-io-lifetimes-1.0.10
                                   rust-io-lifetimes-2.0.3
                                   rust-ipnet-2.9.0
                                   rust-is-terminal-0.4.7
                                   rust-is-ci-1.1.1
                                   rust-isahc-1.7.2
                                   rust-itertools-0.10.5
                                   rust-itoa-1.0.14
                                   rust-jobserver-0.1.31
                                   rust-js-sys-0.3.64
                                   rust-kdl-4.5.0
                                   rust-kqueue-1.0.7
                                   rust-kqueue-sys-1.0.3
                                   rust-lazy-static-1.4.0
                                   rust-leb128-0.2.5
                                   rust-leb128fmt-0.1.0
                                   rust-lev-distance-0.1.1
                                   rust-libc-0.2.176
                                   rust-libm-0.2.15
                                   rust-libnghttp2-sys-0.1.8+1.55.1
                                   rust-libredox-0.1.3
                                   rust-libsqlite3-sys-0.27.0
                                   rust-libssh2-sys-0.2.23
                                   rust-libz-sys-1.1.8
                                   rust-linked-hash-map-0.5.4
                                   rust-linux-raw-sys-0.3.7
                                   rust-linux-raw-sys-0.4.15
                                   rust-linux-raw-sys-0.11.0
                                   rust-litemap-0.8.1
                                   rust-lock-api-0.4.11
                                   rust-log-0.4.17
                                   rust-log-mdc-0.1.0
                                   rust-log4rs-1.2.0
                                   rust-matchit-0.8.4
                                   rust-maybe-owned-0.3.4
                                   rust-memchr-2.7.6
                                   rust-memoffset-0.6.5
                                   rust-miette-5.8.0
                                   rust-miette-derive-5.8.0
                                   rust-mime-0.3.17
                                   rust-minimal-lexical-0.2.1
                                   rust-miniz-oxide-0.5.3
                                   rust-mio-0.8.11
                                   rust-mio-1.0.3
                                   rust-multimap-0.8.3
                                   rust-names-0.14.0
                                   rust-nix-0.23.1
                                   rust-nom-7.1.1
                                   rust-notify-6.1.1
                                   rust-notify-debouncer-full-0.3.2
                                   rust-ntapi-0.4.2
                                   rust-num-conv-0.2.0
                                   rust-num-traits-0.2.15
                                   rust-num-cpus-1.17.0
                                   rust-object-0.28.4
                                   rust-once-cell-1.21.3
                                   rust-openssl-probe-0.1.5
                                   rust-openssl-probe-0.2.1
                                   rust-openssl-src-300.5.4+3.5.4
                                   rust-openssl-sys-0.9.111
                                   rust-option-ext-0.2.0
                                   rust-os-str-bytes-6.1.0
                                   rust-owo-colors-3.4.0
                                   rust-parking-2.0.0
                                   rust-parking-lot-0.11.2
                                   rust-parking-lot-0.12.1
                                   rust-parking-lot-core-0.8.5
                                   rust-parking-lot-core-0.9.9
                                   rust-pem-3.0.6
                                   rust-percent-encoding-2.3.1
                                   rust-pest-2.7.15
                                   rust-petgraph-0.6.3
                                   rust-pin-project-1.1.3
                                   rust-pin-project-internal-1.1.3
                                   rust-pin-project-lite-0.2.14
                                   rust-pin-utils-0.1.0
                                   rust-pkg-config-0.3.25
                                   rust-polling-2.2.0
                                   rust-potential-utf-0.1.4
                                   rust-powerfmt-0.2.0
                                   rust-ppv-lite86-0.2.16
                                   rust-pretty-bytes-0.2.2
                                   rust-proc-macro-error-1.0.4
                                   rust-proc-macro-error-attr-1.0.4
                                   rust-proc-macro2-1.0.93
                                   rust-prost-0.11.9
                                   rust-prost-build-0.11.9
                                   rust-prost-derive-0.11.9
                                   rust-prost-types-0.11.9
                                   rust-quote-1.0.36
                                   rust-rand-0.8.5
                                   rust-rand-0.9.0
                                   rust-rand-chacha-0.3.1
                                   rust-rand-chacha-0.9.0
                                   rust-rand-core-0.6.3
                                   rust-rand-core-0.9.0
                                   rust-rcgen-0.13.2
                                   rust-recvmsg-1.0.0
                                   rust-redox-syscall-0.2.13
                                   rust-redox-syscall-0.4.1
                                   rust-redox-syscall-0.5.13
                                   rust-redox-users-0.4.3
                                   rust-regex-1.8.1
                                   rust-regex-syntax-0.7.1
                                   rust-ring-0.17.14
                                   rust-rusqlite-0.30.0
                                   rust-rustc-demangle-0.1.21
                                   rust-rustc-version-0.4.1
                                   rust-rustix-0.37.28
                                   rust-rustix-0.38.44
                                   rust-rustix-1.1.2
                                   rust-rustix-linux-procfs-0.1.1
                                   rust-rustls-0.23.27
                                   rust-rustls-native-certs-0.8.3
                                   rust-rustls-pemfile-2.2.0
                                   rust-rustls-pki-types-1.12.0
                                   rust-rustls-webpki-0.103.13
                                   rust-rustversion-1.0.20
                                   rust-ryu-1.0.10
                                   rust-same-file-1.0.6
                                   rust-scc-2.3.4
                                   rust-schannel-0.1.22
                                   rust-scopeguard-1.1.0
                                   rust-sdd-3.0.8
                                   rust-security-framework-3.7.0
                                   rust-security-framework-sys-2.17.0
                                   rust-semver-0.11.0
                                   rust-semver-1.0.27
                                   rust-semver-parser-0.10.2
                                   rust-serde-1.0.228
                                   rust-serde-core-1.0.228
                                   rust-serde-derive-1.0.228
                                   rust-serde-json-1.0.140
                                   rust-serde-path-to-error-0.1.17
                                   rust-serde-spanned-1.0.4
                                   rust-serde-urlencoded-0.7.1
                                   rust-serde-yaml-0.8.24
                                   rust-serial-test-3.2.0
                                   rust-serial-test-derive-3.2.0
                                   rust-sha1-0.10.6
                                   rust-sha2-0.10.8
                                   rust-shell-words-1.1.0
                                   rust-shellexpand-3.0.0
                                   rust-shlex-1.3.0
                                   rust-signal-hook-0.3.18
                                   rust-signal-hook-mio-0.2.5
                                   rust-signal-hook-registry-1.4.0
                                   rust-similar-2.1.0
                                   rust-sixel-image-0.2.1
                                   rust-sixel-tokenizer-0.1.0
                                   rust-slab-0.4.6
                                   rust-sluice-0.5.5
                                   rust-smallvec-1.13.2
                                   rust-smawk-0.3.1
                                   rust-socket2-0.4.9
                                   rust-socket2-0.5.7
                                   rust-spin-0.9.8
                                   rust-ssh2-0.9.3
                                   rust-stable-deref-trait-1.2.1
                                   rust-string-interner-0.19.0
                                   rust-strip-ansi-escapes-0.1.1
                                   rust-strip-ansi-escapes-0.2.1
                                   rust-strsim-0.10.0
                                   rust-strum-0.27.2
                                   rust-strum-macros-0.27.2
                                   rust-subtle-2.6.1
                                   rust-suggest-0.4.0
                                   rust-supports-color-2.0.0
                                   rust-supports-hyperlinks-2.1.0
                                   rust-supports-unicode-2.0.0
                                   rust-syn-1.0.96
                                   rust-syn-2.0.96
                                   rust-sync-wrapper-1.0.2
                                   rust-synstructure-0.13.2
                                   rust-sysinfo-0.33.1
                                   rust-system-interface-0.27.2
                                   rust-tempfile-3.10.1
                                   rust-termcolor-1.4.1
                                   rust-terminal-size-0.1.17
                                   rust-textwrap-0.15.0
                                   rust-thiserror-1.0.61
                                   rust-thiserror-2.0.12
                                   rust-thiserror-impl-1.0.61
                                   rust-thiserror-impl-2.0.12
                                   rust-thread-id-4.0.0
                                   rust-thread-local-1.1.7
                                   rust-time-0.3.47
                                   rust-time-core-0.1.8
                                   rust-time-macros-0.2.27
                                   rust-tinystr-0.8.2
                                   rust-tokio-1.44.2
                                   rust-tokio-macros-2.5.0
                                   rust-tokio-rustls-0.26.2
                                   rust-tokio-stream-0.1.18
                                   rust-tokio-tungstenite-0.20.1
                                   rust-tokio-tungstenite-0.26.2
                                   rust-tokio-util-0.7.15
                                   rust-toml-0.5.10
                                   rust-toml-0.9.6
                                   rust-toml-datetime-0.7.5+spec-1.1.0
                                   rust-toml-parser-1.0.9+spec-1.1.0
                                   rust-toml-writer-1.0.6+spec-1.1.0
                                   rust-tower-0.5.2
                                   rust-tower-http-0.6.4
                                   rust-tower-layer-0.3.3
                                   rust-tower-service-0.3.3
                                   rust-tracing-0.1.41
                                   rust-tracing-attributes-0.1.28
                                   rust-tracing-core-0.1.33
                                   rust-tracing-futures-0.2.5
                                   rust-tungstenite-0.20.1
                                   rust-tungstenite-0.26.2
                                   rust-typenum-1.15.0
                                   rust-typetag-0.1.8
                                   rust-typetag-impl-0.1.8
                                   rust-ucd-trie-0.1.7
                                   rust-unicode-ident-1.0.1
                                   rust-unicode-linebreak-0.1.2
                                   rust-unicode-width-0.1.10
                                   rust-unicode-width-0.2.1
                                   rust-untrusted-0.9.0
                                   rust-url-2.5.4
                                   rust-urlencoding-2.1.3
                                   rust-utf-8-0.7.6
                                   rust-utf8-iter-1.0.4
                                   rust-utf8parse-0.2.0
                                   rust-uuid-1.16.0
                                   rust-vcpkg-0.2.15
                                   rust-version-check-0.9.4
                                   rust-vswhom-0.1.0
                                   rust-vswhom-sys-0.1.3
                                   rust-vte-0.10.1
                                   rust-vte-0.11.0
                                   rust-vte-0.14.1
                                   rust-vte-generate-state-changes-0.1.1
                                   rust-waker-fn-1.1.0
                                   rust-walkdir-2.3.3
                                   rust-wasi-0.11.0+wasi-snapshot-preview1
                                   rust-wasi-0.13.3+wasi-0.2.2
                                   rust-wasi-common-34.0.2
                                   rust-wasm-bindgen-0.2.87
                                   rust-wasm-bindgen-backend-0.2.87
                                   rust-wasm-bindgen-macro-0.2.87
                                   rust-wasm-bindgen-macro-support-0.2.87
                                   rust-wasm-bindgen-shared-0.2.87
                                   rust-wasm-encoder-0.239.0
                                   rust-wasmi-0.51.5
                                   rust-wasmi-collections-0.51.5
                                   rust-wasmi-core-0.51.5
                                   rust-wasmi-ir-0.51.5
                                   rust-wasmi-wasi-0.51.5
                                   rust-wasmparser-0.228.0
                                   rust-wasmparser-0.239.0
                                   rust-wast-35.0.2
                                   rust-wast-239.0.0
                                   rust-wat-1.239.0
                                   rust-wepoll-ffi-0.1.2
                                   rust-which-4.2.5
                                   rust-widestring-1.2.1
                                   rust-wiggle-34.0.2
                                   rust-wiggle-generate-34.0.2
                                   rust-wiggle-macro-34.0.2
                                   rust-winapi-0.3.9
                                   rust-winapi-i686-pc-windows-gnu-0.4.0
                                   rust-winapi-util-0.1.5
                                   rust-winapi-x86-64-pc-windows-gnu-0.4.0
                                   rust-windows-0.57.0
                                   rust-windows-core-0.52.0
                                   rust-windows-core-0.57.0
                                   rust-windows-implement-0.57.0
                                   rust-windows-interface-0.57.0
                                   rust-windows-result-0.1.2
                                   rust-windows-sys-0.48.0
                                   rust-windows-sys-0.52.0
                                   rust-windows-sys-0.59.0
                                   rust-windows-targets-0.48.0
                                   rust-windows-targets-0.52.6
                                   rust-windows-aarch64-gnullvm-0.48.0
                                   rust-windows-aarch64-gnullvm-0.52.6
                                   rust-windows-aarch64-msvc-0.48.0
                                   rust-windows-aarch64-msvc-0.52.6
                                   rust-windows-i686-gnu-0.48.0
                                   rust-windows-i686-gnu-0.52.6
                                   rust-windows-i686-gnullvm-0.52.6
                                   rust-windows-i686-msvc-0.48.0
                                   rust-windows-i686-msvc-0.52.6
                                   rust-windows-x86-64-gnu-0.48.0
                                   rust-windows-x86-64-gnu-0.52.6
                                   rust-windows-x86-64-gnullvm-0.48.0
                                   rust-windows-x86-64-gnullvm-0.52.6
                                   rust-windows-x86-64-msvc-0.48.0
                                   rust-windows-x86-64-msvc-0.52.6
                                   rust-winnow-0.7.15
                                   rust-winreg-0.55.0
                                   rust-winx-0.36.3
                                   rust-wit-bindgen-rt-0.33.0
                                   rust-witx-0.9.1
                                   rust-writeable-0.6.2
                                   rust-xflags-0.3.2
                                   rust-xflags-macros-0.3.2
                                   rust-xshell-0.2.2
                                   rust-xshell-macros-0.2.2
                                   rust-yaml-rust-0.4.5
                                   rust-yasna-0.5.2
                                   rust-yoke-0.8.1
                                   rust-yoke-derive-0.8.1
                                   rust-zerocopy-0.7.34
                                   rust-zerocopy-0.8.17
                                   rust-zerocopy-derive-0.7.34
                                   rust-zerocopy-derive-0.8.17
                                   rust-zerofrom-0.1.6
                                   rust-zerofrom-derive-0.1.6
                                   rust-zeroize-1.8.1
                                   rust-zerotrie-0.2.3
                                   rust-zerovec-0.11.5
                                   rust-zerovec-derive-0.11.2)))

(define-public zellij
  (package
    (name "zellij")
    (version "0.44.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/zellij-org/zellij")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a6w49gv63l015afy1klxfxw9sr4a309licbar7jdq5f4qx81hdg"))))
    (build-system cargo-build-system)
    (arguments
     '(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (delete 'package)
         (replace 'build
           (lambda* (#:key inputs outputs source #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (invoke "cargo" "build" "--offline" "-j" (number->string (parallel-job-count)) "--release")
               #t))))))
    (inputs (lookup-cargo-inputs 'zellij))
    (propagated-inputs (list sqlite perl))
    (home-page "https://zellij.dev")
    (synopsis "terminal workspace with batteries included")
    (description
     "This package provides a terminal workspace with batteries included.")
    (license expat)))
