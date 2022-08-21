all: watch

watch:
	latexmk -pdflua -pvc main.tex -output-directory=build

.PHONY:
	watch
