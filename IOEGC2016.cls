% ---------------------------------------------------------------------
% Conference proceedings and article template for
% IOE Graduate Conference 2015
% ---------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IOEGC2016}[21/08/2016, v2.0]
\RequirePackage{ifthen}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}
\RequirePackage{ifpdf}      % Needed to pick between latex and pdflatex

%----------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------


\RequirePackage{times}      % Loads the Times-Roman Fonts
\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts

%----------------------------------------------------------------------
%	VARIOUS USEFUL PACKAGES
%----------------------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage[english]{babel}
\RequirePackage{booktabs}

\definecolor{color1}{RGB}{10,10,50} % Color of the article title and sections
\definecolor{color2}{RGB}{50,50,10} % Color of the boxes behind the abstract and headings	

%----------------------------------------------------------------------
%	MARGINS	
%----------------------------------------------------------------------
	  	  
\RequirePackage[left=0.75in,%
                right=0.75in,%
				top=1in,%
				bottom=1in,%
				headheight=11pt,%
				letterpaper]{geometry}%

\setlength{\columnsep}{0.3in} % Distance between the two columns of text
\setlength{\fboxrule}{0.5pt} % Width of the border around the abstract
				
%----------------------------------------------------------------------
%	FIGURES AND TABLES CAPTIONS
%----------------------------------------------------------------------

\RequirePackage[labelfont={bf,sf,small},%
                labelsep=colon,	%
                justification=raggedright]{caption}
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{0pt}

%----------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\lhead{}%
\chead{}%
\rhead{}%
\fancyhead[LE]{\small\sffamily\bfseries\@PaperTitle}
\fancyhead[RO]{\small\sffamily\bfseries\@JournalInfo}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}% % thin header rule
\renewcommand{\footrulewidth}{0.5pt}% % thin footer rule

%----------------------------------------------------------------------
%	SECTION/SUBSECTION/PARAGRAPH SET-UP
%----------------------------------------------------------------------

\RequirePackage[explicit]{titlesec}

\titleformat{\section}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering#1}}}
  []  
\titleformat{\subsection}
  {\color{color1}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%----------------------------------------------------------------------
%	TABLEOFCONTENTS SET-UP
%----------------------------------------------------------------------
\newlength{\tocsep} 
\setlength\tocsep{1.5pc} % Sets the indentation of the sections in the table of contents
\setcounter{tocdepth}{3} % Three levels in the table of contents section: sections, subsections and subsubsections

\usepackage{titletoc}
\contentsmargin{0cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize\sffamily}
  {}
  {}
  {}
  [\ \textbullet\ ]  

%----------------------------------------------------------------------
%	MULTIPLE AUTHOR SET
%----------------------------------------------------------------------  
  
\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
   \let\next\@affiliation \vskip1pt
  \else
   \let\next\relax
  \fi
\next}
	 
\newcommand{\affiliation}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}

	
%----------------------------------------------------------------------
%	LIST CONTROL
%----------------------------------------------------------------------  

\RequirePackage{enumitem}
%\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)

%----------------------------------------------------------------------
%	ABSTRACT+AUTHOR FRAME
%----------------------------------------------------------------------  

\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Archive}[1]{\def\@Archive{#1}}
\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\JournalInfo}[1]{\def\@JournalInfo{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}

% ---------------------------------------------------------------------

\renewcommand{\@maketitle}{%
\twocolumn[{%
\thispagestyle{empty}%
\vskip-36pt%
%\includegraphics{logo}
{\raggedleft\small\sffamily\bfseries\@JournalInfo\\\@Archive\par}%
\vskip20pt%
{\raggedright\color{color1}\sffamily\bfseries\fontsize{16}{20}\selectfont \@PaperTitle\par}%
\vskip10pt%
{\raggedright\color{color1}\sffamily\fontsize{12}{14}\selectfont  \@Authors\par}%
\vskip9pt%
\begingroup%
\raggedright\sffamily\small%
\footnotesize\@affiliation\par%
\endgroup%%

\vskip18pt%
\fcolorbox{color1}{white}{%
\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
\colorbox{color2!10}{%
\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
\ifx\@Keywords\@empty%
\sffamily\textbf{\abstractname}\\{\small\@Abstract}%
\else%
\sffamily\textbf{\abstractname}\\{\small\@Abstract}\\[4pt]%
\textbf{\keywordname}\\{\small\@Keywords}%
\fi%
}%
}%
%\vskip4pt%

}%
}%
\vskip25pt%
}]%
}%

%----------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------  

% Remove brackets from numbering in List of References
%\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}}
\renewcommand{\@biblabel}[1]{\color{color1}[#1]}
%\setlength{\bibitemsep}{0cm}
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
\addcontentsline{toc}{section}{\refname}%
\oldbibliography{#1}%
\setlength\itemsep{0pt}%
\fontsize{10}{10.5}\selectfont%
}

\RequirePackage[pdfusetitle]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=color2,citecolor=color1,linkcolor=color1,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}


\JournalInfo{Proceedings of IOE Graduate Conference, 2016} % Journal information
\Archive{pp. \thepage--\pageref{LastPage}} % Additional notes (e.g. copyright, DOI, review/research article)

\graphicspath{{./Graphics/}} %Folder Containing the graphics files for /includegraphics{...}
\newcommand{\keywordname}{Keywords} % Defines the keywords heading name