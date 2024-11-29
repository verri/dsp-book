all: watch

watch:
	latexmk -pdf -synctex=1 -pvc main.tex -output-directory=build-clean

log:
	texloganalyser -wourt build/main.log

.PHONY: watch log
