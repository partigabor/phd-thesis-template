% This is thesis.cls based on polyu-thesis.cls of Tom M. Ragonneau
% Copyright 2021-2022 Tom M. Ragonneau
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2023/01/23 PolyU thesis document class]

% Load book class as basis
\newif\ifinitial
\DeclareOption{initial}{\initialtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt]{book}

% General packages
\usepackage[
    a4paper,
    includemp,
    top=33.48mm,
    left=25.20mm,
    right=4.80mm,
    bottom=33.48mm,
    marginparwidth=30mm,
    marginparsep=3mm,
    footskip=15mm,
]{geometry}
% \usepackage[a4paper]{geometry}
\usepackage[dvipsnames]{xcolor}
\usepackage{csquotes}
\usepackage{emptypage}
\usepackage{morewrites}
\usepackage{titling}
\usepackage{multirow}
\usepackage[en-US]{datetime2}
\usepackage{hologo}
\usepackage{tocbibind}
\usepackage{titlecaps}
\usepackage{blindtext}
\usepackage{soul}
\usepackage[super]{nth}
\usepackage[toc,page]{appendix}
\usepackage{pdflscape}
\usepackage{subfig}
\usepackage{wrapfig}

% Colors and symbols
\definecolor{PolyU}{HTML}{8f1329}
\definecolor{Orcid}{HTML}{A6CE39}
\newcommand{\accentcolor}{OliveGreen}
\newcommand{\signaturesymbol}{⸙}

% Languages, scripts & fonts
\usepackage[american, bidi=basic]{babel}

% Font settings
\usepackage{fontspec}
\defaultfontfeatures{Ligatures={TeX}}

% \usepackage{lmodern} % Uncomment to use the Latin Modern Roman fontpackage (no need further setting)

% Use other fonts
% \setromanfont{FreeSerif}
% \setsansfont{FreeSans}
% \setmonofont{FreeMono}

% Use a custom font
\setmainfont{Brill} 
[Path=./fonts/,
Extension=.ttf,
UprightFont=*-Roman,
BoldFont=*-Bold,
ItalicFont=*-Italic,
BoldItalicFont=*-BoldItalic]

% Automatic typesetting of certain writing systems (optional)
\babelprovide[import=ar, onchar=ids fonts]{arabic}
\babelprovide[import=he, onchar=ids fonts]{hebrew}
\babelprovide[import=sa-Deva, onchar=ids fonts]{sanskrit-devanagari}

\babelfont[*arabic]{rm}[Language=Default]{Noto Naskh Arabic}
\babelfont[*hebrew]{rm}[Language=Default]{Noto Serif Hebrew}
\babelfont[*devanagari]{rm}[Renderer=Harfbuzz]{Noto Serif Devanagari}

% East Asian scripts
\usepackage{kotex} % Provides support for KR, JP, TC (not SC).
% \setmainhangulfont{Noto Serif CJK KR} % Only on Overleaf
\setmainhangulfont[
    Path=./fonts/,
    Extension = .otf,
    UprightFont=*-Medium,
    BoldFont=*-Bold
    ]{NotoSerifKR} % Locally on your machine

% Special fonts (you need them on your computer or the fonts folder):
\newfontfamily{\tibetanfont}[Script=Tibetan]{Noto Serif Tibetan}
\newfontfamily{\traditionalchinesefont}[
    Path=./fonts/,
    Extension = .otf,
    UprightFont=*-Medium,
    BoldFont=*-Bold
    ]{NotoSerifTC}
\newfontfamily{\simplifiedchinesefont}[
    Path=./fonts/,
    Extension = .otf,
    UprightFont=*-Medium,
    BoldFont=*-Bold
    ]{NotoSerifSC}

