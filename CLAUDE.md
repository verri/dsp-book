# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains the LaTeX source for "Data Science Project: An Inductive Learning Approach" by Prof. Dr. Filipe Verri. The book is built using XeLaTeX and published on Leanpub.

## Build System

The project uses a Makefile with the following commands:

- `make watch` - Continuously builds the main book with live preview using latexmk
- `make ready` - Builds the main book, then creates A4 format for printing (two pages side by side to reduce printing costs for students)
- `make log` - Analyzes build logs for warnings and errors using texloganalyser

### Build Process Details

- Main book: `main.tex` → `build/main.pdf`
- Final A4 format: Created via `pdfjam` and `a5toa4` tools for cost-effective printing

## Architecture

The book is structured as modular LaTeX files:

- **Main files**: `main.tex` (full book)
- **Content chapters**: `chapters/` directory with individual `.tex` files (e.g., `chapters/history.tex`, `chapters/fundamental.tex`, `chapters/structured-data.tex`)
- **Front matter**: `frontmatter/` (foreword, preface)
- **Back matter**: `backmatter/` (appendices such as mathematical foundations, learning machines)
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

Companion slides for teaching. See `slides/README.md` for full guidelines.

### Slides Architecture

- **Preamble**: `slides/preamble.tex` (Metropolis theme, grayscale, book fonts)
- **Chapter slides**: `slides/<name>.tex` mirroring `chapters/<name>.tex`
- **Theme**: Metropolis, 16:9, grayscale, STIXTwo/CourierPrime fonts
- **Content**: Minimal text, exact book order, all TikZ figures reproduced

### TODO: Slides Creation
- [ ] Create slides preamble with Metropolis theme
- [ ] Create slides for Chapter 1 (History)
- [ ] Create slides for Chapter 2 (Fundamental)
- [ ] Create slides for Chapter 3 (Project)
- [ ] Create slides for Chapter 4 (Structured Data)
- [ ] Create slides for Chapter 5 (Data Handling)
- [ ] Create slides for Chapter 6 (Learning)
- [ ] Create slides for Chapter 7 (Preprocessing)
- [ ] Create slides for Chapter 8 (Validation)
- [ ] Update Makefile for new slides/ structure

### Slides Build System

Build commands:
```bash
make slides            # Build all slide sets
make slides-watch      # Watch and rebuild slides
make slides-clean      # Remove built slides
make slides-ch1        # Build Chapter 1 slides to build/slides/
```

## License

Creative Commons Attribution-NonCommercial NoDerivatives 4.0 International License
