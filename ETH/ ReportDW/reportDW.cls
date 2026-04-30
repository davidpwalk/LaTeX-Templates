\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportDW}[2026/04/17 LaTeX class for PC practical courses reports at ETH by David Walk]

% Class based on article class
\LoadClass[11pt, twoside]{article}
\usepackage[english]{babel} % Change appearance of dates (and other stuff)
\usepackage{graphicx}
\usepackage[utf8]{inputenc}
\usepackage{fancyhdr}
\usepackage{multicol}
\usepackage[version=4]{mhchem} % Used for chemical formulas
\usepackage[hidelinks]{hyperref}
\usepackage[nameinlink, noabbrev]{cleveref}
\usepackage{float}
\usepackage{tcolorbox}
\usepackage[font=small, labelfont=bf]{caption}
\usepackage[separate-uncertainty=true]{siunitx}
\usepackage[top=1in, bottom=1in, right=1in, left=1in]{geometry}
\usepackage{newfloat}
\usepackage{minted} % Package for inserting code
\usepackage{sectsty} % adds options to change section titles appearance
% \usepackage{achemso} % Package to help with chemistry papers, but leads to an error if used toeghter with the BibLaTeX package
\usepackage{chngcntr} 
\usepackage[leftline=false, rightline=false,innerleftmargin=0, innerrightmargin=0]{mdframed}
\usepackage{pdfpages}
\usepackage[[sorting=none, style=chem-angew, backend=biber, urldate=long]{biblatex}
\addbibresource{literature.bib}
\usepackage{ragged2e}
\usepackage{url}
\urlstyle{same} % Change URL font to be the same as normal text
\usepackage{multirow}
\usepackage{subfiles}
\usepackage{tikz}

% Changing font to Utopia / fourier (https://www.overleaf.com/learn/latex/Font_typefaces)
\usepackage{fourier}
\usepackage[T1]{fontenc}

% Normal spacing (fill pages up from top to bottom)
\raggedbottom

% Changing line spread
\linespread{1.25}
\renewcommand{\arraystretch}{1.25}

% Adding referencing style "pcref" for equations to reference them like this: (Equation X)
\newcommand\pcref[1]{(\Cref{#1})}

% Adding referencing style "lilyref" for equations to reference them like this: (see Equation X)
\newcommand\lilyref[1]{(see \Cref{#1})} 

% set figure nubmering to section.number (section number is ignored if sections are not numbered)
\counterwithin{figure}

% New Column type C (Centering + define the width)
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}m{#1}}

% No indent in new paragraphs
\setlength{\parindent}{0pt}

% Header and footer settings in document
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancypagestyle{spectroscopy}{
    \fancyhf{}
    \fancyhead[L]{\thelabcourse}
    \fancyhead[R]{\theexperiment}
    \fancyfoot[LE, RO]{\thepage}
}
\pagestyle{spectroscopy}

% Header settings on title page
\fancypagestyle{titlepage}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhead[L]{\thelabcourse \\ \thesemester}
    \fancyhead[R]{Experiment: \theexperiment \\ Group: \thegroup}
}

% Definition of "Scheme" environment
\DeclareFloatingEnvironment[
    fileext=los,
    listname={List of Schemes},
    name=Scheme,
    placement=H,
    %within=section,
]{scheme}

% Change \Cref to also abbreviate
\Crefname{equation}{Eq.}{Eqs.}
\Crefname{figure}{Fig.}{Figs.}
\Crefname{tabular}{Tab.}{Tabs.}

% Add custom command for labeled subfigures
% Needed for labeled subfigs
\newcounter{subfig}
\renewcommand{\thesubfig}{\alph{subfig}}

\makeatletter
\@addtoreset{subfig}{figure}
\makeatother

\makeatletter
\renewcommand{\p@subfig}{%
  \the\numexpr\value{figure}+1\relax
}
\makeatother

% New command to add labeled graphics
\newcommand{\labeledgraphic}[3]{%
  % #1 = width
  % #2 = filename
  % #3 = label name
  \refstepcounter{subfig}%
  \begin{tikzpicture}
    \node[anchor=south west, inner sep=0] (img)
      {\includegraphics[width=#1]{#2}};
    \node[anchor=north west] at (img.north west)
      {\textbf{\large\thesubfig}};  % add () around \thesubfig for brackets around labels
  \end{tikzpicture}%
  \label{#3}%
}

\Crefname{subfig}{Fig.}{Figs.}  % Change to Figure and Figures for non-abbrev names


%-----------------------------------------------------------------%
% Set up for title page

% Authors
\renewcommand{\author}[2]{
    \newcommand{\authorName}{#1}
    \newcommand{\authorMail}{#2}
}

\newcommand{\coauthor}[2]{
    \newcommand{\coauthorName}{#1}
    \newcommand{\coauthorMail}{#2}
}

% Assistant
\newcommand{\assistant}[2]{
    \newcommand{\assistantName}{#1}
    \newcommand{\assistantMail}{#2}
}

\renewcommand{\title}[1]{
  \newcommand{\thetitle}{#1}
}

\newcommand{\experiment}[1]{
    \newcommand{\theexperiment}{#1}
}

% Abstract
\renewcommand{\abstract}[1]{
  \newcommand{\theabstract}{#1}
}

\newcommand{\labcourse}[1]{
    \newcommand{\thelabcourse}{#1}
}

\newcommand{\group}[1]{
    \newcommand{\thegroup}{#1}
}

\newcommand{\semester}[1]{
    \newcommand{\thesemester}{#1}
}

% Change place (in signitature part)
\newcommand{\place}[1]{
  \newcommand{\theplace}{#1}
}

% Abschnitt command to add section like "chemicals"
\newcommand{\segment}[1]{
    \textbf{#1:}\hspace{5pt}
}

% Formatting title
\renewcommand{\maketitle}{
    \thispagestyle{titlepage}
    \vspace*{.5cm}
    \begin{center}
        {\huge\bfseries\sffamily\thetitle}
    \end{center}
    \vspace{1.5cm}
    \begin{minipage}[t]{.49\linewidth}
        \authorName \par
        \href{mailto:\authorMail}{\authorMail} \par\smallskip
        \coauthorName \par
        \href{mailto:\coauthorMail}{\coauthorMail} \par\smallskip
    \end{minipage}
    \begin{minipage}[t]{.49\linewidth}
        \begin{flushright}
            Assistant: \assistantName \par
            \href{mailto:\assistantMail}{\assistantMail}  \par\smallskip
        \end{flushright}
    \end{minipage}
    \vspace{0.8cm}
    \begin{center}
        \large\textbf{Abstract}
    \end{center} \par\smallskip
    \theabstract \par
    
    \vfill
    
    \parbox{\textwidth}{
        \centering \theplace, \today\\
        \vspace{1.5cm}
        \parbox{0.49\linewidth}{
            \centering
            \rule{150pt}{1pt}\\
        \authorName 
        }
        \parbox{0.49\linewidth}{
            \centering
            \rule{150pt}{1pt}\\
        \coauthorName
        }
    }
}