% Commands to use special fonts
\newcommand{\bo}[1]{\tibetanfont{#1}\rmfamily}
\newcommand{\tc}[1]{\traditionalchinesefont{#1}\rmfamily}
\newcommand{\zh}[1]{\simplifiedchinesefont{#1}\rmfamily}

% Tabular environments
\usepackage{booktabs} % Nicer tables
\usepackage{tabularx} % Complex tables
\usepackage{longtable} % Long tables
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\usepackage{array}
\usepackage{multicol}
\usepackage{multirow}
\usepackage{tabto} % Jump to absolute location on the line

% Draft mode
\usepackage{ifdraft}
\ifdraft{
    \usepackage{showframe}
    \renewcommand{\ShowFrameColor}{\color{black}}
    \renewcommand{\ShowFrameLinethickness}{.5pt}}{}

% Notes
\usepackage[%
    obeyDraft,
    english,
    color=BurntOrange,
    textsize=scriptsize,
]{todonotes}

% If todonotes slows down compilation, just use marginpar
\newcommand{\amarginpar}[1]{% align the marginpar to always rag outside
    \marginpar[\raggedleft\small #1]{\raggedright\small #1}%
}

% Watermark
\usepackage[
        firstpageonly,%
        fontsize=0.07\paperwidth,%
        text={INITIAL SUBMISSION FOR\\[0.5em] EXAMINATION PURPOSE},%
        colorspec=0.9,%
    ]{draftwatermark}

% Fancy layout, comment out if not wanted
\input{utils/layout.tex}

% List of hyphenation exceptions for US English
% Source: https://ctan.org/tex-archive/info/digests/tugboat/hyphenex
\input{ushyphex}

% Spacing between lines
% The Hong Kong Polytechnic University imposes a space of 1.5 or 2
\usepackage[nodisplayskipstretch]{setspace}
\onehalfspacing
% \doublespacing

% Customize list environments
\usepackage{enumitem}
\setitemize{topsep=\parsep,itemsep=0pt}
\setenumerate{topsep=\parsep,itemsep=0pt}

% Environments (definitions, notes, etymologies)
\usepackage{amsthm}
\usepackage[skins, theorems]{tcolorbox}
\theoremstyle{definition}
\newtheorem{note}{Note}[section]
\newtheorem{etymology}{Etymology}

% New theorem style
\newtheoremstyle{newstyle}% name
{3pt}% Space above
{3pt}% Space below
{}% Body font
{0em}% Indent amount
{\bfseries}% Theorem head font
{.}% Punctuation after theorem head 
{0.5em}% Space after theorem head
{}% Theorem head spec (can be left empty, meaning ‘normal’)

% Configure new style
\theoremstyle{newstyle}
\newtheorem{whatever}{\signaturesymbol} %star
\tcbset{
    after skip=\baselineskip,
    before skip=\baselineskip,
    boxrule=0pt,
    colback=gray!15,
    enhanced jigsaw,
    frame hidden}
    
% Display environments in boxes
\tcolorboxenvironment{note}{borderline west={4pt}{0pt}{gray!30}}
\tcolorboxenvironment{etymology}{borderline west={4pt}{0pt}{\accentcolor}}
\tcolorboxenvironment{whatever}{borderline west={4pt}{0pt}{DarkOrchid}}

% Epigraph typesetting
\usepackage{epigraph}
\setlength{\epigraphwidth}{.8\textwidth}
\setlength{\epigraphrule}{0pt}
\makeatletter
\let\@oldepitext\@epitext
\let\@oldepisource\@episource
\renewcommand{\@epitext}[1]{\@oldepitext{\enquote{\itshape#1}}}
\renewcommand{\@episource}[1]{\@oldepisource{\textemdash #1}}
\makeatother

% Initial letters
\usepackage{lettrine}
\newcommand{\iniciale}{4} % Set uniform size of initials

% Cross-referencing and colorization
\usepackage[final]{hyperref} %[unicode=true]
\usepackage{nameref}
\usepackage{xurl}
\hypersetup{
    breaklinks=true,
    colorlinks=true,
    linkcolor=\accentcolor,
    anchorcolor=black,
    citecolor=\accentcolor,
    filecolor=black,
    menucolor=black,
    runcolor=pink,
    urlcolor=black!5!\accentcolor,
    linktoc=page}
    
% Automatic references
% Note: cleveref must be imported after hyperref 
\usepackage[noabbrev,capitalize]{cleveref}
\crefname{etym}{Etymology}{Etymologies}

% Glossary and acronym processing
\usepackage[
    automake,
    acronym,
    symbols,
    nopostdot=true,
    nogroupskip,
    indexonlyfirst, % Gives the page of first occurrence
]{glossaries-extra}
\newglossary[ptr]{primary}{pou}{pin}{Primary}
\setglossarystyle{long} % super % https://www.dickimaw-books.com/gallery/glossaries-styles/
\setabbreviationstyle[acronym]{long-short}
\glssetcategoryattribute{\acronymtype}{glossdesc}{firstuc}
\glssetcategoryattribute{\acronymtype}{glossnamefont}{textbf}
\glssetcategoryattribute{type=primary}{glossnamefont}{textbf}
\renewcommand*{\glsfirstlongdefaultfont}[1]{\emph{#1}}
\makeglossaries
% \glsdisablehyper % Turn hyperlinks on/off here
\loadglsentries{utils/glossary}
% Multiple glossaries:
% https://texblog.org/2014/04/01/multiple-glossaries-in-latex/

% Index processing
\usepackage{imakeidx}
\usepackage[columns=2,totoc]{idxlayout}
\newcommand{\tb}[1]{#1\kern.15em t}  % indicates a table
\newcommand{\fg}[1]{#1\kern.15em f}  % indicates a figure
\newcommand{\fn}[1]{#1\kern.15em n}  % indicates a footnote
\makeindex[intoc]

% Bibliography processing
\usepackage[
    backend=biber,
    style=apa,
    autocite=inline,
    sorting=nyt,
    sortcites=true,
    backref=true,
    backrefstyle=three,
    abbreviate=true,
    block=space,
]{biblatex}
\DefineBibliographyStrings{american}{
    backrefpage={Cited on p.},
    backrefpages={Cited on pp.}
}
\defbibheading{bibintoc}[\bibname]{
    \chapter*{#1\markboth{#1}{#1}}
    \addcontentsline{toc}{chapter}{#1}
}
\apptocmd{\sloppy}{\hbadness 10000\relax}{}{}
\appto{\bibsetup}{\sloppy}
\DeclareFieldFormat{apacase}{#1} % Title casing in APA
% \DeclareFieldFormat{titlecase}{#1}
% \AtBeginBibliography{\small} % Makes the font in bibliography smaller

% Custom commands
\newcommand{\obs}{\textsuperscript{†}}
\newcommand{\textss}{\textsuperscript}
\newcommand{\BC}{\textsc{bc}}
\newcommand{\AD}{\textsc{ad}}

% Enhanced support for graphics
\usepackage{graphicx}
\usepackage{adjustbox}
\usepackage{tikz}
\usetikzlibrary{shadows,arrows.meta}


% Linguistics
\usepackage{tipa} % Typing IPA
\usepackage{expex} % Linguistic examples
% \lingset{everyglpreamble=, everygla=\it, everyglb=\small, belowglpreambleskip=-0.5ex, aboveglftskip=-0.5ex}

% Linguistic trees
\usepackage[linguistics, edges]{forest}
% Easy extra edges
\forestset{
  % From an "extra parent" to the node:
  edge to'/.style 2 args={% #1 = the extra parent, #2 = the edge style
    tikz+={\path[#2](#1.parent anchor)--(.child anchor);}
  },
  % From an "extra parent" to the node 
  % using the current edge style:
  % (If the )
  edge to/.style={% #1 = the extra parent
    edge to'/.expanded={\unexpanded{#1}}{\forestoption{edge}},
  },
  % From the node to an "extra child":
  edge from'/.style 2 args={% #1 = the extra child, #2 = the edge style
    tikz+={\path[#2](.parent anchor)--(#1.child anchor);}
  },
  % From the node to an "extra child" 
  % using the current edge style (of the extra child):
  edge from/.style={% #1 = the extra child
    edge from'/.process=_O{#1}{#1.edge},
  },
}
% The "extra parent/child" may be given as a relative node name. 
% So in the example below, we could replace
% "edge to=MG" with "edge to=!uus" (uus=up,up,sibling).
% Also: position a node between siblings: before computing xy={s/.average={s}{siblings}}, 

% Icons
\usepackage{academicons}
\newcommand{\orcid}[1]{\href{https://orcid.org/#1}{\textcolor{Orcid}{\aiOrcid}}}

% Insert coverpage and titlepage
\renewcommand{\maketitle}{%
    \hypersetup{pageanchor=false}%
    \include{utils/coverpage}%
    \include{utils/typeset}%
    \include{utils/titlepage}%
    \hypersetup{pageanchor=true}%
}

% Insert document metadata
\AtBeginDocument{%
    \hypersetup{%
        pdftitle=\thetitle,%
        pdfauthor=\theauthor,%
        pdfsubject={Ph.D. thesis},%
        pdfkeywords={},%
    }%
}
