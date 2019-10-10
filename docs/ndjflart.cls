%% This is file 'ndjflart.cls'
%%
%% LaTeX 2e driver class file for the processing of LaTeX2e files
%% of the following DUP journal:
%%
%%   Notre Dame Journal of Formal Logic
%%
%% Macros written by Edgaras Sakuras, VTeX, Lithuania
%% for Duke University Press, U.S.A.
%% Please submit bugs or your comments to edgaras.sakuras@vtex.lt
%%
%% The original distribution is located at:
%% http://www.e-publications.org/dup/support % todo: add
%%
%% This class file loads base class "dupart.cls" with appropriate 
%% settings and then implements additional macros.
%%
%% You are free to use this style file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
%%
%% Bug fixes and changes: at end of file
\def\ndjfmt@name{ndjflart}
\def\ndjfmt@version{1.3.1}
\def\ndjfmt@date{2012/09/21}

\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{ndjflart}[\ndjfmt@date\space v\ndjfmt@version\space NDJFL article class (ES)]

\PassOptionsToClass{historyasfootnote,keywordsasfootnote,addressatend}{dupart}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dupart}}
\ProcessOptions*

\LoadClass{dupart}

% info about journal
\def\journal@id{-ndjfl}
\def\journal@name{Submitted on \@date\ to the Notre Dame Journal of Formal Logic}
\def\journal@issn{ISSN: 0029-4527}
\def\journal@url{http://www.nd.edu/~ndjfl/}
\let\affiliation\@gobble% todo: do we realy need it?

% page settings
\topskip=10\p@
\headheight=8\p@
\headsep=14\p@
\skip\footins=12pt plus11pt
\skip\@mpfootins=\skip\footins
\footskip=18pt
\textwidth=28pc
\textheight=48pc
\IfFileExists{\ndjfmt@name.cfg}{}{% page size is in main configuration file
  \IfFileExists{ndjflbkm.cfg}{}{% page size in BaKoMa configuration file
    \set@page@layout[pw=8.5in,ph=11in]{}%
  }%
}
% other settings (from jfl): todo: check again!
\columnsep=10pt \columnseprule=0pt
\marginparwidth=90pt
\marginparsep=11pt
\marginparpush=5pt
\fboxsep=3pt \fboxrule=.4pt
\arrayrulewidth=.4pt    \doublerulesep=2pt
\labelsep=5pt           \arraycolsep=\labelsep
\tabcolsep=\labelsep    \tabbingsep=\labelsep
\floatsep=15pt plus 12pt    \dblfloatsep=15pt plus 12pt
\textfloatsep=\floatsep  \dbltextfloatsep=15pt plus 12pt
\intextsep=\floatsep
\@fptop=0pt plus1fil     \@dblfptop=0pt plus1fil
\@fpbot=0pt plus1fil     \@dblfpbot=0pt plus1fil
\@fpsep=8pt plus2fil     \@dblfpsep=8pt plus2fil\relax
\parskip=0pt \relax
\newdimen\normalparindent
\normalparindent=12pt
\parindent=\normalparindent
\partopsep=0pt \relax \parsep=0pt \relax \itemsep=0pt \relax
\@lowpenalty=51         \@medpenalty=151        \@highpenalty=301
\@beginparpenalty=-\@lowpenalty
\@endparpenalty=-\@lowpenalty
\@itempenalty=-\@lowpenalty
\global\hbadness=500
\global\tolerance=200
\emergencystretch=.5cm
\binoppenalty=10000 
\relpenalty=10000
\AtBeginDocument{\settoheight{\footnotesep}{\small M$^1$}}
% penalties
\widowpenalty=10000
\clubpenalty=10000
\brokenpenalty=10000
% from jfl.cls
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{4}
\setcounter{dbltopnumber}{4}
\renewcommand{\topfraction}{.97}
\renewcommand{\bottomfraction}{.97}
\renewcommand{\textfraction}{.03}
\renewcommand{\floatpagefraction}{.9}
\renewcommand{\dbltopfraction}{.97}
\renewcommand{\dblfloatpagefraction}{.9}
\setlength{\floatsep}{12pt plus 6pt minus 4pt}
\setlength{\textfloatsep}{15pt plus 8pt minus 5pt}
\setlength{\intextsep}{12pt plus 6pt minus 4pt}
\setlength{\dblfloatsep}{12pt plus 6pt minus 4pt}
\setlength{\dbltextfloatsep}{15pt plus 8pt minus 5pt}
\setlength{\@fptop}{0pt}
\setlength{\@fpsep}{8pt}
\setlength{\@fpbot}{0pt plus 1fil}
\setlength{\@dblfptop}{0pt}
\setlength{\@dblfpsep}{8pt}
\setlength{\@dblfpbot}{0pt plus 1fil}

% metadata
\def\journal@name@post{,}
\def\@copyrightyear@post{, }
\def\@volume@pre{Volume }
\def\@volume@post{, }
\def\@issue@pre{Number }
\def\@issue@post{, }

%%% FONTS %%%
\def\@adjustvertspacing{% from jfl.cls (unusual, though it works)
  \bigskipamount.7\baselineskip plus.7\baselineskip
  \medskipamount\bigskipamount \divide\medskipamount\tw@
  \smallskipamount\medskipamount \divide\smallskipamount\tw@
  \abovedisplayskip\medskipamount
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip\abovedisplayskip
  \advance\abovedisplayshortskip-1\abovedisplayskip
  \belowdisplayshortskip\abovedisplayshortskip
  \advance\belowdisplayshortskip 1\smallskipamount
  \jot\baselineskip \divide\jot 4 \relax
}
\renewcommand\normalsize{%
  \@setfontsize\normalsize\@xpt\@xiipt
  \@adjustvertspacing
  \let\@listi\@listI
}
\normalsize
\renewcommand\small{%
  \@setfontsize\small\@ixpt{11}%
  \@adjustvertspacing
}
\renewcommand\footnotesize{%
  \@setfontsize\small{8}{10}%
}
\renewcommand\scriptsize{%
  \@setfontsize\small{7}{8}%
}
\renewcommand\large{%
  \@setfontsize\large\@xipt{13}%
  \@adjustvertspacing
}
\renewcommand\Large{%
  \@setfontsize\Large{\@xiipt}{14}%
  \@adjustvertspacing
}
\renewcommand\LARGE{\@setfontsize\LARGE\@xivpt{17}}
\renewcommand\huge{\@setfontsize\huge\@xviipt{20}}
\renewcommand\Huge{\@setfontsize\Huge\@xxpt{24}}
%
\newdimen\linespacing
\lineskip=1pt \lineskiplimit=1pt
\normallineskip=1pt \normallineskiplimit=1pt
\linespacing=\baselineskip
\def\opt@viiipt{8.28}
\def\opt@ixpt{9.2}
\def\opt@xipt{11}
\def\opt@xivpt{14}
\def\opt@xvipt{16.75}
\def\opt@bf{b}
\def\opt@md{m}
\def\opt@up{n}
\def\opt@sl{sl}
% For Optima user interface setup
\AtBeginDocument{%
  \@ifundefined{opt@enc}{\let\opt@enc\encodingdefault}{}%
  \@ifundefined{opt@fam}{\let\opt@fam\sfdefault}{}%
}
\define@key{opt}{enc}{\gdef\opt@enc{#1}}
\define@key{opt}{fam}{\gdef\opt@fam{#1}}
\def\setoptfont#1{\setkeys{opt}{#1}}
\@onlypreamble\setoptfont
\def\useoptfont#1#2#3#4{\usefont\opt@enc\opt@fam{#1}{#2}\fontsize{#3}{#4}\selectfont\let\itshape\slshape}
\def\optimabf#1{{\boldmath\fontencoding\opt@enc\fontfamily\opt@fam\let\itshape\slshape\bfseries%
  \expandafter\@tempdimc\f@size\p@\@tempdimb=0.92\@tempdimc\fontsize{\strip@pt\@tempdimb}\baselineskip\selectfont%
  #1}}
%%% FRONTMATTER %%%
\def\doi#1{%
  \gdef\@doi{#1}%
  \gdef\doi@text{\csname startchkuriskip\endcsname\url@fmt{}{}{#1}{\doi@base\@doi}\csname endchkuriskip\endcsname}%
}
\setattribute{abstract}    {style} {\normalfont\normaltext}

\setattribute{title}       {skip} {92\p@}
\setattribute{authors}     {skip} {24pt plus 2pt minus 2pt}
\setattribute{abstract}    {skip} {31\p@}
\setattribute{abstractname}{skip} {\hskip12pt}
\setattribute{frontmatter} {cmd}  {\vskip11\p@ plus 1\p@ minus 1\p@}
\setattribute{address}     {skip} {32\p@ plus 2\p@ minus 2\p@}

\setattribute{abstract} {width}  {24pc}
\setattribute{abstract} {indent} {\z@} %2em

\setattribute{tablecaption}{size}{\normalfont}
\setattribute{tablename}   {size}{\useoptfont\opt@bf\opt@up\opt@ixpt\opt@xipt}
\setattribute{tablename}   {skip}{\enspace}
\setattribute{figurecaption}{size}{\normalfont}
\setattribute{figurename}   {size}{\useoptfont\opt@bf\opt@up\opt@ixpt\opt@xipt}
\setattribute{figurename}   {skip}{\enspace}
\setattribute{title}      {size} {\useoptfont\opt@bf\opt@up\opt@xivpt\opt@xvipt\mathversion{bold}}
\setattribute{author}     {size} {\useoptfont\opt@md\opt@up\@xiipt\opt@xivpt}
\setattribute{ead}        {size} {}
\setattribute{history}    {size} {\useoptfont\opt@md\opt@up\@ixpt\opt@xipt}
\setattribute{abstract}   {size} {\small\upshape\mdseries}
\setattribute{quotation}  {size} {\small\upshape\mdseries}
\setattribute{quote}      {size} {\small\upshape\mdseries}
\setattribute{abstractname}{size}{\useoptfont\opt@bf\opt@up\opt@viiipt\opt@viiipt}
\setattribute{keyword}    {size} {\useoptfont\opt@md\opt@up\@ixpt\opt@xipt}
\setattribute{keywordname}{size} {\rule\z@\footnotesep}
\setattribute{pagenumber} {size} {\useoptfont\opt@md\opt@up\opt@viiipt\opt@viiipt}
\setattribute{address}    {size} {\useoptfont\opt@md\opt@up\@ixpt\@xpt}
\setattribute{addressauthor}    {size} {\useoptfont\opt@md\opt@up\@ixpt\@xpt}
\setattribute{runninghead}{size} {\useoptfont\opt@md\opt@up\@ixpt\@ixpt}
\setattribute{copyright}  {size} {\useoptfont\opt@md\opt@up\opt@viiipt\opt@xipt}
\setattribute{thebibliography}{size}{\small\sloppy\clubpenalty4000\widowpenalty4000\sfcode`\.=1000\relax}
\setattribute{dochead}    {case} {\MakeUppercase}
\setattribute{runninghead}{case} {}
\setattribute{author}   {prefix} {}
\setattribute{copyright}  {text} {\url@fmt{}{}{\journal@name}{\journal@url}\endgraf%
                                  \@ifnonempty{\@volume@pre\@volume\@volume@post\@issue@pre\@issue\@issue@post\@pubyear}}
\setattribute{copyrightowner}{name}{University of Notre Dame}
\setattribute{copyrightowner}{url}{http://www.nd.edu}
\def\copyrightowner@text{\url@fmt{}{}{\copyrightowner@name}{\copyrightowner@url}}
\setattribute{copyright} {owner} {\useoptfont\opt@md\opt@up\@ixpt\@xpt\doi@text\vrule height\z@ width 0\p@ depth13\p@}
\setattribute{email}      {text} {}
\setattribute{url}        {text} {}
\setattribute{fullurl}    {text} {}
\def\abstractname{Abstract}
\setattribute{keyword}{AMS}{\url@fmt{}{}{2010 Mathematics Subject Classification}{http://www.ams.org/mathscinet/msc/msc2010.html}:}
\setattribute{keyword}{KWD}{Keywords:}
\setattribute{keyword}{postfix}{}

\setattribute{history}  {postfix} {}

\let\author@thanksref\@gobble

\def\sday#1{#1,}

  \def\put@fmt@data{%
    \history@fmt%
    \@thanks%
    \keyword@fmt%
    \copyright@fmt%
    \abstract@fmt%
    }

  \def\contentsname@cmd{\specialsection*{\contentsname}}


%%% SECTIONS %%%
\def\fl@hangfrom#1{\noindent {#1}}
\def\TO@fl{\let\@hangfrom\fl@hangfrom}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-.7\linespacing\@plus-\linespacing}%
                                   {.5\linespacing}%
                                   {\centering\TO@fl\useoptfont\opt@bf\opt@up\opt@ixpt\@xiipt\mathversion{bold}}}

\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
                                   {-.7\linespacing\@plus-.7\linespacing}%
                                   {-.5em}
                                   {\useoptfont\opt@bf\opt@up\opt@ixpt\@xiipt\selectfont\mathversion{bold}}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-.2\linespacing\@plus-.2\linespacing}%
                                     {-.5em}
                                     {\useoptfont\opt@md\opt@sl\opt@ixpt\@xiipt}}%

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                     {\z@}%
                                     {-\fontdimen2\font}
                                     {\useoptfont\opt@md\opt@sl\opt@ixpt\@xiipt}}

\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                     {\z@}%
                                     {-\fontdimen2\font}
                                     {\useoptfont\opt@md\opt@sl\opt@ixpt\@xiipt}}
\def\section@numbersep{\ }
\def\subsection@numbersep{}
\def\subsubsection@numbersep{}
\def\paragraph@numbersep{}
\def\subparagraph@numbersep{}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

%%% FOOTNOTES/ENDNOTES %%% 
\renewcommand\@makefntext[1]{\bgroup%
    \hangindent12pt%
    \sv@parindent\z@\@makefnmark #1\egroup}

\let\footnoterule\relax

\AtBeginDocument{% todo: push to dupart?
  \@ifpackageloaded{hyperref}{}{%
    \let\hyperlink\@secondoftwo
    \let\hypertarget\@secondoftwo
  }%
}


\newdimen\bmindent
\newdimen\real@bm@indent
\real@bm@indent=20\p@

\@definecounter{endnote}% todo: push to dupart with appropriate option?
\@definecounter{endnotes}


\def\@makeenmark@txt#1{\hbox{\@textsuperscript{\normalfont #1}}}
\def\@makeenmark@lst#1{\hbox to \real@bm@indent{\hfill\normalfont #1.\hskip6.75\p@}}
\def\endnote@size{\small}
\def\endnote@fmt{\parindent=\real@bm@indent\hangindent=\real@bm@indent\parskip12\p@}
\def\endnotename{Note}
\def\endnotesname{Notes}

\def\endnote{\@ifnextchar[{\@endnote}{\@endnote[]}}
\long\def\@endnote[#1]#2{%
  \stepcounter{endnotes}%
  \ifx.#1.\stepcounter{endnote}\else\global\c@endnote=#1\relax\fi
  \long\global\@namedef{end@\the\c@endnote @note}{{\def\par{\hfill\break\hbox to 1em{}}#2}}%
  \hyperlink{endnote\the\c@endnote}{\@makeenmark@txt{\the\c@endnote}}%
}

\def\printendnotes{%
  \ifnum\c@endnotes>0\relax%
    \ifdim\bmindent>0\p@\global\real@bm@indent=\bmindent\fi%
    \ifnum\c@endnotes=1\relax% 
      \section*{\endnotename}%
    \else
      \section*{\endnotesname}%
    \fi
    \mbox{}\par\vskip-\baselineskip%
    \bgroup%
      \@tempcntb=0\relax%
      \loop%
        \ifnum\@tempcntb<\c@endnotes\relax%
          \advance\@tempcntb by 1\relax%
          \@ifundefined{end@\the\@tempcntb @note}{}{%
           \endnote@fmt\endnote@size%
            \leavevmode\llap{\@makeenmark@lst{\hypertarget{endnote\the\@tempcntb}{\the\@tempcntb}}}%
            \@nameuse{end@\the\@tempcntb @note}\par%
          }%
      \repeat%
    \egroup%
  \fi%
}

\let\footnote\endnote % todo: is it necessary? 
                      % todo: if so - complete definition, footnotemark, etc. 
\let\footnotetext\endnote

%%% BIBLIOGRAPHY %%%
\let\sv@thebibliography\thebibliography
\let\sv@endthebibliography\endthebibliography
\AtBeginDocument{%
  \def\thebibliography{%
    \begingroup%
    \printendnotes%
    \endgroup%
    \leavevmode\vskip10\p@%
    \sv@thebibliography%
  }%
  \def\endthebibliography{%
    \global\bmindent=\leftmargin%
    \immediate\write\@auxout{\string\global\string\bmindent=\the\leftmargin}%
    \sv@endthebibliography%
  }
}

\g@addto@macro\set@natbib{%
  \def\bibitem{%
    \vskip8pt%
    \@ifnextchar[{\@lbibitem}{%
      \global\NAT@stdbsttrue
      \stepcounter{NAT@ctr}\@lbibitem[\arabic{NAT@ctr}]}}%
}

% FLOATS
\abovecaptionskip=12\p@
\belowcaptionskip=12\p@
\renewcommand\figurename{Figure}

% MR 
\def\MRfixed{MR~\woMR}%

% DISPLAY (jfl.cls) todo: do we really need this?
\def\fullwidthdisplay{\displayindent\z@ \displaywidth\columnwidth}
\edef\@tempa{\noexpand\fullwidthdisplay\the\everydisplay}
\everydisplay\expandafter{\@tempa}

% ACKNOWLEDGMENTS
\newenvironment{acks}[1][Acknowledgments]{%
  \ifdim\bmindent>0\p@\global\real@bm@indent=\bmindent\fi%
  \section*{#1}%
  \mbox{}\par\vskip-\baselineskip%
  \parindent\real@bm@indent%
  \everypar{\hangindent\real@bm@indent}%
  \small%
}%
{%
  \par
}
\newenvironment{ack}{\begin{acks}[Acknowledgment]}{\end{acks}}

%%% ADDRESS %%%
\def\address@par{\par\vskip5.15pt}
\def\printaddresses{%
\vskip\address@skip%
\@tempcnta=0%
\bgroup\parindent\z@
\@whilenum{\@tempcnta<\c@address}%
  \do{%
    \advance\@tempcnta\@ne
    \ifnum\c@address>1\relax%
      \expandafter\printauthornum{\the\@tempcnta}\\[-2pt]%
    \fi%
    \expandafter\printaddressnum{\the\@tempcnta}\address@par%
     }
\egroup
}

%%% AMSMTHM %%%
\def\set@amsthm{%
  \gdef\th@remark{%
    \thm@headfont{\itshape}%
    \normalfont % body font
  }%
  \def\cancel@indent{\everypar{{\setbox\z@\lastbox }\everypar{}}}
  \def\@endtheorem{\endtrivlist \@endpefalse \aftergroup\cancel@indent}
  \gdef\thm@space@setup{%
    \thm@preskip=.5\baselineskip\@plus.2\baselineskip
                                \@minus.2\baselineskip
    \thm@postskip=\thm@preskip
  }%
  \def\ndjfl@thm@head@fnt{\useoptfont\opt@bf\opt@up\opt@ixpt\@xiipt}
  \gdef\ndjfl@thm@head@plain##1##2##3{%
  \thmname{##1}\thmnumber{\@ifnotempty{##1}{ }\@upn{##2}}%
  \thmnote{ {\ndjfl@thm@head@fnt(##3)}}\hskip8\p@}
  \global\let\thmhead@plain\ndjfl@thm@head@plain
  \def\ndjfl@thm@pre@post@skip{.5\baselineskip\@plus.2\baselineskip\@minus.2\baselineskip}
  \newtheoremstyle{plain}{\ndjfl@thm@pre@post@skip}{\ndjfl@thm@pre@post@skip}{\normalfont\itshape}{}%
    {\ndjfl@thm@head@fnt}{}{1em}{}
  \newtheoremstyle{definition}{\ndjfl@thm@pre@post@skip}{\ndjfl@thm@pre@post@skip}{\normalfont}{}%
    {\ndjfl@thm@head@fnt}{}{1em}{}
  \newtheoremstyle{remark}{\ndjfl@thm@pre@post@skip}{\ndjfl@thm@pre@post@skip}{\normalfont}{}%
    {\ndjfl@thm@head@fnt}{}{1em}{}
  \renewenvironment{proof}[1][\proofname]{\par
       \pushQED{\qed}%
       \normalfont \topsep6\p@\@plus6\p@\relax%
       \trivlist
  \item[\hskip\labelsep
        \ndjfl@thm@head@fnt
    ##1\hskip1em]\ignorespaces
  }{%
    \popQED\endtrivlist
    \@endpefalse \aftergroup\cancel@indent
  }
}
\AtBeginDocument{\gdef\upqed{\vskip-\belowdisplayskip\vskip-\baselineskip\kern0pt}}

%%%HYPHENATION%%%
% from jfl.cls
\hyphenation{NDFJL acad-e-my acad-e-mies af-ter-thought anom-aly
  anom-alies an-ti-deriv-a-tive an-tin-o-my an-tin-o-mies
  apoth-e-o-ses apoth-e-o-sis ap-pen-dix ar-che-typ-al as-sign-a-ble
  as-sist-ant-ship as-ymp-tot-ic asyn-chro-nous at-trib-uted
  at-trib-ut-able bank-rupt bank-rupt-cy bi-dif-fer-en-tial blue-print
  busier busiest cat-a-stroph-ic cat-a-stroph-i-cally con-gress
  cross-hatched data-base de-fin-i-tive de-riv-a-tive dis-trib-ute
  dri-ver dri-vers eco-nom-ics econ-o-mist elit-ist equi-vari-ant
  ex-quis-ite ex-tra-or-di-nary flow-chart for-mi-da-ble forth-right
  friv-o-lous ge-o-des-ic ge-o-det-ic geo-met-ric griev-ance griev-ous
  griev-ous-ly hexa-dec-i-mal ho-lo-no-my ho-mo-thetic ideals
  idio-syn-crasy in-fin-ite-ly in-fin-i-tes-i-mal ir-rev-o-ca-ble
  key-stroke lam-en-ta-ble light-weight mal-a-prop-ism man-u-script
  mar-gin-al meta-bol-ic me-tab-o-lism meta-lan-guage me-trop-o-lis
  met-ro-pol-i-tan mi-nut-est mol-e-cule mono-chrome mono-pole
  mo-nop-oly mono-spline mo-not-o-nous mul-ti-fac-eted
  mul-ti-plic-able non-euclid-ean non-iso-mor-phic non-smooth
  par-a-digm par-a-bol-ic pa-rab-o-loid pa-ram-e-trize para-mount
  pen-ta-gon phe-nom-e-non post-script pre-am-ble pro-ce-dur-al
  pro-hib-i-tive pro-hib-i-tive-ly pseu-do-dif-fer-en-tial
  pseu-do-fi-nite pseu-do-nym qua-drat-ic quad-ra-ture qua-si-smooth
  qua-si-sta-tion-ary qua-si-tri-an-gu-lar quin-tes-sence
  quin-tes-sen-tial re-arrange-ment rec-tan-gle ret-ri-bu-tion
  retro-fit retro-fit-ted right-eous right-eous-ness ro-bot ro-bot-ics
  sched-ul-ing se-mes-ter semi-def-i-nite semi-ho-mo-thet-ic set-up
  se-vere-ly side-step sov-er-eign spe-cious spher-oid spher-oid-al
  star-tling star-tling-ly sta-tis-tics sto-chas-tic straight-est
  strange-ness strat-a-gem strong-hold sum-ma-ble symp-to-matic
  syn-chro-nous topo-graph-i-cal tra-vers-a-ble tra-ver-sal
  tra-ver-sals treach-ery turn-around un-at-tached un-err-ing-ly
  white-space wide-spread wing-spread wretch-ed wretch-ed-ly Eng-lish
  Euler-ian Feb-ru-ary Gauss-ian Hamil-ton-ian Her-mit-ian Jan-u-ary
  Japan-ese Kor-te-weg Le-gendre Mar-kov-ian Noe-ther-ian No-vem-ber
  Rie-mann-ian Sep-tem-ber}

%%% STAGE SETTINGS %%%
\g@addto@macro\status@hproof{\makeatletter\input{\ndjfmt@name.cfg}\makeatother\let\phi\varphi}
\g@addto@macro\status@proof{\makeatletter\input{\ndjfmt@name.cfg}\makeatother\let\phi\varphi}
\g@addto@macro\status@crc{\makeatletter\input{\ndjfmt@name.cfg}\makeatother\let\phi\varphi}

%%% LISTS %%%
\def\labelenumiii{(\theenumiii)}
\def\labelenumiv{(\theenumiv)}
\newdimen\reallabelsep% to save from amsthm
\reallabelsep\labelsep
\let\sv@enumerate\enumerate
\let\sv@itemize\itemize
% from jfl + labelsep save
\def\descriptionlabel#1{\hspace\labelsep \upshape\optimabf{#1:}}
\renewenvironment{description}{\list{}{\labelsep\reallabelsep%
  \advance\leftmargini6\p@ \itemindent-12\p@
  \labelwidth\z@ \let\makelabel\descriptionlabel}%
}{
  \endlist
}
\let\enddescription=\endlist % for efficiency
% todo: do we really need this?
% from jfl.cls
\AtBeginDocument{%
  \labelsep=5pt\relax
  \reallabelsep\labelsep
  \def\enumerate{\labelsep\reallabelsep\sv@enumerate}%
  \def\itemize{\labelsep\reallabelsep\sv@itemize}%
  \setcounter{enumi}{13}\setcounter{enumii}{13}%
  \setcounter{enumiii}{13}\setcounter{enumiv}{13}%
  \settowidth\leftmargini{\labelenumi\hskip\labelsep}%
  \advance\leftmargini by \normalparindent
  \settowidth\leftmarginii{\labelenumii\hskip\labelsep}%
  \settowidth\leftmarginiii{\labelenumiii\hskip\labelsep}%
  \settowidth\leftmarginiv{\labelenumiv\hskip\labelsep}%
  \setcounter{enumi}{0}\setcounter{enumii}{0}%
  \setcounter{enumiii}{0}\setcounter{enumiv}{0}%
  \leftmarginv=10pt  \leftmarginvi=\leftmarginv
  \leftmargin=\leftmargini
  \labelwidth=\leftmargini \advance\labelwidth-\labelsep
  \@listi}
\def\@listI{\leftmargin\leftmargini \parsep\z@skip
  \topsep\smallskipamount\itemsep\z@skip
  \listparindent\normalparindent}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip \parsep\z@skip \partopsep\z@skip \itemsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}

%%% PAGE STYLES %%%
\newskip\normaltopskip
\normaltopskip=10pt \relax
\let\sectionmark\@gobble
\let\subsectionmark\@gobble
\let\subsubsectionmark\@gobble
\let\paragraphmark\@gobble
\def\ps@plain{\ps@empty
  \def\@oddfoot{\centerline{\useoptfont\opt@md\opt@up\opt@viiipt\opt@viiipt\thepage}%
  \global\topskip\normaltopskip}%
  \let\@evenfoot\@oddfoot}

% APPENDIX
\def\app@section@numbersep{}

%%% PREEDIT STAGE %%%
\g@addto@macro\status@preedit{\@input{ndjflbkm.cfg}}

%%% INIT SETTINGS %%%
\flushbottom
\nonfrenchspacing
\endinput
%%
%% History:
%% 2011.09.30/v1.0.0alpha   alpha
%% 2011.10.19/v1.0.0beta1   first beta
%% 2011.10.20/v1.0.0beta2   second beta
%% 2011.11.24/v1.0.0beta3   third beta: optima by default "sf", new command \optimabf,
%%                          restored labelsep in theorems, redefined description environment
%% 2012.02.13/v1.0.0beta4   bf replaced by optimabf in description labels, added \boldmath to \optimabf definition
%% 2012.03.22/v1.0.0beta5   fixed abstract font: added normalfont
%% 2012.05.05/v1.0.0beta6   phi=varphi (Martha's request)
%% 2012.05.30/v1.0.0beta7   date element added to submission line
%% 2012.06.21/v1.0.1        Optima issue fixed
%% 2012.06.28/v1.1.0        print author in addresses, author thanksref removed
%% 2012.06.29/v1.1.1        slash symbol added to journal url link, link skip settings for VTeX
%% 2012.07.02/v1.1.2        removed auto dot after keywords
%% 2012.07.05/v1.1.3        acks environment updated
%% 2012.07.13/v1.2.0        BaKoMa configuration file added to preedit stage hook
%% 2012.07.16/v1.2.1        one more default page size condition added
%% 2012.07.17/v1.2.2        upqed command added
%% 2012.08.07/v1.3.0        paragraph setup added for endnotes
%% 2012.09.21/v1.3.1        scriptsize redundant space fixed
