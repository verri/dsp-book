all: watch

watch:
	latexmk -pdfxe -synctex=1 -pvc main.tex -output-directory=build

ready:
	latexmk -pdfxe main.tex -output-directory=build
	pdfjam --keepinfo --paper a5paper --outfile build/main-fixed.pdf build/main.pdf "2-"
	a5toa4 build/main-fixed.pdf

log:
	texloganalyser -wourt build/main.log

# Slides targets
SLIDES_DIR = build/slides

slides-ch1:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -output-directory=$(SLIDES_DIR) slides/history.tex

slides-ch1-watch:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -synctex=1 -pvc -output-directory=$(SLIDES_DIR) slides/history.tex

slides: slides-ch1

slides-watch: slides-ch1-watch

slides-clean:
	rm -rf $(SLIDES_DIR)

.PHONY: watch ready log slides-ch1 slides-ch1-watch slides slides-watch slides-clean
