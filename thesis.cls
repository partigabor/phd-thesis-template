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

% % Extend the list of base directories (not recommended)
% \makeatletter
% \def\input@path{{imgs/}{imgs/logos/}{utils/}{contents/}{fonts/}}
% \makeatother

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
\usepackage[en-US]{datetime2}
\usepackage{hologo} %LaTeX logos
\usepackage{csquotes}
\usepackage{emptypage}
\usepackage{titling}
\usepackage{titlecaps}
\usepackage{tocbibind}
\usepackage{blindtext} % Lorem ipsum
\usepackage{soul} % Crossed-out text
\usepackage[super]{nth} % Nth number
\usepackage[toc,page]{appendix}
\usepackage[dvipsnames]{xcolor} % Color names

% Colors and symbols
\definecolor{PolyU}{HTML}{8f1329}
\definecolor{Orcid}{HTML}{A6CE39}
\newcommand{\accentcolor}{PolyU}
\newcommand{\signaturesymbol}{⸙}

% Figures
\usepackage{pdflscape}
\usepackage{subfig}
\usepackage{wrapfig}

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

% Captions in floating environments
\usepackage[labelsep=quad]{caption}
\captionsetup[figure]{position=below}
\captionsetup[table]{position=above}

% Languages, scripts & fonts
\usepackage[american, bidi=basic]{babel}

% Font settings
\usepackage{fontspec}
\defaultfontfeatures{Ligatures={TeX}}

% \usepackage{lmodern} % Uncomment to use the Latin Modern Roman fontpackage (no need further setting)

% Set fonts
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
% \babelprovide[import=he, onchar=ids fonts]{hebrew}
% \babelprovide[import=sa-Deva, onchar=ids fonts]{sanskrit-devanagari}

\babelfont[*arabic]{rm}[Language=Default]{Noto Naskh Arabic}
% \babelfont[*hebrew]{rm}[Language=Default]{Noto Serif Hebrew}
% \babelfont[*devanagari]{rm}[Renderer=Harfbuzz]{Noto Serif Devanagari}

% \babelfont{rm}[Language=Default]{FreeSerif} % Scale=1.0
% \babelfont{sf}[Language=Default]{FreeSans}
% \babelfont{tt}[Language=Default, Scale=MatchLowercase]{FreeMono}

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
\newfontfamily{\ethiopicfont}[Script=Ethiopic]{Noto Serif Ethiopic}
\newfontfamily{\arabicfont}[Script=Arabic]{Noto Naskh Arabic}
\newfontfamily{\armenianfont}{Noto Serif Armenian}
\newfontfamily{\brahmifont}{Noto Sans Brahmi} % Nope on overleaf
\newfontfamily{\copticfont}[Scale=MatchLowercase]{Noto Sans Coptic}
\newfontfamily{\cuneiform}{Noto Sans Cuneiform} % Nope on overleaf
\newfontfamily{\devanagarifont}[Script=Devanagari]{Noto Serif Devanagari}
\newfontfamily{\georgianfont}[Script=Georgian]{Noto Serif Georgian}
\newfontfamily{\hebrewfont}[Script=Hebrew]{Noto Serif Hebrew}
\newfontfamily{\javanesefont}[Script=Javanese]{Noto Sans Javanese}
\newfontfamily{\linearbfont}{Noto Sans Linear B}
\newfontfamily{\malayalamfont}{Noto Serif Malayalam}
\newfontfamily{\mongolianfont}{Noto Sans Mongolian}
\newfontfamily{\nastaliqfont}{Noto Nastaliq Urdu}
\newfontfamily{\oldsoutharabianfont}{Noto Sans Old South Arabian} % Not on overleaf
\newfontfamily{\persianfont}[Script=Arabic]{Amiri}
\newfontfamily{\syriacfont}[Script=Syriac]{Noto Sans Syriac}
\newfontfamily{\tamilfont}[Script=Tamil]{Noto Serif Tamil}
\newfontfamily{\thaifont}[Script=Thai]{Noto Serif Thai}
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

