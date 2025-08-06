all: watch

watch:
	latexmk -pdfxe -synctex=1 -pvc main.tex -output-directory=build

ready:
	latexmk -pdfxe cover.tex -output-directory=build
	latexmk -pdfxe main.tex -output-directory=build
	pdfjam --keepinfo --paper a5paper --outfile build/main-fixed.pdf build/main.pdf "2-"
	a5toa4 build/main-fixed.pdf

log:
	texloganalyser -wourt build/main.log

# Slides targets
slides-ch1:
	mkdir -p build/slides
	xelatex -output-directory=build/slides slides-chapter1-history.tex

slides-ch1-watch:
	mkdir -p build/slides
	latexmk -pdfxe -synctex=1 -pvc slides-chapter1-history.tex -output-directory=build/slides

slides: slides-ch1

slides-watch: slides-ch1-watch

slides-clean:
	rm -rf build/slides

cover:
	latexmk -pdfxe -synctex=1 -pvc cover.tex -output-directory=build

.PHONY: watch ready log cover slides-ch1 slides-ch1-watch slides slides-watch slides-clean
