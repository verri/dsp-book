all: watch

watch:
	latexmk -pdfxe -pvc main.tex -output-directory=build

web:
	latexmk -pdfxe main.tex -output-directory=build
	scp -P 2222 build/main.pdf verri@dominios02.ita.br:public_html/dsp-book.pdf

.PHONY:
	watch
