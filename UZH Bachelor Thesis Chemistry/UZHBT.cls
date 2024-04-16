\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UZHBT}[2024/04/11 LaTeX class for the bachelor thesis at the University of Zurich by David Walk]

% Class based on article class
\LoadClass[11pt, twoside]{article}
\RequirePackage[english]{babel} % Change appearance of dates (and other stuff)
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{multicol}
\RequirePackage[version=4]{mhchem} % Used for chemical formulas
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[nameinlink, noabbrev]{cleveref}
\RequirePackage{float}
\RequirePackage{tcolorbox}
\RequirePackage[font=small, labelfont=bf]{caption}
\RequirePackage[separate-uncertainty=true]{siunitx}
\RequirePackage[top=1in, bottom=1in, right=1in, left=1in]{geometry}
\RequirePackage{newfloat}
\RequirePackage{listings} % Package for inserting code
\RequirePackage{sectsty} % adds options to change section titles appearance
\RequirePackage{achemso} % Package to help with chemistry papers
\RequirePackage{chngcntr} 
\RequirePackage[leftline=false, rightline=false,innerleftmargin=0, innerrightmargin=0]{mdframed}
\RequirePackage{pdfpages}
\RequirePackage[[sorting=none, style=chem-angew, backend=biber, urldate=long]{biblatex}
\addbibresource{literature.bib}
\RequirePackage{ragged2e}
\RequirePackage{url}
\urlstyle{same} % Change URL font to be the same as normal text
\RequirePackage{multirow}
\RequirePackage{subfiles}

% Changing font to Utopia / fourier (https://www.overleaf.com/learn/latex/Font_typefaces)
\RequirePackage{fourier}
\RequirePackage[T1]{fontenc}

% Normal spacing (fill pages up from top to bottom)
\raggedbottom

% Changing line spread
\linespread{1.25}
\renewcommand{\arraystretch}{1.25}

% Adding referencing style "pcref" for equations to reference them like this: (Equation X)
\newcommand\pcref[1]{(\Cref{#1})}

% Adding referencing style "lilyref" for equations to reference them like this: (see Equation X)
\newcommand\lilyref[1]{(see \autoref{#1})} 

% set figure nubmering to section.number (section number is ignored if sections are not numbered)
\counterwithin{figure}

% New Column type C (Centering + define the width)
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

% No indent in new paragraphs
\setlength{\parindent}{0pt}

% Header and footer settings in document
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancypagestyle{UZHBT}{
    \fancyhf{}
    \fancyhead[L]{Bachelor Thesis}
    \fancyhead[R]{University of Zurich}
    \fancyfoot[LE, RO]{\thepage}
}
\pagestyle{UZHBT}

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

% Authors
\renewcommand{\author}[1]{
    \newcommand{\theauthor}{#1}
}

% Assistant
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

% Change place (in signitature part)
\newcommand{\place}[1]{
  \newcommand{\theplace}{#1}
}

% Formatting title
\renewcommand{\maketitle}{
    \thispagestyle{titlepage}
    \begin{center}
        \includegraphics[width=0.55\linewidth]{Figures/1200px-Universität_Zürich_logo.svg.png} \\
        \vspace*{.5cm}
        \hline
        \vspace{0.2cm}
        {\Huge\bfseries\sffamily\thetitle} \\
        \vspace{0.2cm}
        \hline \\
        \vspace{1.5cm}\
        {\LARGE\bfseries\sffamily Bachelor Thesis} \\
        \vspace{0.35cm}\
        {\bfseries\sffamily by \theauthor} \\
        \vspace{1cm}\
        {\bfseries\sffamily Supervised by \thesupervisor} \\
        {\bfseries\sffamily Examined by \theprofessor} \\
        \vspace{1cm}
        \theplace, \today \\
    \end{center}
    \vspace{1cm}
    \begin{center}
        \large\textbf{Abstract}
    \end{center} \par\smallskip
    \theabstract \par
    
    \vfill
}