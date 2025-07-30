# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains the LaTeX source for "Data Science Project: An Inductive Learning Approach" by Prof. Dr. Filipe Verri. The book is built using XeLaTeX and published on Leanpub.

## Build System

The project uses a Makefile with the following commands:

- `make watch` - Continuously builds the main book with live preview using latexmk
- `make ready` - Builds the main boo , then creates A4 format for printing (two pages side by side to reduce printing costs for students)
- `make log` - Analyzes build logs for warnings and errors using texloganalyser

### Build Process Details

- Main book: `main.tex` → `build/main.pdf`
- Final A4 format: Created via `pdfjam` and `a5toa4` tools for cost-effective printing

## Architecture

The book is structured as modular LaTeX files:

- **Main files**: `main.tex` (full book)
- **Content chapters**: Individual `.tex` files for each chapter (e.g., `history.tex`, `preliminaries.tex`, `data.tex`)
- **Supporting files**: `references.bib` (bibliography), `glossary.tex` (glossary definitions)
- **Assets**: `images/` (figures), `fonts/` (custom fonts)

## Development Environment

Tested on:
- Arch Linux (kernel 6.14.6-arch1-1)
- TeX Live 2026/dev
- Latexmk 4.86a

## Document Format

- Document class: Custom `dspbook.cls` (based on memoir)
- Page format: A5 paper, twoside, 10pt, openright
- Uses XeLaTeX for Unicode and font support
- Bibliography: BibLaTeX with authoryear style
- Mathematical notation: amsmath, mathtools, unicode-math
- Algorithms: algorithm2e package
- Graphics: TikZ for diagrams
- Custom environments: mainbox, hlbox, figurebox, tablebox, defbox, algobox
- Fonts: STIXTwo (text/math), Courier Prime (mono)

## Slides System

The project includes a complete slide system for teaching purposes:

### TODO: Slides Creation
- [x] Create slides template using beamer with book's style (fonts, colors, layout)
- [x] Create slides for Chapter 1 (History) - structure, takeaways, figures
- [ ] Create slides for Chapter 2 (Fundamental) - structure, takeaways, figures
- [ ] Create slides for Chapter 3 (Project) - structure, takeaways, figures
- [ ] Create slides for Chapter 4 (Structured Data) - structure, takeaways, figures
- [ ] Create slides for Chapter 5 (Data Handling) - structure, takeaways, figures
- [ ] Create slides for Chapter 6 (Learning) - structure, takeaways, figures
- [ ] Create slides for Chapter 7 (Preprocessing) - structure, takeaways, figures
- [ ] Create slides for Chapter 8 (Validation) - structure, takeaways, figures
- [ ] Update Makefile to include slides build targets

### Slides Architecture

- **Template**: `slides-template.tex` (beamer template matching book style)
- **Chapter slides**: `slides-chapter[X]-[name].tex` for each chapter
- **Style**: Grayscale color scheme, STIX fonts, TikZ diagrams
- **Format**: 16:9 aspect ratio, clean minimal design
- **Content**: Chapter structure, main takeaways, figures, tables, examples

### Slides Build System

To build individual chapter slides:
```bash
xelatex slides-chapter1-history.tex
```

To build all slides (when Makefile is updated):
```bash
make slides        # Build all slide sets
make slides-watch  # Watch and rebuild slides
```

## License

Creative Commons Attribution-NonCommercial NoDerivatives 4.0 International License
