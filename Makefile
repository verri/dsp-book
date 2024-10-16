all: watch

watch:
	latexmk -shell-escape -pdfxe -synctex=1 -pvc -interaction=nonstopmode main.tex -output-directory=build

web:
	latexmk -shell-escape -pdfxe main.tex -output-directory=build
	latexmk -shell-escape -pdfxe main-courses.tex -output-directory=build-courses
	pdfjam --keepinfo --paper a5paper --outfile build/main-fixed.pdf build/main.pdf "2-"
	a5toa4 build/main-fixed.pdf
	nmcli con up vpita-intranet
	scp -P 2222 build/main.pdf verri@dominios02.ita.br:public_html/dsp-book.pdf
	scp -P 2222 build-courses/main-courses.pdf verri@dominios02.ita.br:public_html/courses.pdf
	scp -P 2222 build/main-fixed-sidebyside.pdf verri@dominios02.ita.br:public_html/dsp-book-print.pdf
	nmcli con down vpita-intranet

log:
	texloganalyser -wourt build/main.log

.PHONY: watch web log
