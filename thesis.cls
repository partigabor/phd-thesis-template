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
% This work has the LPPL maintenance status `maintained'.
% The Current Maintainer of this work is Tom M. Ragonneau.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2023/01/23 PolyU thesis class]

% Load book class as basis
\newif\ifinitial
\DeclareOption{initial}{\initialtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt]{book}

% General packages
\usepackage[a4paper]{geometry}
\usepackage[en-US]{datetime2}
\usepackage{hologo} % LaTeX logos
\usepackage{csquotes} % Quotation marks
\usepackage{emptypage} % Hide page numbers on empty pages
\usepackage{titling} % Customize maketitle
\usepackage{tocbibind} % Adds bib and ind to toc
\usepackage[dvipsnames]{xcolor} % Color names

% Colors and symbols
\definecolor{PolyU}{HTML}{8f1329}
\definecolor{Orcid}{HTML}{A6CE39}
\newcommand{\accentcolor}{PolyU}
\newcommand{\signaturesymbol}{⸙}

% Tabular environments
\usepackage{booktabs}

% Languages, scripts & fonts
\usepackage[american]{babel}

% Font
\usepackage{lmodern}

% Watermark
\usepackage[
        firstpageonly,%
        fontsize=0.07\paperwidth,%
        text={INITIAL SUBMISSION FOR\\[0.5em] EXAMINATION PURPOSE},%
        colorspec=0.9,%
    ]{draftwatermark}

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

% Cross-referencing and colorization
\usepackage[final]{hyperref} %[unicode=true]
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
    
% Glossary and acronym processing
\usepackage[
    automake,
    acronym,
    symbols,
    nopostdot=true,
    nogroupskip,
    indexonlyfirst, % Gives the page of first occurrence
]{glossaries-extra}
\setglossarystyle{long}
\setabbreviationstyle[acronym]{long-short}
\glssetcategoryattribute{\acronymtype}{glossdesc}{firstuc}
\glssetcategoryattribute{\acronymtype}{glossnamefont}{textbf}
\glssetcategoryattribute{type=primary}{glossnamefont}{textbf}
\renewcommand*{\glsfirstlongdefaultfont}[1]{\emph{#1}}
\makeglossaries
% \glsdisablehyper % Turn hyperlinks on/off here
\loadglsentries{utils/glossary}

% Index processing
\usepackage{imakeidx}
\usepackage[columns=2,totoc]{idxlayout} % Change number of columns here
\newcommand{\tb}[1]{#1\kern.15em t}  % indicates a table
\newcommand{\fg}[1]{#1\kern.15em f}  % indicates a figure
\newcommand{\fn}[1]{#1\kern.15em n}  % indicates a footnote
\makeindex

% Bibliography information processing
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

% Enhanced graphics support
\usepackage{graphicx}

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