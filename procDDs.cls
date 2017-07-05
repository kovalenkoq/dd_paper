%% Class file for the Proceedings of DDs
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{procDDs}[2016/03/11 Days on Diffraction Proceedings Class]
\newif\ifHyperRefs \HyperRefsfalse
\DeclareOption{HyperRefs}{\HyperRefstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt,twocolumn,twoside,a4paper]{article}
% Load styles
\let\OVER\over
\usepackage{multicol}
\usepackage{amssymb}
\usepackage{amsfonts, latexsym}
\usepackage{amsmath}
\usepackage{makeidx}
\usepackage{graphicx}
\renewcommand{\over}{\OVER}
\makeindex
%%
\newcommand{\SEPARATE}{}


%% Reset margins and text grid
\advance\voffset -1cm
\advance\hoffset 5mm
\textwidth=\paperwidth
\advance\textwidth -2in
\columnwidth \textwidth \advance\columnwidth -\columnsep
\divide\columnwidth \tw@
\oddsidemargin \z@
\evensidemargin \z@
\advance \textheight \footskip \footskip \z@
\topmargin \paperheight \advance\topmargin -\textheight
\divide\topmargin \tw@ \advance\topmargin -1in

%% «аголовки и авторы
\global\let\@author\@empty
\global\let\@authora\@empty
\global\let\@authorb\@empty
\global\let\@authorc\@empty
\global\let\@authord\@empty
\global\let\@Author\@empty
\global\let\@Authora\@empty
\global\let\@Authorb\@empty
\global\let\@Authorc\@empty
\global\let\@Authord\@empty

\newlength{\TMPauthor}% ¬спомогательна€ длина дл€ определени€ пуста ли команда

% ќпределение \author с 3 аргументами
\global\def\author#1#2#3{\settowidth{\TMPauthor}{\@author}%
                         \ifdim\TMPauthor<1mm%
                              \gdef\@author{#1}\gdef\@affil{#2}\gdef\@email{#3}
                              \gdef\@Author{\@author}
                         \else\settowidth{\TMPauthor}{\@authora}%
                         \ifdim\TMPauthor<1mm%
                              \gdef\@authora{#1}\gdef\@affila{#2}\gdef\@emaila{#3}
                              \gdef\@Authora{\@authora}
                         \else\settowidth{\TMPauthor}{\@authorb}%
                         \ifdim\TMPauthor<1mm%
                              \gdef\@authorb{#1}\gdef\@affilb{#2}\gdef\@emailb{#3}
                              \gdef\@Authorb{\@authorb}
                         \else\settowidth{\TMPauthor}{\@authorc}%
                         \ifdim\TMPauthor<1mm%
                              \gdef\@authorc{#1}\gdef\@affilc{#2}\gdef\@emailc{#3}
                              \gdef\@Authorc{\@authorc}
			 \else
                              \gdef\@authord{#1}\gdef\@affild{#2}\gdef\@emaild{#3}
                              \gdef\@Authord{\@authord}
			 \fi\fi\fi\fi}

% ѕереопределили \maketitle, чтобы было можно использовать много раз
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
        \twocolumn[\@maketitle]%
%%%\@maketitle
  \endgroup
%<<<
%\begin{multicols}{2}
%%% ќтменили переносы строки
\let\NEWLINE=\\
\let\\=\@empty
\settowidth{\TMPauthor}{\@Authora}\ifdim\TMPauthor>1mm%
	\toks2=\expandafter{\@Author}\xdef\@Author{\the\toks2, \noexpand\@Authora}\fi
\settowidth{\TMPauthor}{\@authorb}\ifdim\TMPauthor>1mm%
	\toks2=\expandafter{\@Author}\xdef\@Author{\the\toks2, \noexpand\@Authorb}\fi
\settowidth{\TMPauthor}{\@authorc}\ifdim\TMPauthor>1mm%
	\toks2=\expandafter{\@Author}\xdef\@Author{\the\toks2, \noexpand\@Authorc}\fi
\settowidth{\TMPauthor}{\@authord}\ifdim\TMPauthor>1mm%
	\toks2=\expandafter{\@Author}\xdef\@Author{\the\toks2, \noexpand\@Authord}\fi
%%% написали ссылку в toc 
\addcontentsline{toc}{report}{\protect\forauthors\string{\@Author\string}\protect\\ \protect\fortitle\string{\@title\string}}%
%% mov
%%% ¬ернули \\
\let\\=\NEWLINE
%%% ќбнулили счетчики
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty  \global\let\@affil\@empty  \global\let\@email\@empty
  \global\let\@authora\@empty  \global\let\@affila\@empty  \global\let\@emaila\@empty
  \global\let\@authorb\@empty  \global\let\@affilb\@empty  \global\let\@emailb\@empty
  \global\let\@authorc\@empty  \global\let\@affilc\@empty  \global\let\@emailc\@empty
  \global\let\@authord\@empty  \global\let\@affild\@empty  \global\let\@emaild\@empty
  \global\let\@Author\@empty    \global\let\@Authora\@empty
  \global\let\@Authorb\@empty  \global\let\@Authorc\@empty
  \global\let\@Authord\@empty
  \global\let\@title\@empty
}

% ‘ормат заголовка
\long\def\@maketitle{%
  \newpage
  \null
  {\centering
  \let \footnote \thanks
    {\LARGE\bfseries \@title \par}%
    \vskip 14pt%
    {\lineskip .5em%
       {\large\underline{\@author}}\\[1mm] \@affil
       \settowidth{\TMPauthor}{\@email}\ifdim\TMPauthor > 1mm
           ; \SEPARATE \mbox{e-mail: \texttt{\@email}}\fi
\settowidth{\TMPauthor}{\@authora}
\ifdim\TMPauthor > 1mm
       \\[2mm] {\large\underline{\@authora}}\\[1mm] \@affila
       \settowidth{\TMPauthor}{\@emaila}\ifdim\TMPauthor > 1mm
           ; \mbox{e-mail: \texttt{\@emaila}}\fi
\settowidth{\TMPauthor}{\@authorb}
\ifdim\TMPauthor > 1mm
       \\[2mm] {\large\underline{\@authorb}}\\[1mm] \@affilb
       \settowidth{\TMPauthor}{\@emailb}\ifdim\TMPauthor > 1mm
           ; e-mail:~\texttt{\@emailb}\fi
%% mov "\\ email:" -> "; e-mail: "           
\settowidth{\TMPauthor}{\@authorc}
\ifdim\TMPauthor > 1mm
       \\[2mm] {\large\underline{\@authorc}}\\[1mm] \@affilc
       \settowidth{\TMPauthor}{\@emailc}\ifdim\TMPauthor > 1mm
           \\ e-mail:\texttt{\@emailc}\fi
\settowidth{\TMPauthor}{\@authord}
\ifdim\TMPauthor > 1mm
       \\[2mm] {\large\underline{\@authord}}\\[1mm] \@affild
       \settowidth{\TMPauthor}{\@emaild}\ifdim\TMPauthor > 1mm
           \\ e-mail:\texttt{\@emaild}\fi
\fi
\fi
\fi
\fi
}%
  \par}
  \vskip 14pt
}

%% Section headings
\renewcommand{\contentsname}{\centerline{\textbf{\sc CONTENTS}}}

\renewcommand\section{%
				   \@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\scshape}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\itshape}}
%% - "\large" by mov 21.06.2011
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3ex\@plus -1ex \@minus -.2ex}%
                                     {1ex \@plus .2ex}%
                                     {\normalfont\itshape}}

