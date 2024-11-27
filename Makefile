all: watch

watch:
	latexmk -pdfxe -synctex=1 -pvc main.tex -output-directory=build-clean

log:
	texloganalyser -wourt build/main.log

.PHONY: watch ready log
