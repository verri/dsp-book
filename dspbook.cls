% dspbook.cls - Custom LaTeX class for "Data Science Project: An Inductive Learning Approach"
% Author: Filipe A. N. Verri
% Based on memoir class with custom styling and environments

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dspbook}[2025/01/01 Data Science Project Book Class]

% Pass all options to memoir class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

% Load base class with default options
\LoadClass[twoside,a5paper,10pt,openright]{memoir}

%% Page layout
\setlrmarginsandblock{23mm}{20mm}{*}
\setulmarginsandblock{20mm}{20mm}{*}
\checkandfixthelayout

%% Font and encoding setup
\RequirePackage[T1]{fontenc}
\RequirePackage[final]{microtype}
\RequirePackage{fontspec}
\RequirePackage{xltxtra}
\RequirePackage{sourcesanspro}
\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}

%% Language and bibliography
\RequirePackage[english]{babel}
\RequirePackage[style=authoryear,maxbibnames=99,giveninits=true,uniquename=init,backref=true]{biblatex}

%% Math packages
\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{blkarray}
\RequirePackage{nicefrac}
\RequirePackage{cancel}

%% Graphics and tables
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage[table]{xcolor}

%% Specialized packages
\RequirePackage[colorlinks]{hyperref}
\RequirePackage[super]{nth}
\RequirePackage{csquotes}
\RequirePackage{titletoc}
\RequirePackage[noend,noline,linesnumbered]{algorithm2e}
\RequirePackage[automake]{glossaries-extra}
\RequirePackage{orcidlink}
\RequirePackage{fontawesome5}
\RequirePackage[Bjornstrup]{fncychap} % must come before cleveref
\RequirePackage{cleveref}

%% TikZ and diagrams
\RequirePackage{tikz}
\usetikzlibrary{shapes, arrows.meta, positioning, shapes.geometric}
\usetikzlibrary{fit}
\usetikzlibrary{datavisualization.formats.functions}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

%% Boxes and styling
\RequirePackage{titling}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xhfill}
\RequirePackage{qrcode}

%% Math operators
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator{\Prob}{P}
\DeclareMathOperator{\E}{E}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\sign}{sign}
\DeclareMathOperator{\clamp}{clamp}

%% TikZ styles
\tikzset{%
  decision/.style={draw, diamond, text centered, minimum height=0.5cm, minimum width=1cm},
  block/.style={rectangle, draw, text width=6em, text centered, rounded corners, minimum height=3em},
  mediumblock/.style={rectangle, draw, text width=3em, text centered, rounded corners, minimum height=2em},
  darkblock/.style={block, fill=gray, text=white},
  smallblock/.style={rectangle, rounded corners, draw, font=\tiny, minimum height=1em, inner sep=2pt},
  smalldarkblock/.style={smallblock, fill=gray, text=white},
  darkcircle/.style={draw, circle, fill=gray, text centered, text=white},
  smallcircle/.style={draw, circle, text centered, font=\tiny},
  smalldarkcircle/.style={smallcircle, fill=gray, text=white},
  line/.style={draw, -latex},
  dline/.style={draw, latex-latex},
  bigarrow/.style={draw, -latex, line width=3pt, gray},
}

