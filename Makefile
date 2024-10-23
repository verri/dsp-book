all: watch

watch:
	latexmk -shell-escape -pdfxe -synctex=1 -pvc -interaction=nonstopmode main.tex -output-directory=build

ready:
	latexmk -shell-escape -pdfxe main.tex -output-directory=build
	latexmk -shell-escape -pdfxe main-courses.tex -output-directory=build-courses
	pdfjam --keepinfo --paper a5paper --outfile build/main-fixed.pdf build/main.pdf "2-"
	a5toa4 build/main-fixed.pdf

log:
	texloganalyser -wourt build/main.log

.PHONY: watch ready log
