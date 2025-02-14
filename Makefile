all: watch

watch:
	latexmk -pdfxe -synctex=1 -pvc main.tex -output-directory=build

ready:
	latexmk -pdfxe cover.tex -output-directory=build
	latexmk -pdfxe main.tex -output-directory=build
	latexmk -pdfxe main-courses.tex -output-directory=build-courses
	pdfjam --keepinfo --paper a5paper --outfile build/main-fixed.pdf build/main.pdf "2-"
	a5toa4 build/main-fixed.pdf

log:
	texloganalyser -wourt build/main.log

cover:
	latexmk -pdfxe -synctex=1 -pvc cover.tex -output-directory=build

.PHONY: watch ready log
