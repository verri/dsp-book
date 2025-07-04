# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains the LaTeX source for "Data Science Project: An Inductive Learning Approach" by Prof. Dr. Filipe Verri. The book is built using XeLaTeX and published on Leanpub.

## Build System

The project uses a Makefile with the following commands:

- `make watch` - Continuously builds the main book with live preview using latexmk
- `make ready` - Builds both the main book and courses version, then creates A4 format for printing (two pages side by side to reduce printing costs for students)
- `make log` - Analyzes build logs for warnings and errors using texloganalyser

### Build Process Details

- Main book: `main.tex` → `build/main.pdf`
- Courses version: `main-courses.tex` → `build-courses/main-courses.pdf`
- Final A4 format: Created via `pdfjam` and `a5toa4` tools for cost-effective printing

## Architecture

The book is structured as modular LaTeX files:

- **Main files**: `main.tex` (full book), `main-courses.tex` (courses version)
- **Content chapters**: Individual `.tex` files for each chapter (e.g., `history.tex`, `preliminaries.tex`, `data.tex`)
- **Supporting files**: `references.bib` (bibliography), `glossary.tex` (glossary definitions)
- **Assets**: `images/` (figures), `fonts/` (custom fonts)

## Development Environment

Tested on:
- Arch Linux (kernel 6.14.6-arch1-1)
- TeX Live 2026/dev
- Latexmk 4.86a

## Document Format

- Document class: memoir (twoside, a5paper, 10pt, openright)
- Uses XeLaTeX for Unicode and font support
- Bibliography: BibLaTeX with authoryear style
- Mathematical notation: amsmath, mathtools, unicode-math
- Algorithms: algorithm2e package
- Graphics: TikZ for diagrams

## License

Creative Commons Attribution-NonCommercial NoDerivatives 4.0 International License