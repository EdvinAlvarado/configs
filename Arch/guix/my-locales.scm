(use-modules (gnu packages base))
(define my-locales
  (make-glibc-utf8-locales
	glibc
	#:locales (list "en_US" "es_ES" "ja_JP")
	#:name "my-locales"))

my-locales
