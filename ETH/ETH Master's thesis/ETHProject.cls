\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ETHProject}[2025/10/13 LaTeX class for a Master's thesis at ETH Zurich created by David Walk]

% Class based on article class
\LoadClass[11pt, twoside]{article}
\usepackage[english]{babel} % Change appearance of dates (and other stuff)
\usepackage{graphicx}
\usepackage[utf8]{inputenc}
\usepackage{fancyhdr}
\usepackage{multicol}
\usepackage[version=4]{mhchem} % Used for chemical formulas
\usepackage[hidelinks]{hyperref}
\usepackage[nameinlink]{cleveref}
\usepackage{float}
\usepackage{tcolorbox}

% Change behaviour of captions
\usepackage{caption}
\captionsetup{
    labelfont=bf,
    font=small,
    labelsep=colon,
    figurename=Fig.,
}
\usepackage[separate-uncertainty=true]{siunitx}
\usepackage[top=1in, bottom=1in, right=1in, left=1in]{geometry}
\usepackage{newfloat}
\usepackage{listings} % Package for inserting code
\usepackage{sectsty} % adds options to change section titles appearance
\usepackage{chngcntr} 
\usepackage[leftline=false, rightline=false,innerleftmargin=0, innerrightmargin=0]{mdframed}
\usepackage{pdfpages}
\usepackage[sorting=none, style=chem-angew, backend=biber, urldate=long, maxnames=20]{biblatex}
\addbibresource{literature.bib}
\usepackage{ragged2e}
\usepackage{url}
\urlstyle{same} % Change URL font to be the same as normal text
\usepackage{multirow}
\usepackage{subfiles}
\usepackage{ctable}
\usepackage{xspace} % used for cases where custom commands like \invcm are added and there should be a space behind it

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

% Change \Cref to also abbreviate
\Crefname{equation}{Eq.}{Eqs.}
\Crefname{figure}{Fig.}{Figs.}
\Crefname{tabular}{Tab.}{Tabs.}

% Customize \Cref formatting to remove parentheses for equations [Eq. (2) -> Eq. 2]
\creflabelformat{equation}{#2\textup{#1}#3}

% Adding referencing style "lilyref" for equations to reference them like this: (see Equation X)
\newcommand\lilyref[1]{(see \autoref{#1})} 

% New Column type C (Centering + define the width)
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}m{#1}}

% No indent in new paragraphs
\setlength{\parindent}{0pt}

% Header and footer settings in document
% TODO: make section title appear top left of page
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancypagestyle{main}{
    \fancyhf{}
    \fancyhead[L]{}
    % \fancyhead[R]{\vspace{-13pt}\includegraphics[width=69pt]{Figures/eth_logo_kurz_pos.png}}
    \fancyhead[R]{\nouppercase{\rightmark}}
    \fancyfoot[LE, RO]{\thepage}
}
\pagestyle{main}

% Header settings on title page
\fancypagestyle{titlepage}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% Definition of "Scheme" environment
\DeclareFloatingEnvironment[
    fileext=los,
    listname={List of Schemes},
    name=Scheme,
    placement=H,
    %within=section,
]{scheme}

%-----------------------------------------------------------------%
% Set up for title page

% Define People involved
\renewcommand{\author}[1]{
    \newcommand{\theauthor}{#1}
}

\newcommand{\supervisor}[1]{
    \newcommand{\thesupervisor}{#1}
}

\newcommand{\professor}[1]{
    \newcommand{\theprofessor}{#1}
}

\renewcommand{\title}[1]{
  \newcommand{\thetitle}{#1}
}

% Abstract
\renewcommand{\abstract}[1]{
  \newcommand{\theabstract}{#1}
}

\newcommand{\place}[1]{
  \newcommand{\theplace}{#1}
}

% Formatting title
\renewcommand{\maketitle}{
    \thispagestyle{titlepage}
    \begin{center}
        \includegraphics[width=0.55\linewidth]{Figures/eth_logo_kurz_pos.png} \\
        \vspace*{.5cm}
        \specialrule{.2em}{.1em}{.1em} 
        \vspace{0.2cm}
        {\Huge\bfseries\thetitle} \\
        \vspace{0.2cm}
        \specialrule{.2em}{.1em}{.1em}
        \vspace{2cm}
        {\LARGE\bfseries Master's Thesis} \\
        \vspace{0.35cm}
        {\Large\bfseries by \theauthor} \\
        \vspace{2cm}
        {\Large\bfseries Supervised by \thesupervisor} \\
        \vspace{0.35cm}
        {\Large\bfseries Examined by \theprofessor} \\
        \vspace{0.35cm}
        {\Large\bfseries Institute of Molecular Physical Science} \\
        \vspace{2cm}
        \Large\theplace, \Large\today \\
    \end{center}
    \vfill
}