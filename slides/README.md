# Slides

Companion slides for *Data Science Project: An Inductive Learning Approach*.

## Design Principles

- **Minimal text.** Slides use short phrases and keywords, not full sentences. The book is the reference; slides are a visual guide for lectures.
- **Exact book order.** Each slide deck follows the corresponding chapter section by section, in the same sequence. No content is reordered or reorganized.
- **All figures included.** Every `figurebox` (TikZ diagram) from the chapter must appear in the slides. Reproduce the TikZ code directly — do not use screenshots or external images.
- **Grayscale only.** No color. All visual elements use shades of gray, matching the book's aesthetic.

## File Structure

Each slide file corresponds to a chapter file:

| Chapter file | Slide file |
|---|---|
| `chapters/history.tex` | `slides/history.tex` |
| `chapters/fundamental.tex` | `slides/fundamental.tex` |
| `chapters/project.tex` | `slides/project.tex` |
| `chapters/structured-data.tex` | `slides/structured-data.tex` |
| `chapters/data-handling.tex` | `slides/data-handling.tex` |
| `chapters/learning.tex` | `slides/learning.tex` |
| `chapters/preprocessing.tex` | `slides/preprocessing.tex` |
| `chapters/validation.tex` | `slides/validation.tex` |

Shared configuration lives in `slides/preamble.tex`.

## Theme and Style

- **Beamer theme:** [Metropolis](https://github.com/matze/mtheme) (`\usetheme{metropolis}`).
- **Aspect ratio:** 16:9 (`aspectratio=169`).
- **Color scheme:** Override metropolis defaults to grayscale:
  - Dark gray (`gray 0.2`) for titles, structure, and progress bar.
  - Medium gray (`gray 0.6`) for accents and block titles.
  - Light gray (`gray 0.9`) for block body backgrounds.
  - White background for frames.
- **Fonts:** Same as the book — STIXTwoText (serif, main), STIXTwoMath (math), CourierPrime (mono). Metropolis normally uses a sans-serif font; we override this with the book fonts for visual consistency.
- **No navigation symbols.** Metropolis disables these by default.
- **Frame numbering:** `number` style (current/total) in the footer.

## Preamble (`slides/preamble.tex`)

The preamble is loaded via `\input{slides/preamble}` and provides:

- Metropolis theme with grayscale color overrides.
- Font setup (identical to `dspbook.cls`).
- Math operators (`\argmax`, `\argmin`, `\Prob`, `\E`, `\Var`, `\sign`, `\clamp`).
- TikZ libraries and styles (identical to `dspbook.cls`).
- Custom `\vec` command (`\mathbf`).
- The `\code` command for inline code.

Each slide file is a standalone document:

```latex
\input{slides/preamble}

\title{Chapter N: Title}
\subtitle{Data Science Project: An Inductive Learning Approach}
\author{Prof.~Dr.~Filipe A. N. Verri}
\date{}

\begin{document}

\maketitle

% slides here

\end{document}
```

## Slide Composition Guidelines

### Section structure

Use `\section{}` frames to mirror the chapter's top-level sections. Within each section, create one or more content frames.

### Content frames

- **Title:** Short, descriptive — matches or abbreviates the book's (sub)section heading.
- **Body:** Bullet points with keywords or short phrases. Avoid paragraphs.
- **Limit:** Aim for at most 5–6 bullet points per frame. Split into multiple frames if needed.

### Figures

- Reproduce every `figurebox` from the chapter using its TikZ code.
- Scale TikZ pictures to fit the wider 16:9 frame (`scale` or `transform shape`).
- Use a dedicated frame for each figure, titled with the figure caption from the book.
- Figures do not need the `figurebox` tcolorbox wrapper — place the `tikzpicture` directly on the frame.

### Definitions and formulas

- Present key definitions and formulas from `defbox` environments.
- Use Metropolis `block` or `exampleblock` environments for definitions.
- Keep the mathematical notation identical to the book.

### Algorithms

- Present algorithms from `algobox` environments.
- Use the `algorithm2e` package as in the book or simplify to pseudocode in a `block`.

### Tables

- Reproduce tables from `tablebox` environments.
- Use `booktabs` rules (`\toprule`, `\midrule`, `\bottomrule`).

### Chapter opening

Each slide deck starts with:

1. Title frame (`\maketitle`).
2. Epigraph frame reproducing the chapter's opening quote.
3. Overview frame listing the chapter sections.

### Chapter closing

Each slide deck ends with a final frame (use `{standout}` frame from Metropolis):

```latex
\begin{frame}[standout]
  Questions?
\end{frame}
```

## Building

From the project root:

```bash
make slides           # Build all slide decks
make slides-watch     # Watch and rebuild
make slides-clean     # Remove build artifacts
make slides-ch1       # Build a single chapter (e.g., chapter 1)
```

Build output goes to `build/slides/`.