%% QR code commands
\newcommand{\linkwithqr}[1]{%
  \begin{minipage}{0.8\textwidth}
    \url{#1}
  \end{minipage}
  \hfill
  \begin{minipage}{0.15\textwidth}
    \qrcode[height=\textwidth]{#1}
  \end{minipage}
}

\newcommand{\aurl}{google.com}
\newenvironment{parwithqr}[1]{%
  \renewcommand\aurl{#1}%
  \noindent%
  \begin{minipage}{0.75\textwidth}%
}{%
  \end{minipage}%
  \hfill%
  \begin{minipage}{0.20\textwidth}%
    \qrcode[height=\textwidth]{\aurl}%
  \end{minipage}%
}

\newenvironment{lparwithqr}[1]{%
  \renewcommand\aurl{#1}%
  \noindent%
  \begin{minipage}{0.20\textwidth}%
    \qrcode[height=\textwidth]{\aurl}%
  \end{minipage}%
  \hfill%
  \begin{minipage}{0.75\textwidth}%
}{%
  \end{minipage}%
}

%% Layout settings
\nonfrenchspacing
\setsecnumdepth{subsection}
\maxtocdepth{subsection}

%% Hyphenation
\babelhyphenation[english]{par-a-digm pipe-line pa-ram-e-ter-ize ro-bot-ics pen-al-ty quan-ti-fi-ca-tion}

%% tcolorbox base style
\tcbset {
  base/.style={
    arc=0mm,
    bottomtitle=0.5mm,
    boxrule=0mm,
    colbacktitle=black!20!white,
    coltitle=black,
    left=2.5mm,
    leftrule=1mm,
    right=3.5mm,
    title={#1},
    toptitle=0.75mm,
    lower separated=false,
  }
}

%% Custom environments
\newtcolorbox[auto counter, number within=chapter, crefname={algorithm}{algorithms}]{algobox}[2][]{%
  float=thbp, base={Algorithm \thetcbcounter: #2},
  colframe=black!20!white, #1,
  before upper={\begin{algorithm}[H]},
  after upper={\end{algorithm}}}

\newtcbtheorem[auto counter, number within=chapter]{defbox}{Definition}{
  float=h!,
  colframe=black!20!white,
  description delimiters parenthesis,
  label type=definition,
  base
}{def}

\newtcolorbox{mainbox}[1]{
  float=ht,
  spread outwards=-2mm,
  spread inwards=-2mm,
  colframe=black!20!white,
  fonttitle=\bfseries,
  base={#1},
  left=16mm,
  right=19mm,
}

\newtcolorbox{hlbox}[1]{
  float=h,
  colframe=black!20!white,
  fonttitle=\bfseries,
  base={#1},
}

\newtcolorbox[blend into=figures]{figurebox}[2][]{%
  float=thbp,
  base={#2},
  colframe=black!20!white,
  every float=\centering, #1}

\newtcolorbox[blend into=tables]{tablebox}[2][]{%
  float=thbp, base={#2},
  colframe=black!20!white,
  every float=\centering, #1}

%% Helper commands
\newcommand\boxsubtitle[1]{%
  \vspace{0.5em}
  \noindent\xrfill[0.5ex]{1pt}[black!20]\phantom{x}\textbf{#1}\phantom{x}\xrfill[0.5ex]{1pt}[black!20]%
  \vspace{0.5em}
}

\newcommand{\code}[1]{\colorbox{black!10!white}{\texttt{#1}}}
\renewcommand{\vec}[1]{\mathbf{#1}}

%% Font setup (to be called in document)
\newcommand{\setupfonts}{%
  \setmathfont{STIXTwoMath}[
    Extension={.otf},
    Path={./fonts/},
    Scale=1]

  \setmainfont{STIXTwoText}[
    Extension={.otf},
    Path={./fonts/},
    UprightFont={*-Regular},
    BoldFont={*-Bold},
    ItalicFont={*-Italic},
    BoldItalicFont={*-BoldItalic}]

  \setmonofont{CourierPrime}[
    Extension={.ttf},
    Path={./fonts/},
    UprightFont={*-Regular},
    BoldFont={*-Bold},
    ItalicFont={*-Italic},
    BoldItalicFont={*-BoldItalic},
    Scale=0.9]

  \urlstyle{rm}
}

%% Title page command
\newcommand{\makebooktitle}{%
  \begin{titlingpage}
    \begin{tikzpicture}[remember picture, overlay]
      \fill[black!80] (current page.south west) rectangle (current page.north east);
      \node[anchor=south east, inner sep=0mm] at (current page.south east) {%
        \reflectbox{\includegraphics[width=\paperwidth]{images/bard2.jpg}}%
      };
      \node[white,anchor=north, yshift=-25mm](title) at (current page.north) {\HUGE\sffamily\uppercase{Data Science Project}};
      \node[white,anchor=north, inner sep=5mm] at (title.south) {\LARGE\sffamily\uppercase{An Inductive Learning Approach}};
      \node[anchor=south west, inner sep=11mm] at (current page.south west) {\HUGE\sffamily\uppercase{F.A.N. Verri}};
    \end{tikzpicture}
  \end{titlingpage}
}

%% Setup hyperref
\newcommand{\setuphyperref}{%
  \hypersetup{%
    pdftitle={\thetitle},
    pdfsubject={Data Science},
    pdfauthor={\theauthor},
    pdfkeywords={data science, statistics, machine learning, databases},
    urlcolor=black!60,
    linkcolor=black,
    citecolor=black,}
}

%% Handle appendices
\newcommand{\startappendices}{%
  \renewcommand{\theHchapter}{A\arabic{chapter}} % workaround for hyperref
  \appendix
}

\endinput
