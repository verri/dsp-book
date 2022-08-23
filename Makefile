all: watch

watch:
	latexmk -pdfxe -pvc main.tex -output-directory=build

.PHONY:
	watch