%%% Redefinition of \@makecaption
%\long\def\@makecaption#1#2{\def\@capref{table}
%  \vskip\abovecaptionskip
%  \sbox\@tempboxa{#1: #2}%
%  \ifdim \wd\@tempboxa >\hsize
%    #1: #2\par
%  \else
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip
%  }

% Abstract 
\renewenvironment{abstract}{%
    \footnotesize\bfseries\parindent=0pt%
%    {\noindent\bf\textit{\abstractname{}} --- $\!$}
}%
    {\mdseries\par}

%% Roman subscripts
%\newcommand*{\ped}[1]{\ensuremath{_\mathrm{#1}}}

%% Reduce warning messages
\hbadness 5000 \vbadness 5000

% Headings
\pagestyle{myheadings}
\markboth{DAYS on DIFFRACTION \noexpand\number\year}{DAYS on DIFFRACTION \noexpand\number\year}

% Table of contents
\setcounter{tocdepth}{-2}
\newlength{\TOCspace}\setlength{\TOCspace}{2.5mm}
\newcommand{\l@report}[2]{\noindent\hspace*{0.05\textwidth}%
     \parbox[b]{0.9\textwidth}{\hspace*{-0.05\textwidth}#1
            \dotfill #2\hspace*{-0.05\textwidth}}\\[\TOCspace]}

% INDEX
\newcounter{INDEXcolumns}\setcounter{INDEXcolumns}{2}
\renewenvironment{theindex}{%
\addcontentsline{toc}{report}{\textsc{Author index}}%
\centerline{\sc Author index}%
\begin{multicols}{\theINDEXcolumns}%
\renewcommand{\item}{\par\noindent}}{\end{multicols}}

% CAPTIONS
\newcommand{\captionwidth}{0.9}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\captionwidth\hsize
   \centerline{\parbox{\captionwidth\hsize}{#1: #2}}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


% inserts of pagewidth
%\newcommand{\startWIDE}{\protect\end{multicols}\vspace*{-1.5ex}\hrule width 0.485\textwidth%
%\mbox{}\newline\vspace*{-0.5ex}}
%
%\newcommand{\stopWIDE}{\vspace*{-1.5ex}\hfill\rule{0.485\textwidth}{0.3pt}\vspace*{-1ex}\protect\begin{multicols}{2}\noindent}


% команда дл€ переопределени€ авторов указываемых в оглавлении,
% используетс€ дл€ придани€ одинакового стил€ (имена -> инициалы)
% должна быть использована после всех \author, но до \maketitle
% 
\newcommand{\Cont}[1]{\gdef\@Author{#1}%
\global\let\@Authora\@empty%
\global\let\@Authorb\@empty%
\global\let\@Authorc\@empty%
\global\let\@Authord\@empty}


% Old commands
\newcommand{\speaker}[1]{\textbf{#1}}
\newcommand{\coauthor}[3]{\author{#1}{#2}{#3}}


\endinput
