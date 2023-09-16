all: watch

watch:
	latexmk -pdfxe -pvc main.tex -output-directory=build

web:
	latexmk -pdfxe main.tex -output-directory=build
	nmcli con up vpita-intranet
	scp -P 2222 build/main.pdf verri@dominios02.ita.br:public_html/ds-book.pdf
	nmcli con down vpita-intranet

.PHONY:
	watch
