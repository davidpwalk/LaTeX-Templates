\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aocp2}[2023/10/03 LaTeX class for AOCP II reports by David Walk, adapted from Alexander Schoch]

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
\RequirePackage[[sorting=none, style=chem-acs, backend=biber, urldate=long]{biblatex}
\addbibresource{literature.bib}
\RequirePackage{ragged2e}
\RequirePackage{url}
\urlstyle{same} % Change URL font to be the same as normal text
\RequirePackage{multirow}

% set figure nubmering to section.number
%\counterwithin{figure}{section}

% Redefine titles
\allsectionsfont{\bfseries\sffamily}

% Defining Commands for maketitle

\renewcommand{\title}[1]{
  \newcommand{\thetitle}{#1}
}

\renewcommand{\author}[2]{
  \newcommand{\aocpauth}{#1}
  \newcommand{\aocpemail}{#2}
}
\newcommand{\compoundImage}[1]{
  \newcommand{\aocpcomp}{#1}
}
\newcommand{\compound}[1]{
  \newcommand{\aocpchemical}{#1}
}
\newcommand{\assistant}[2]{
  \newcommand{\aocpass}{#1}
  \newcommand{\aocpassmail}{#2}
}
\renewcommand{\abstract}[1]{
  \newcommand{\aocpabstract}{#1}
}

% New Column type C (Centering + define the width)
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

% header/footer settings
\fancypagestyle{aocp2}{%
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \fancyhead[L]{Praktikum AOCP II \\ ETH Zürich, HS22}
  \fancyfoot[C]{\thepage}
}
\pagestyle{aocp2}


% define maketitle command
\renewcommand{\maketitle}{
  \begin{center}
    \bfseries\LARGE\sffamily\thetitle
  \end{center}\par\bigskip
  \begin{figure}[H]
    \begin{minipage}{.49\linewidth}
      \aocpauth\par\smallskip
      \href{mailto:\aocpemail}{\aocpemail}\par\bigskip

      Assistant: \aocpass\par\smallskip
      \href{mailto:\aocpassmail}{\aocpassmail}
    \end{minipage}\hfill
    \begin{minipage}{.49\linewidth}
      \begin{tcolorbox}
        \centering
        \aocpcomp
      \end{tcolorbox}
    \end{minipage}
  \end{figure}
  \rule{\linewidth}{1pt}
    \textbf{\sffamily Abstract}\quad \aocpabstract\par
  \rule{\linewidth}{1pt}
}

% change SIrange command
\sisetup{mode=text,range-phrase = {\linebreak[0] $-$ \nolinebreak}}

% no indent
\parindent0mm

% Definition of "scheme" environment
\DeclareFloatingEnvironment[
    fileext=los,
    listname={List of Schemes},
    name=Scheme,
    placement=tbhp,
    %within=section,
]{scheme}

% Code listings
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{ 
  backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
  basicstyle=\footnotesize\ttfamily,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{mygreen},    % comment style
  deletekeywords={...},            % if you want to delete keywords from the given language
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,	                   % adds a frame around the code
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{blue},       % keyword style
  language=R,                      % the language of the code
  morekeywords={*,...},            % if you want to add more keywords to the set
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{mymauve},     % string literal style
  tabsize=2,                       % sets default tabsize to 2 spaces
}
