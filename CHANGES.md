# Changelog

## v0.1.1

### Project restructuring

- Reorganized source files into `chapters/`, `frontmatter/`, and `backmatter/` directories.
- Created custom document class `dspbook.cls` (based on memoir, A5 twoside).
- Removed `planning.tex` and `courses.tex`.
- Updated `main.tex` to use the new structure.
- Updated Makefile with new build targets.

### Companion slides

- Created full slide sets for all chapters and the mathematical foundations appendix.
- Metropolis theme, 16:9, grayscale, matching book fonts (STIXTwo/CourierPrime).
- TikZ figures reproduced from the book.
- Added `slides/preamble.tex` shared preamble and `slides/README.md` guidelines.
- Added Makefile targets: `slides`, `slides-watch`, `slides-clean`, and per-chapter builds.

### Content

- Significantly expanded the validation chapter (hypothesis testing, confidence intervals, statistical comparison of models).
- Added discussion of Large Language Models and attention mechanisms in the history chapter.
- Improved project chapter with methodology refinements and clarifications.
- Added comments on split invariance and data leakage in the data handling chapter.
- Updated mathematical foundations appendix.
- Grammar and fluency fixes across all eight chapter files, including:
  - Fixed factual error in F-score description (higher beta gives more weight to recall, not precision).
  - Fixed sample variance summation upper limit.
  - Fixed ChatGPT release year (2020 to 2022).
  - Removed stray backticks in learning chapter.
  - Corrected typos, articles, subject-verb agreement, and punctuation throughout.
  - Standardized gender-neutral language (spokesman to spokesperson).

### Bug fixes

- Fixes #4: Definition 5.5 (Disjoint tables) corrected.
- Fixes #5: Table 4.11 data corrected to molten weather.
- Fixes #6: Added missing nycflights13 citation.
- Fixes #7: Bind definition now states that T0 and T1 are disjoint.
- Fixes #8: Grade domain no longer includes ? by definition.
- Fixes #9: Sprint retrospective duplicate definition removed.
- Fixes #10: Label in data classification is now called class.
- Fixes #11: Cited John Tukey in modern data analysis history.
- Fixes #13: Annotated tables in data handling chapter with keys.
- Fixes #14: Included Modin and LARA in algebra discussion.
- Fixes #15: Inclusion is now described as a relation, not an operation.

### Other

- Added `CLAUDE.md` project instructions.
- Updated `references.bib` with new references.
- Updated glossary with new terms.

## v0.1.0

Initial release.
