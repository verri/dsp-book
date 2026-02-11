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

slides-ch2:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -output-directory=$(SLIDES_DIR) slides/fundamental.tex

slides-ch2-watch:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -synctex=1 -pvc -output-directory=$(SLIDES_DIR) slides/fundamental.tex

slides-ch3:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -output-directory=$(SLIDES_DIR) slides/project.tex

slides-ch3-watch:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -synctex=1 -pvc -output-directory=$(SLIDES_DIR) slides/project.tex

slides-ch4:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -output-directory=$(SLIDES_DIR) slides/structured-data.tex

slides-ch4-watch:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -synctex=1 -pvc -output-directory=$(SLIDES_DIR) slides/structured-data.tex

slides-ch5:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -output-directory=$(SLIDES_DIR) slides/data-handling.tex

slides-ch5-watch:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -synctex=1 -pvc -output-directory=$(SLIDES_DIR) slides/data-handling.tex

slides-ch6:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -output-directory=$(SLIDES_DIR) slides/learning.tex

slides-ch6-watch:
	mkdir -p $(SLIDES_DIR)
	latexmk -pdfxe -synctex=1 -pvc -output-directory=$(SLIDES_DIR) slides/learning.tex

slides: slides-ch1 slides-ch2 slides-ch3 slides-ch4 slides-ch5 slides-ch6

slides-watch: slides-ch1-watch

slides-clean:
	rm -rf $(SLIDES_DIR)

.PHONY: watch ready log slides-ch1 slides-ch1-watch slides-ch2 slides-ch2-watch slides-ch3 slides-ch3-watch slides-ch4 slides-ch4-watch slides-ch5 slides-ch5-watch slides-ch6 slides-ch6-watch slides slides-watch slides-clean
