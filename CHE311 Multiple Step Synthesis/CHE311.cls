\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CHE311}[2023/09/23 LaTeX class for CHE311 reports by David Walk, adapted from the ETH AOCP II template]

% Class based on article class
\LoadClass[11pt, twoside]{article}
\RequirePackage[english]{babel} % Change appearance of dates (and other stuff)
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{multicol}
\RequirePackage[version=4]{mhchem} % Used for chemical formulas
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[nameinlink]{cleveref}
\RequirePackage{float}
\RequirePackage{tcolorbox}
\RequirePackage[font=small, labelfont=bf, labelsep=period]{caption}
\RequirePackage[separate-uncertainty=true]{siunitx}
\RequirePackage[top=1in, bottom=1in, right=1in, left=1in]{geometry}
\RequirePackage{newfloat}
\RequirePackage{listings} % Package for inserting code
\RequirePackage{sectsty} % adds options to change section titles appearance
\RequirePackage{achemso} % Package to help with chemistry papers
\RequirePackage{chngcntr} 
\RequirePackage[leftline=false rightline=false,innerleftmargin=0, innerrightmargin=0]{mdframed}
\RequirePackage{pdfpages}
\RequirePackage[[sorting=none, style=nature, backend=biber, urldate=long]{biblatex}
\addbibresource{literature.bib}
\RequirePackage{ragged2e}
\RequirePackage{url}
\urlstyle{same} % Change URL font to be the same as normal text
\RequirePackage{multirow}
\RequirePackage{framed}

% Changing font to Utopia / fourier (https://www.overleaf.com/learn/latex/Font_typefaces)
\RequirePackage{fourier}
\RequirePackage[T1]{fontenc}

% Abbreviate Figure naming to Fig.
\addto\captionsenglish{\renewcommand{\figurename}{Fig.}}

% set figure nubmering to section.number
%\counterwithin{figure}{section}

% Add pcref referencing style: (Figure X)
\newcommand\pcref[1]{(\Cref{#1})}

% Changing Behavior of Cref
\Crefname{equation}{Eq.}{Eqs.}
\Crefname{figure}{Fig.}{Figs.}
\Crefname{tabular}{Tab.}{Tabs.}
\crefname{scheme}{scheme}{schemes}
\Crefname{Scheme}{Scheme}{Schemes}

\newmdenv[
  topline=false,
  bottomline=false,
  skipabove=\topsep,
  skipbelow=\topsep,
  leftmargin=-10pt,
  rightmargin=-10pt,
  innertopmargin=0pt,
  innerbottommargin=0pt
]{siderules}

\raggedbottom

% Redefine titles
\allsectionsfont{\bfseries\sffamily}

\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

\DeclareCaptionFormat{myformat}{#1#2#3\hrulefill}
\captionsetup[figure]{format=myformat}

% Defining Commands for maketitle
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

% header/footer settings
\fancypagestyle{CHE311}{%
  \renewcommand{\headrulewidth}{0.5pt}
  \fancyhf{}
  \fancyhead[L]{CHE311, Multiple Step Synthesis}
  \fancyhead[R]{University of Zurich, HS23}
  \fancyfoot[LE]{\textbf{\thepage} \, | \, \today}
  \fancyfoot[RO]{\today \, | \, \textbf{\thepage}}
}
\pagestyle{CHE311}

\fancypagestyle{CHE311_supp_info}{%
  \renewcommand{\headrulewidth}{0.5pt}
  \fancyhf{}
  \fancyhead[L]{CHE311, Multiple Step Synthesis \\ University of Zurich, HS23}
  \fancyhead[R]{Supplementary Information}
  \fancyfoot[LE]{\thepage \, | \, \today}
  \fancyfoot[RO]{\today \, | \, \thepage}
}

\fancypagestyle{titlepage}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% define maketitle command
\renewcommand{\maketitle}{
  \thispagestyle{titlepage}
  \title{\aocpchemical}
  \begin{center}
    \bfseries\LARGE\sffamily\aocpchemical
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
  \newpage
}

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