% Could be solved with kotex and Noto Serif CJK (Static) OTF font collections (https://github.com/googlefonts/noto-cjk/tree/main/Serif/OTC) but not enough memory.

% Commands to use special fonts
\newcommand{\oo}[1]{\ignorespaces}

% \newcommand{\ak}[1]{\akkadian{#1}\rmfamily}
\newcommand{\am}[1]{\ethiopicfont{#1}\rmfamily}
\newcommand{\ar}[1]{\arabicfont{#1}\rmfamily}
\newcommand{\co}[1]{\copticfont{#1}\rmfamily}
\newcommand{\cu}[1]{\cuneiform{#1}\rmfamily}
\newcommand{\cy}[1]{#1}
\newcommand{\fa}[1]{\persianfont{#1}\rmfamily}
\newcommand{\gr}[1]{#1}
\newcommand{\he}[1]{\hebrewfont{#1}\rmfamily}
\newcommand{\hi}[1]{\devanagarifont{#1}\rmfamily}
\newcommand{\hy}[1]{\armenianfont{#1}\rmfamily}
\newcommand{\jp}[1]{#1}
\newcommand{\jv}[1]{\javanesefont{#1}\rmfamily}
\newcommand{\ka}[1]{\georgianfont{#1}\rmfamily}
\newcommand{\ko}[1]{#1}
\newcommand{\lb}[1]{\linearbfont{#1}\rmfamily}
\newcommand{\ml}[1]{\malayalamfont{#1}\rmfamily}
\newcommand{\mn}[1]{\mongolianfont{#1}\rmfamily}
\newcommand{\nq}[1]{\nastaliqfont{#1}\rmfamily}
\newcommand{\osa}[1]{\oldsoutharabianfont{#1}\rmfamily}
\newcommand{\sa}[1]{\devanagarifont{#1}\rmfamily}
\newcommand{\sy}[1]{\syriacfont{#1}\rmfamily}
\newcommand{\ta}[1]{\tamilfont{#1}\rmfamily}
\newcommand{\tc}[1]{\traditionalchinesefont{#1}\rmfamily}
\newcommand{\ti}[1]{\tibetanfont{#1}\rmfamily}
\newcommand{\thai}[1]{\thaifont{#1}\rmfamily}
\newcommand{\ur}[1]{\persianfont{#1}\rmfamily}
\newcommand{\zh}[1]{\simplifiedchinesefont{#1}\rmfamily}

% Cuneiform glyphs
\newcommand{\GI}{\symbol{"12100}}
\newcommand{\GA}{\symbol{"120B5}}
\newcommand{\NU}{\symbol{"12261}}
\newcommand{\UU}{\symbol{"12311}}
\newcommand{\UM}{\symbol{"1231D}}

\newcommand{\KADAMIJA}{\symbol{"1000F}\symbol{"10005}\symbol{"10016}\symbol{"1000A}}
\newcommand{\VASE}{\symbol{"100E4}}

% \newfontfamily\garamond{EB Garamond}
% \AtBeginEnvironment{quote}{\garamond}

% Page headers and footers
\usepackage{fancyhdr}
\pagestyle{fancy}
\newcommand{\textmark}[2]{\textbf{#1}\quad\color{\accentcolor}#2}%Chapter names in footer
\renewcommand*{\chaptermark}[1]{\markboth{\textmark{\chaptername\ \thechapter}{#1}}{}}
\renewcommand*{\sectionmark}[1]{\markright{\textmark{\thesection}{#1}}}
\fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \fancyfootoffset[OR]{1.85cm}%
    \fancyfoot[OR]{%
        \color{\accentcolor}\rule[-18.48mm]{1.25pt}{21.98mm}\hspace*{10pt}%Rule
        \begin{minipage}[b]{1.5cm}%
            \normalsize\textbf{\thepage}%
        \end{minipage}%
    }%
    \fancyfootoffset[EL]{1.85cm}%
    \fancyfoot[EL]{%
        \begin{minipage}[b]{1.5cm}%
            \raggedleft\normalsize\textbf{\thepage}%
        \end{minipage}%
        \hspace*{10pt}{\color{\accentcolor}\rule[-18.48mm]{1.25pt}{21.98mm}}%Rule
    }%
}
\fancypagestyle{main}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \fancyfootoffset[OR]{1.85cm}%
    \fancyfoot[OR]{%
        \footnotesize\rightmark\hspace*{1pc}{\color{\accentcolor}\rule[-18.48mm]{1.25pt}{21.98mm}}\hspace*{10pt}%Rule
        \begin{minipage}[b]{1.5cm}%
            \normalsize\textbf{\thepage}%
        \end{minipage}%
    }%
    \fancyfootoffset[EL]{1.85cm}%
    \fancyfoot[EL]{%
        \footnotesize%
        \begin{minipage}[b]{1.5cm}%
            \raggedleft\normalsize\textbf{\thepage}%
        \end{minipage}%
        \hspace*{10pt}{\color{\accentcolor}\rule[-18.48mm]{1.25pt}{21.98mm}}\hspace*{1pc}\leftmark%Rule
    }%
}
\pagestyle{main}

% Titles and sectioning
\usepackage[explicit]{titlesec}
\titleformat{\chapter}[display]%
    {\normalfont}%
    {\raggedleft\vspace{-\dimexpr\baselineskip+33.48mm\relax}\color{\accentcolor}\rule[-2mm]{2pt}{45.48mm}\quad\fontsize{60}{60}\selectfont\thechapter}%Chapter numeral and line
    {-12mm}%
    {\parbox[t]{\dimexpr\textwidth-35mm\relax}{\raggedright\huge#1}}[\phantomsection]
\titlespacing*{\chapter}{0pt}{0pt}{3em}
\titleformat{\section}%
    {\normalfont\Large}%
    {\thesection}%
    {1pc}%
    {\color{\accentcolor}#1}[\phantomsection]
\titleformat{\subsection}% Section head 
    {\normalfont\large}%
    {\thesubsection}%
    {1pc}%
    {\color{\accentcolor}#1}[\phantomsection]% Subsection head

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
    color=LimeGreen,
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

% Poetry !
\usepackage{verse} % Load before hyperref
\newcommand{\attrib}[1]{\nopagebreak \vspace*{-0.5\baselineskip} {\raggedleft \rightskip2cm\relax \footnotesize #1\par}}
\renewcommand{\poemtitlefont}{\normalfont\large\itshape\centering}

% Environments (definitions, notes, etymologies...)
\usepackage{amsthm}
\usepackage[skins, theorems]{tcolorbox}
\theoremstyle{definition}
\newtheorem{note}{Note}[section]
\newtheorem{etymology}{Etymology}

% New environment style
\newtheoremstyle{boxstyle}% name
{3pt}% Space above
{3pt}% Space below
{}% Body font
{0em}% Indent amount
{\bfseries}% Theorem head font
{.}% Punctuation after theorem head 
{0.5em}% Space after theorem head
{}% Theorem head spec (can be left empty, meaning ‘normal’)

% New environment
\theoremstyle{boxstyle}
\newtheorem{spice}{\signaturesymbol} %star
\tcbset{
    after skip=\baselineskip,
    before skip=\baselineskip,
    boxrule=0pt,
    colback=gray!15,
    enhanced jigsaw,
    frame hidden}

% Customize environment boxes
\tcolorboxenvironment{note}{borderline west={4pt}{0pt}{gray!30}}
\tcolorboxenvironment{etymology}{borderline west={4pt}{0pt}{\accentcolor}}
\tcolorboxenvironment{spice}{borderline west={4pt}{0pt}{\accentcolor}}

% Folio environment
\newcounter{foliocounter}
\renewcommand{\thefoliocounter}{\arabic{foliocounter}}
\newenvironment{folio}[1]
    {\clearpage
    \refstepcounter{foliocounter}
    \noindent\textbf{Folio~\thefoliocounter}
    \hfill\textbf{#1}\\[-2ex]
    \noindent{\color{\accentcolor}\rule{\linewidth}{0.25mm}}
    \begin{center}
    \vspace{-2ex}
    }
    {
    \end{center}
    \vspace{-2ex}
    \noindent{\color{\accentcolor}\rule{\linewidth}{0.25mm}}
    }

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

% % Normal glossaries for a much more simple solution
% \usepackage[acronym]{glossaries}
% \makeglossaries
% \loadglsentries{utils/glossary}

% Index processing
\usepackage{imakeidx}
\usepackage[columns=2,totoc]{idxlayout} % Change number of columns here
\newcommand{\tb}[1]{#1\kern.15em t}  % indicates a table
\newcommand{\fg}[1]{#1\kern.15em f}  % indicates a figure
\newcommand{\fn}[1]{#1\kern.15em n}  % indicates a footnote
% \makeindex[name=bot,title={Index of botanical names}]
\makeindex

% Simple indexing
% \usepackage{index}
% \newindex{person}{pdx}{pnd}{Index of named persons}
% \newindex{symbol}{sdx}{snd}{Index of symbolism}

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
% \DeclareFieldFormat{titlecase}{#1}
% \AtBeginBibliography{\small} % Can make the font in bibliography smaller

% Links on or off
\newcommand{\link}[1]{\ignorespaces}
% \newcommand{\link}[1]{\url{#1}}

% Enhanced graphics support
\usepackage{graphicx}
\usepackage{adjustbox}
\usepackage{tikz}
\usetikzlibrary{shadows,arrows.meta}

% Version with and without illustrations
% \newcommand{\ill}[1]{#1} % or
% \newcommand{\ill}[1]{\ignorespaces}

% Initial letters
\usepackage{lettrine}
\newcommand{\iniciale}{4} % Size in no. of lines

% Manipulate wrapfigures (bad)
% \usepackage{etoolbox}
% \BeforeBeginEnvironment{wrapfigure}{\setlength{\intextsep}{0pt}}
% \BeforeBeginEnvironment{table}{\setlength{\intextsep}{14pt}}
% does not work properly

% Background image on a page
% \usepackage[pages=some]{background}
% \backgroundsetup{
% scale=1,
% color=black,
% opacity=0.9,
% angle=0,
% contents={%
%   \includegraphics[width=\paperwidth,height=\paperheight]{imgs/piper-nigrum.jpg}
%   }%
% }
%
% Use the following code to add background image on a page:
% \BgThispage
% Some content
% \clearpage

% Linguistics
\usepackage{tipa}
\usepackage{expex}
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

% Colors
\definecolor{vanilla}{HTML}{F3E5AB}
\definecolor{cinnamon}{HTML}{D2691E}

% Define a color sample shape
\newcommand{\sample}[1]{
\begin{tikzpicture}[x=1ex,y=1ex]
\filldraw[#1] (0,0) rectangle (2.5,1);
\end{tikzpicture}}

% New commands
\newcommand{\obs}{\textsuperscript{†}}
\newcommand{\textss}{\textsuperscript}
\newcommand{\BC}{\textsc{bc}}
\newcommand{\AD}{\textsc{ad}}
\newcommand{\lgS}{\char"017F} % long S
\newcommand{\lgSS}{\char"017F\char"017F} % double long S

% Special environment
% \newcommand{\historic}[1]{{\fontspec{EB Garamond}#1}}

% Scientific names of species, taxons
\newcommand{\taxon}[1]{\emph{#1}}
\newcommand{\taxonn}[2]{\emph{#1} \footnotesize #2\normalsize}

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