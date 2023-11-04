\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PPACDW}[2023/02/12 LaTeX class for PPAC reports by David Walk based on the template from Alexander Schoch https://gitlab.com/alexander_schoch/acpc1-template]

% Class based on article class
\LoadClass[11pt, twoside]{article}
\RequirePackage[english]{babel} % Change appearance of dates (and other stuff)
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{multicol}
\RequirePackage[version=4]{mhchem} % Used for chemical formulas
\RequirePackage{xurl}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[nameinlink, noabbrev]{cleveref}
\RequirePackage{float}
\RequirePackage{tcolorbox}
\RequirePackage[font=small]{caption}
\RequirePackage[separate-uncertainty=true]{siunitx}
\RequirePackage[top=1in, bottom=1in, right=1in, left=1in]{geometry}
\RequirePackage{newfloat}
\RequirePackage{listings} % Package for inserting code
\RequirePackage{chemfig} % Draw molecules directly in LaTeX
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

% Changing font to Utopia / fourier (https://www.overleaf.com/learn/latex/Font_typefaces)
\RequirePackage{fourier}
\RequirePackage[T1]{fontenc}

% Normal spacing (fill pages up from top to bottom)
\raggedbottom

% Changing line spread
\linespread{1.25}
\renewcommand{\arraystretch}{1.25}

% Adding referencing style "pcref" for equations to reference them like this: (Equation X)
\newcommand\pcref[1]{(\autoref{#1})}

% set figure nubmering to section.number (section number is ignored if sections are not numbered)
\counterwithin{figure}

% New Column type C (Centering + define the width)
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

% No indent in new paragraphs
\setlength{\parindent}{0pt}

% Header and footer settings in document
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancypagestyle{PPAC}{
    \fancyhf{}
    \fancyhead[L]{PPAC FS23}
    \fancyhead[R]{\theexperiment}
    \fancyfoot[LE, RO]{\thepage}
}
\pagestyle{PPAC}

% Header settings on title page
\fancypagestyle{titlepage}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhead[L]{PPAC Laboratory Course \\ Spring Semester 2023}
    \fancyhead[R]{Experiment: \theexperiment \\ Group: M2}
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
\renewcommand{\author}[2]{
    \newcommand{\authorName}{#1}
    \newcommand{\authorMail}{#2}
}

\newcommand{\coauthor}[2]{
    \newcommand{\coauthorName}{#1}
    \newcommand{\coauthorMail}{#2}
}

\newcommand{\cocoauthor}[2]{
    \newcommand{\cocoauthorName}{#1}
    \newcommand{\cocoauthorMail}{#2}
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
        \cocoauthorName \par
        \href{mailto:\cocoauthorMail}{\cocoauthorMail}
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
      \parbox{155pt}{
        \centering
        \rule{150pt}{1pt}\\
        \authorName 
      }
      \parbox{155pt}{
        \centering
        \rule{150pt}{1pt}\\
        \coauthorName
      }
      \parbox{155pt}{
        \centering
        \rule{150pt}{1pt}\\
        \cocoauthorName
      }
      \vspace{1cm}
    }
}

%-----------------------------------------------------------------%

% Colors for Code Listings
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{ 
  backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}
  language=R,                      % the language of the code
  basicstyle=\footnotesize\ttfamily,        % the size of the fonts that are used for the code
  otherkeywords={1, 2, 3, 4, 5, 6, 7, 8, 9, 0},            % if you want to add more keywords to the set
  morekeywords=[2]{1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
  keywordstyle=[2]{\color{cyan}},
  keywordstyle=\color{mymauve},
  stringstyle=\color{mygreen},
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{orange},    % comment style
  deletekeywords={},               % if you want to delete keywords from the given language
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,	                   % adds a frame around the code
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
  tabsize=4,                       % sets default tabsize to 2 spaces
}