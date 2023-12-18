libwebman-captcha.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Webman libwebman-captcha

libwebman-captcha:
	bpc -v \
		-c bpc.conf  \
		--copt -Wno-trigraphs \
		-l webman-captcha \
		--input-file src.list

install-libwebman-captcha:
	cd Webman && bpc -l webman-captcha --install
