%% This is file `dupart.cls'
%%
%% LaTeX 2e class file for the processing of LaTeX2e files
%% of the following DUP journals:
%%
%%   Duke Mathematical Journal% todo: complete
%%   Kyoto Journal of Mathematics% todo: add
%%   Nagoya Mathematical Journal% todo: add
%%   Notre Dame Journal of Formal Logic% todo: stabilize
%%
%% This file is remix of 'imsart' style (by Vytas Statulevicius, VTeX, Lithuania)
%% made by Edgaras Sakuras, VTeX, Lithuania
%% for Duke University Press, U.S.A.
%% Please submit bugs or your comments to edgaras.sakuras@vtex.lt
%%
%% The original distribution is located at:
%% http://www.e-publications.org/dup/support % todo: add
%%
%% This class file loads standart "article.cls" with appropriate 
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
\def\dupfmt@name{dupart}
\def\dupfmt@version{1.6.0}
\def\dupfmt@date{2012/09/20}

\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{dupart}[\dupfmt@date\space v\dupfmt@version\space base class for DUP journals (ES)]

% set various options for different journals:
\DeclareOption{generic}{%
  \PassOptionsToClass{10pt,oneside}{article}
}

% Passoptions to hyperref: todo: set as in DMJ

\PassOptionsToPackage{pagebackref,colorlinks,citecolor=blue,urlcolor=blue,linkcolor=blue,linktocpage=true}{hyperref}

\PassOptionsToPackage{psamsfonts}{amssymb}
\PassOptionsToPackage{cmex10}{amsmath}

% General options:

% Put keywords as footnote
\newif\if@keywordsasfootnote
\DeclareOption{keywordsasfootnote}{\@keywordsasfootnotetrue}

% Put history as footnote
\newif\if@historyasfootnote
\DeclareOption{historyasfootnote}{\@historyasfootnotetrue}                  

% Put address as footnote
\newif\if@addressasfootnote
\DeclareOption{addressasfootnote}{\@addressasfootnotetrue}                  

% Put addresses at end of document
\newif\if@addressatend
\DeclareOption{addressatend}{\@addressatendtrue}                  

% Put "." after inline section headings:
\newif\if@autosecdot 
\DeclareOption{autosecdot}  {\@autosecdottrue}
\DeclareOption{noautosecdot}{\AtBeginDocument{\@autosecdotfalse}}

% Load amsmath style with corerect settings:
\newif\if@load@amsmath
\DeclareOption{amsmath}{\@load@amsmathtrue}

% Load amsthm style with corerect settings:
\newif\if@load@amsthm
\DeclareOption{amsthm}{\@load@amsthmtrue}

% Load amsmath with leqno option 
\newif\if@amsmath@leqno

% Load natbib with correct settings:
\newif\if@load@natbib
\DeclareOption{natbib}{\@load@natbibtrue}

% Spacing
\newif\if@doublespacing \@doublespacingfalse
\DeclareOption{doublespacing}{\@doublespacingtrue}
\newif\if@singlespacing \@singlespacingfalse
\DeclareOption{singlespacing}{\@singlespacingtrue}

% Do not print id line at bottom of the page:
\DeclareOption{noinfoline}{\AtBeginDocument{\let\info@line\@empty}}
\DeclareOption{infoline}  {\AtBeginDocument{\let\info@line\infoline@text}}

% Put lines numbers in margins
\newif\ifnumberlines@ \numberlines@false
\DeclareOption{linenumbers}{\numberlines@true}
\DeclareOption{nolinenumbers}{\numberlines@false}

% Combined options:
% use this option for pre-publication (preprint):
\newif\if@preprint \@preprintfalse
\DeclareOption{preprint}{\@preprinttrue}% todo: finish setup

% online version
\newif\if@www \@wwwfalse
\DeclareOption{www}{\@wwwtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*

\LoadClass{article}[2000/05/19]

\@twosidetrue% it's true for all DUP journal at the moment

\def\singlespacing{\renewcommand{\baselinestretch}{}\large\normalsize}
\def\doublespacing{\renewcommand{\baselinestretch}{1.6}\large\normalsize}

\if@singlespacing
  \singlespacing
\fi

\if@doublespacing
  \doublespacing
\fi

\if@preprint
  \singlespacing
  \AtBeginDocument{\let\info@line\@empty}
  \numberlines@false
\fi

\RequirePackage{textcase}

%%% ARTICLE STAGES %%%
\def\doc@stage{0}% 0 - am, 50 - preedit, 100 - house proof, 200 - proof, 300 - crc
\def\artstatus#1{%
  \@ifundefined{status@#1}{%
    \@latex@error{Unknown or empty article status!}\@ehd%
  }{%
    \csname status@#1\endcsname%
  }
}

\def\status@am{\gdef\doc@stage{0}}
\def\status@preedit{\gdef\doc@stage{50}}
\def\status@hproof{\setlength\overfullrule{5pt}\gdef\doc@stage{100}}
\def\status@proof{\setlength\overfullrule{5pt}\gdef\doc@stage{200}}
\def\status@crc{\setlength\overfullrule{0pt}\gdef\doc@stage{300}}
\def\status@preprint{} % todo: do we really need this stage?

% Initiate some info:
\def\journal@name@pre{}
\def\journal@name{}
\def\journal@name@post{}
\def\journal@url{}
\def\journal@issn{}
\def\journal@id{}
\def\paper@url{}
\def\info@line{}
\def\copyrightowner@text{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% set@page@layout
\RequirePackage{keyval}

\let\pg@l@pw\@empty
\let\pg@l@ph\@empty
\let\pg@l@tw\@empty
\let\pg@l@th\@empty
\let\pg@l@em\@empty
\let\pg@l@om\@empty
\let\pg@l@tm\@empty
\define@key{page@layout}{pw}{\def\pg@l@pw{#1}} % paper width
\define@key{page@layout}{ph}{\def\pg@l@ph{#1}} % paper height
\define@key{page@layout}{tw}{\def\pg@l@tw{#1}} % text width
\define@key{page@layout}{th}{\def\pg@l@th{#1}} % text height
\define@key{page@layout}{em}{\def\pg@l@em{#1}} % evenside margin
\define@key{page@layout}{om}{\def\pg@l@om{#1}} % oddside margin
\define@key{page@layout}{tm}{\def\pg@l@tm{#1}} % top margin

\def\set@page@layout[#1]#2{%
  \setkeys{page@layout}{#1}%
  #2% hook
  % paperwidth
  \ifx\pg@l@pw\@empty\else
    \setlength\paperwidth{\pg@l@pw}
  \fi
  % paperheight
  \ifx\pg@l@ph\@empty\else
    \setlength\paperheight{\pg@l@ph}
  \fi
  % textwidth
  \ifx\pg@l@tw\@empty\else
    \setlength\textwidth{\pg@l@tw}
  \fi
  % textheight
  \ifx\pg@l@th\@empty\else
    \setlength\textheight{\pg@l@th}
  \fi
  % oddsidemargin
  \ifx\pg@l@om\@empty% centered by default
    \setlength\@tempdima        {\paperwidth} 
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.5\@tempdima}
    \addtolength\oddsidemargin  {-1in}
  \else  
    \setlength\oddsidemargin\pg@l@om
  \fi
  % evensidemargin
  \ifx\pg@l@em\@empty% centered by default (todo: it'd be sufficient to define only one
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\evensidemargin    {.5\@tempdima}
    \addtolength\evensidemargin  {-1in}
  \else
    \setlength\evensidemargin{\pg@l@em}%
  \fi
  % topmargin
  \ifx\pg@l@tm\@empty% centered by default
    \setlength\topmargin{\paperheight}
    \typeout{turim \the\paperheight}
    \addtolength\topmargin{-2in}
    \addtolength\topmargin{-\headheight}
    \addtolength\topmargin{-\headsep}
    \addtolength\topmargin{-\textheight}
    \addtolength\topmargin{-\footskip}     % this might be wrong!
    \addtolength\topmargin{-.5\topmargin}
  \else
    \setlength\topmargin{\pg@l@tm}
  \fi
  \AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}} % and this too!
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Execute options

%%% \ExecuteOptions{generic,infoline} % todo: do we need any options execution
%%% \ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% dimensions

\setlength\parindent {12\p@}
\setlength\headsep   {14\p@}
\setlength\footskip  {14\p@}

\setlength\smallskipamount{6\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount  {12\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\bigskipamount  {18\p@ \@plus 3\p@ \@minus 3\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% setattribute, getattribute, do@option@list

\def\setattribute{\@ifnextchar[\@setattribute{\@setattribute[]}}
\def\@setattribute[#1]#2#3#4{\expandafter\gdef\csname #2@#3\endcsname{#4}}
\def\getattribute#1#2{\csname #1@#2\endcsname}
\def\sep@key@value#1=#2/?/#3{\setattribute{#3}{#1}{#2}}
\def\do@option@list#1#2{%
  \@for\curr@option:={#2}\do{%
    \expandafter\sep@key@value\curr@option/?/{#1}\relax
  }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% newpseudoenvironment
% same as \newenvironment, but new environment do not have additional groups \bgroup \egroup
% (i.e. all definitions are not local

\let\org@begin\begin
\let\org@end\end
\def\begin#1{%
  \@ifundefined{pseudo@#1}%
    {\org@begin{#1}}{\csname pseudo@#1\endcsname[0]\relax}%
  }
\def\end#1{%
  \@ifundefined{pseudo@#1}%
    {\org@end{#1}}{\csname pseudo@#1\endcsname[1]\relax}%
  }
\def\newpseudoenvironment#1#2#3{%
  \expandafter\gdef\csname pseudo@#1\endcsname[##1]{%
     \relax\ifcase##1\relax\def\@@next@@{#2}\or\def\@@next@@{#3}\else\let\@@next@@\relax\fi\@@next@@}%
  }




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pubyear, volume, paperno
\long\def \@gobblethree #1#2#3{}
\let\mdforvkt\@gobblethree% metadata info for VTEX tools, simply ignore in article
\let\cmd@for@aut@elem\@gobblethree% runauthor formation for VTEX tools, simply ignore in article

\def\@pubyear{}
\def\@copyrightyear{}
\def\@copyrightyear@pre{ }
\def\@copyrightyear@post{ }
\def\copyear#1{\gdef\@copyrightyear{#1}}
\def\pubyear#1{\gdef\@pubyear{#1}\ifx\@copyrightyear\@empty\gdef\@copyrightyear{#1}\fi}

\def\volumetitle#1{\gdef\volume@title{#1}}

\def\@volume@pre{Vol. }
\def\@volume@post{ }
\def\@volume{??}
\def\volume#1{\mdforvkt{main-article-info}{volume}{#1}\gdef\@volume{#1}}

\def\@issue{??}
\def\@issue@pre{No. }
\def\@issue@post{ }
\def\issue#1{\mdforvkt{main-article-info}{issue}{#1}\gdef\@issue{#1}}

\def\@paperno{??} 
\def\@paperno@pre{Paper no. }
\def\@paperno@post{ }
\def\paperno#1{\gdef\@paperno{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% firstpage, lastpage, pagerange

\newcounter{firstpage}
\newcounter{lastpage}

\def\firstpage#1{\def\@tempa{#1}\ifx\@tempa\@empty\else
  \global\c@firstpage=#1
  \global\c@lastpage=#1
  \global\c@page=#1 \ignorespaces\fi}

\def\lastpage#1{\def\@tempa{#1}\ifx\@tempa\@empty\else
  \global\c@lastpage=#1
  \ignorespaces\fi}

\def\pagerange@sep{--}

\def\set@pagerange{%
  \ifnum\c@firstpage=0%
  \else%
     \ifnum\c@firstpage=\c@lastpage%
        \gdef\@pagerange{\thefirstpage}%
     \else%
        \gdef\@pagerange{\thefirstpage\pagerange@sep\thelastpage}%
     \fi%
   \fi}

\def\@pagerange@pre{}
\def\@pagerange@post{}
\def\@pagerange{}

\def\pagenumbering#1{%
    \gdef\thefirstpage{\csname @#1\endcsname\c@firstpage}%
    \gdef\thelastpage{\csname @#1\endcsname\c@lastpage}%
    \gdef\thepage{\csname @#1\endcsname\c@page}%
}

% hyperref redefines \pagenumbering, so we must override hyperref definition:
\let\dup@pagenumbering\pagenumbering


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% startlocaldefs, endlocaldefs

\def\startlocaldefs{\makeatletter}
\def\endlocaldefs{\makeatother}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% thanksref, thanksmark, thankslabel, thankstext
% to be safe with hyperref we will use original LaTeX definitions:
%

\def\saferef#1{\expandafter\safe@setref\csname r@#1\endcsname\@firstoftwo{#1}}
\let\safe@setref\@setref

\def\safelabel#1{\@bsphack
  \protected@write\@auxout{}%
         {\string\thanksnewlabel{#1}{{\@currentlabel}{\thepage}}}%
  \@esphack}

\long\def\safe@footnotetext#1{\insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \color@begingroup
      \def\@thefnmark{}%
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces #1\@finalstrut\strutbox}%
    \color@endgroup}}%


\long\def\orig@footnotetext#1{\insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}%



\let\thanksnewlabel\newlabel

% we want to use various counters:
\def\usethankscounter#1{%
  \@ifundefined{current@thankscounter}{\gdef\previous@thankscounter{#1}}{\xdef\previous@thankscounter{\current@thankscounter}}%
  \def\current@thankscounter{#1}}

\def\restorethankscounter{\xdef\current@thankscounter{\previous@thankscounter}}

\newcounter{thanks}
\def\thethanks{\@fnsymbol\c@thanks}
\usethankscounter{thanks}

% address ref:
\newcounter{addressref}
\def\theaddressref{\arabic{addressref}}


%\def\thanksmark@fmt#1{\hbox{$^{#1}$}}
\def\thanksmark@fmt#1{\@textsuperscript{\normalfont#1}}
\def\thanksref@sep{,}

% hooks for the hyperref:
\def\thankref@hyperlink#1{\saferef{#1thanks}}
\def\thanks@hypertarget#1{}

% Isvedame zymes
\def\thanksref{\@ifnextchar[{\@tempswatrue\@thanksref}{\@tempswafalse\@thanksref[]}}

\def\@thanksref[#1]#2{%
  \if@tempswa% []
    \thanksmark@fmt{#1}%
  \else%
    \let\@tempa\@empty%
    \thanksmark@fmt{\@for\@tempb:=#2\do{%
       \@tempa\let\@tempa\thanksref@sep%
       \edef\@tempb{\expandafter\@firstofone\@tempb\@empty}%
       \thankref@hyperlink{\@tempb}}}%
   \fi}

% Suformuojame ir isvedame zyme
\def\thanksmark{\@ifnextchar[{\@tempswatrue\@thanksmark}{\@tempswafalse\@thanksmark[]}}

\def\@thanksmark[#1]#2{%  
   \@thankslabel[#1]{#2}%
   \safelabel{#2thanks}%
   \thanksmark@fmt{\expandafter\saferef{#2thanks}\thanks@hypertarget{#2}}}

% Suformuojame tik zyme
\def\thankslabel{\@ifnextchar[{\@tempswatrue\@thankslabel}{\@tempswafalse\@thankslabel[]}}

\def\@thankslabel[#1]#2{%
  \if@tempswa% []
     \protected@edef\@currentlabel{#1}%
   \else% 
      \refstepcounter{\current@thankscounter}%
   \fi%
   \safelabel{#2thanks}}%

% Suformuojame zyme ir idedame teksta i \@thanks:
\def\thankstext{\@ifnextchar[{\@tempswatrue\@thankstext}{\@tempswafalse\@thankstext[]}}

\def\@thankstext[#1]#2#3{%
  \@thankslabel[#1]{#2}%
  \protected@xdef\@thanks{\@thanks\protect\thanks@thefnmark{#2thanks}%
  \protect\orig@footnotetext{\thanks@hypertarget{#2}#3}}}%

\def\thanks@thefnmark#1{\begingroup\unrestored@protected@xdef\@thefnmark{\saferef{#1}}\endgroup}%



% ST makrosas savo numeracijos sistemos sukurimui
\def\setvaluelist#1#2{\@tempcnta=0\relax
  \@for\@curr@val:=#2\do{%
     \advance\@tempcnta by1\relax
     \expandafter\protected@xdef\csname #1@item@\the\@tempcnta\endcsname{\@curr@val}%
     }%
     \expandafter\protected@xdef\csname #1@item@0\endcsname{\the\@tempcnta}%
}
\xdef\getitemvalue#1#2{\noexpand\csname #1@item@#2\endcsname}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \ead, \printead

\def\email@text{e-mail: }
\def\url@text{url: }
\def\fullurl@text{url: }
\def\ead@sep{;~}
\let\ead@size\relax
\def\printead@fmt#1{#1}

% for BJ journal:
\newcounter{emailref}
\setvaluelist{emailmarks}{*,**,\textdagger,\textdaggerdbl}
\def\theemailref{\getitemvalue{emailmarks}{\the\c@emailref}}
\define@key{ead}{mark}[true]{\usethankscounter{emailref}\thankslabel{\ead@label}}


% naudojame keyval paketa
\define@key{ead}{email}[true]{\def\ead@type{email}}
\define@key{ead}{url}[true]{\def\@tempa{fullurl}\ifx\ead@type\@tempa\else\def\ead@type{url}\fi}
\define@key{ead}{label}{\def\ead@label{#1}}

\define@key{ead}{text}{%
  \bgroup%
    \def\\{\string\break}
    \def\break{\string\break}%
    \protected@edef\@currentlabel{#1}%
    \safelabel{\ead@label @\ead@type text}%
  \egroup}

\define@key{ead}{nopdflink}[true]{%
   \protected@edef\@currentlabel{nolink}%
   \safelabel{\ead@label @nopdflink}}


\DeclareRobustCommand\ead[2][label= ,email]{{%
  \def\ead@type{email}% default
  \checkead@prefix#2://\end%
  \def\texttildelow{\noexpand\texttildelow}%
  \setkeys{ead}{#1}%
  \protected@edef\@currentlabel{#2}%
  \safelabel{\ead@label @\ead@type}}}

\def\checkead@prefix#1://#2\end{\ifx.#2.\else\def\ead@type{fullurl}\fi}

\newif\ifnot@ead@star
\newif\if@printead@opt

\DeclareRobustCommand{\printead}{\@ifstar{\not@ead@starfalse\@printead}{\not@ead@startrue\@printead}}

\def\@printead{\@ifnextchar[{\@printead@opttrue\@@printead}{\@printead@optfalse\@@printead[]}}

\def\@@printead[#1]#2{{%
   \if@printead@opt%[]
      \def\dup@href@text{#1}%
      \not@ead@starfalse%
   \fi%      
   \let\prev@ead@text\relax%
   \let\@ead@sep\relax%
   \let\ead@text\relax%
   \let\ead@prefix\relax%
   \def\ead@type{}%
   \@tempcnta=0%
   \let\sv@dup@href\dup@href%
   \printead@fmt{\@for\ead@ref:=#2\do{%
       \advance\@tempcnta by1%
       \let\ead@href@prefix\relax%
       \let\ead@href@postfix\relax%
       \let\dup@href\sv@dup@href%
       \@ead@sep\let\@ead@sep\ead@sep%
       \@ifundefined{r@\ead@ref @nopdflink}{}{\def\dup@href##1##2{##2}}%
       \@ifundefined{r@\ead@ref @email}{}{\let\ead@text\email@text\def\ead@type{email}\def\ead@prefix{mailto:}%
         \def\ead@href@prefix{\csname startchkuriskip\endcsname}\def\ead@href@postfix{\csname endchkuriskip\endcsname}}%
       \@ifundefined{r@\ead@ref @url}{}{\let\ead@text\url@text\def\ead@type{url}\def\ead@prefix{http://}}%
       \@ifundefined{r@\ead@ref @fullurl}{}{\let\ead@text\fullurl@text\def\ead@type{fullurl}\def\ead@prefix{}}%
       \ifx\prev@ead@text\ead@text\let\ead@text\relax\fi%
       \if@printead@opt\ifnum\@tempcnta>1\@latex@error{Command \@backslashchar printead[]{e1} could have only one parameter "e1"!}\@eha\fi%
       \else\@ifundefined{r@\ead@ref @\ead@type text}{\def\dup@href@text{\@ifundefined{r@\ead@ref thanks}{}{\thanksref{\ead@ref}}\saferef{\ead@ref @\ead@type}}}{\def\dup@href@text{\@ifundefined{r@\ead@ref thanks}{}{\thanksref{\ead@ref}}\saferef{\ead@ref @\ead@type text}}}\fi%
       \ifnot@ead@star\ead@text\fi{\ead@size\def\null{}\ead@href@prefix\dup@href{\ead@prefix\saferef{\ead@ref @\ead@type}}{\dup@href@text}\ead@href@postfix}%
       \@ifundefined{ead@text}{}{\let\prev@ead@text\ead@text}}}% 
}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \copyrightowner, \corref

\def\copyrightowner#1{\def\copyrightowner@text{#1}}


% for corresponding author
\def\corref#1{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% normaltext, nohyphen, today

% normalus tekstas (justify)
\def\normaltext{\let\\=\@normalcr%
  \leftskip\z@ \@rightskip\z@ \rightskip\@rightskip%
  \parfillskip\@flushglue}

% skiemenavimo isjungimas
\def\nohyphen{\pretolerance=\@M \tolerance=\@M \hyphenpenalty=\@M \exhyphenpenalty=\@M}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \@ifemptyhbox

\def\@ifnonempty#1{%
  \setbox\@tempboxa\hbox{\ignorespaces #1}%
  \ifdim\wd\@tempboxa>1pt #1\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\pagestyle{dupheadings} \thispagestyle{copyright}


\if@twoside

\def\ps@dupheadings{%
      \let\@oddfoot\@empty%
      \let\@evenfoot\@oddfoot%
      \def\@evenhead{\rlap{\info@line}\runninghead@size\rlap{\pagenumber@size\thepage}\evenhead@fmt{\leftmark}}%
      \def\@oddhead{\rlap{\info@line}\runninghead@size\oddhead@fmt{\rightmark}\llap{\pagenumber@size\thepage}}}
\else
\def\ps@dupheadings{%
      \let\@oddfoot\@empty%
      \let\@evenfoot\@oddfoot%
      \def\@evenhead{\rlap{\info@line}\runninghead@size\hfill\leftmark/\rightmark\hfill\llap{\pagenumber@size\thepage}}%
      \let\@oddhead\@evenhead}
\fi

\def\ps@copyright{\let\@mkboth\@gobbletwo%
\def\@evenhead{\rlap{\info@line}\parbox[t]{\textwidth}{\copyright@size\copyright@text}}%
  \let\@oddhead\@evenhead%
  \def\@oddfoot{\hfill\pagenumber@size\thepage\hfill}%
  \let\@evenfoot\@oddfoot}

\def\evenhead@fmt#1{\hfill#1\hfill}
\def\oddhead@fmt#1{\hfill#1\hfill}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% url@fmt


\def\journalurl#1{\def\journal@url{#1}}
\def\paperurl#1{\def\paper@url{#1}}

% DOI

\def\doi#1{%
  \gdef\@doi{#1}%
  \gdef\doi@text{\url@fmt{DOI: }{\ttfamily}{#1}{\doi@base\@doi}}%
}

\let\@doi\relax

\def\doi@base{http://dx.doi.org/}

% arXiv


\def\arxiv#1{%
  \gdef\@arxiv{#1}%
  \gdef\doi@text{\url@fmt{arXiv: }{\ttfamily}{#1}{\arxiv@base\@arxiv}}%
}

\let\@arxiv\relax

% http://arxiv.org/abs/math.PR/0603300

\def\arxiv@base{http://arxiv.org/abs/}


% {url}{text}
\def\dup@href#1#2{#2}

% {prefix}{font}{text}{url}

\def\url@fmt#1#2#3#4{%
   \edef\@tempa{#3}%
   \ifx\@tempa\@empty%
   \else%
     #1{#2\dup@href{#4}{#3}}%
   \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LIST ENVIRONMENTS

\parsep\z@
\topsep\smallskipamount
\partopsep\z@
\itemsep\z@
\labelsep.5em

\def\@listI{\leftmargin\leftmargini
            \parsep\z@
            \topsep\smallskipamount
            \itemsep\z@}

\def\list@parindent{1pc}

% quotation
\let\quotation@size\footnotesize
\def\quotation@itemindent{\list@parindent}
\def\quotation@parindent{\list@parindent}
\def\quotation@leftmargin{\list@parindent}
\let\quotation@rightmargin\z@
\let\quotation@topsep\smallskipamount

\def\quotation{%
        \list{}{\quotation@size%
        \listparindent\quotation@parindent%
        \itemindent   \quotation@itemindent%
        \rightmargin\quotation@rightmargin   \leftmargin\quotation@leftmargin%
        \partopsep\z@ \topsep\quotation@topsep \parsep\z@%
                        }%
        \item[\Q@strut]\relax}

\def\endquotation{\endlist}

\def\Q@strut{\leavevmode\hbox{\vrule height9pt depth1pt width0pt}}

% quote
\let\quote@size\footnotesize
\def\quote@indent{\z@}
\def\quote@leftmargin{2pc}
\def\quote@rightmargin{2pc}
\let\quote@topsep\smallskipamount

\def\quote{%
        \list{}{\quote@size%
        \listparindent\quote@indent%
        \itemindent \listparindent%
        \rightmargin\quote@rightmargin   \leftmargin\quote@leftmargin%
        \partopsep\z@ \topsep\quote@topsep \parsep\z@%
                       }%
        \item\relax}

\def\endquote{\endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% table, figure

\def\fnum@table{\tablename~\thetable}
\setlength\belowcaptionskip{4\p@}

\renewenvironment{table}
               {\let\@makecaption\@maketablecaption\@float{table}}
               {\end@float}
\renewenvironment{table*}
               {\let\@makecaption\@maketablecaption\@dblfloat{table}}
               {\end@dblfloat}

\long\def\@maketablecaption#1#2{%
      \tablecaption@shape\tablecaption@size%
      {\tablename@size #1}\tablename@skip #2\par
      \vskip\belowcaptionskip}

\setattribute{tablecaption}{shape}{\centering}
\setattribute{tablecaption}{size} {\footnotesize\itshape}
\setattribute{tablename}   {size} {\scshape}
\setattribute{tablename}   {skip} {\endgraf}


% figure : use \@makecaption:
\renewcommand\figurename{Fig}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \footnotesize
  \sbox\@tempboxa{\itshape\textsc{#1}. #2}%
  \ifdim \wd\@tempboxa >\hsize
    \itshape\textsc{#1}. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \figurecaption@size
  \sbox\@tempboxa{{\figurename@size #1}\figurename@skip #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\figurename@size #1}\figurename@skip #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\setattribute{figurecaption}{size}{\footnotesize\itshape}
\setattribute{figurename}   {size}{\scshape}
\setattribute{figurename}   {skip}{.~}


\def\@floatboxreset{%
        \reset@font
        \@setminipage
        \singlespacing
        \footnotesize
        \centering
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FOOTNOTE

\renewcommand\@makefntext[1]{%
    \parindent12pt\@makefnmark #1}

\def\@makefnmark{\@textsuperscript{\normalfont\@thefnmark}}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SECTION commands:
% from latex.ltx:
% Two improvements:
% 1. if section command is defined as "inline" the '.' will be inserted after heading;
% 2. section* will write to toc and will appear in pdf bookmarks

% dirty trick...
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\def\ssection@level{#2}\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

% Trick for the hyperref:
\def\setaftersec@dot#1{\if@autosecdot\setbox0=\hbox{#1}\ifdim\wd0>0\p@\def\aftersec@dot{.}\else\def\aftersec@dot{}\fi\fi}
\let\aftersec@dot\relax

% section - will add hook for the dot after section heading
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \setaftersec@dot{#8}%
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8\aftersec@dot}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

% section* - will add hook for the dot after section heading and \contentsline 
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \setaftersec@dot{#5}%
    \def\@svsechd{#4{\hskip #1\relax #5\aftersec@dot}}%
  \fi
  \ifnum\ssection@level=1\phantomsection\addcontentsline{toc}{section}{#5}\fi%
  \@xsect{#3}}

% Block adding to contents for the next command only:
\def\nocontentsline{%
  \let\@@addcontentsline\addcontentsline%
  \ifx\hyper@anchor\@undefined
    \def\addcontentsline##1##2##3{\let\addcontentsline\@@addcontentsline}
  \else
    \def\addcontentsline##1##2##3##4{\let\addcontentsline\@@addcontentsline}
  \fi
}


% \phantomsection is defined in hyperref
\let\phantomsection\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FRONTMATTER SETTINGS

% FRONT MATTER FORMATTING PARAMETERS

\setattribute{frontmatter} {style} {\centering}
\setattribute{title}       {style} {\centering}
\setattribute{author}      {style} {\centering}
\setattribute{address}     {style} {\centering}
\setattribute{abstract}    {style} {\normaltext}
\setattribute{keyword}     {style} {\normaltext}
\setattribute{history}     {style} {\normaltext}

% FRONT MATTER SKIPS
\setattribute{title}       {skip} {18\p@}
\setattribute{atltitle}    {skip} {14\p@}
\setattribute{authors}     {skip} {12pt}
\setattribute{dedicated}   {skip} {12\p@}
\setattribute{address}     {skip} {6\p@ plus 1\p@ minus 1\p@}
\setattribute{affiliation} {skip} {6\p@ plus 1\p@ minus 1\p@}
\setattribute{abstract}    {skip} {10\p@}
\setattribute{abstractname}{skip} {:\enskip}
\setattribute{keyword}     {skip} {10\p@}
\setattribute{history}     {skip} {10\p@}
\setattribute{frontmatter} {cmd}  {\vskip20\p@ plus 3\p@ minus 3\p@
                                   \@afterindentfalse\@afterheading}
\setattribute{firstpage}   {cmd}  {}

% FRONT MATTER DIMENSIONS
\setattribute{abstract}   {width} {.8\textwidth}
\setattribute{abstract}  {indent} {0\p@} 
\setattribute{keyword}    {width} {.8\textwidth}
\setattribute{keyword}   {indent} {0\p@} %
\setattribute{history}    {width} {.8\textwidth}

% FRONT MATTER FONTS 
\setattribute{dochead}    {size} {\Large\bfseries}
\setattribute{title}      {size} {\LARGE\bfseries}
\setattribute{author}     {size} {\normalsize\bfseries}
\setattribute{fnms}       {size} {}
\setattribute{snm}        {size} {}
\setattribute{address}    {size} {\footnotesize\itshape\mdseries}
\setattribute{affiliation}{size} {\footnotesize\itshape\mdseries}
\setattribute{dedicated}  {size} {\normalsize\itshape}
\setattribute{ead}        {size} {\upshape\ttfamily}
\setattribute{abstract}   {size} {\footnotesize\upshape\mdseries}
\setattribute{abstractname}{size} {\bfseries}
\setattribute{keyword}    {size} {\footnotesize\upshape\mdseries}
\setattribute{keywordname}{size} {\bfseries}
\setattribute{history}    {size} {\footnotesize\mdseries}
\setattribute{copyright}  {size} {\footnotesize\raggedright}
\setattribute{runninghead}{size} {\footnotesize\itshape}
\setattribute{pagenumber} {size} {\footnotesize\upshape}
\setattribute{thebibliography}{size}{\normalsize}

% FRONT MATTER CASE
\setattribute{dochead}    {case} {}
\setattribute{title}      {case} {}
\setattribute{runninghead}{case} {}

% TEXT, etc.
\setattribute{doi}        {text} {\url@fmt{url: }{\ttfamily}{\paper@url}{\paper@url}}
\setattribute{copyright}  {text} {\url@fmt{}{\bfseries}{\journal@name}{\journal@url}\break%
                                  \@ifundefined{volume@title}{}{\textbf{\volume@title}\break}%
                                  \@ifnonempty{\@volume\@pubyear\@pagerange\break}%
                                  \@ifnonempty{\journal@issn\break}%
                                  \doi@text}%
\setattribute{infoline}   {text} {\raisebox{12pt}[\z@][\z@]{\hbox to \hsize{%
  \scriptsize\ttfamily\dupfmt@name\journal@id\ v\dupfmt@version\hfill file:\ \jobname.tex\hfill date:\ \today}}}
\setattribute{copyright} {owner} {$\copyright$~\@copyrightyear \copyrightowner@text}
\setattribute{author}   {prefix} {}
\setattribute{keyword} {postfix} {\unskip.}

\def\abstractname{Abstract}

% HISTORY
\setattribute{history}  {prefix}  {}
\setattribute{history}  {postfix} {.}
\setattribute{received} {prefix}  {Received~}
\setattribute{received} {postfix} {}
\setattribute{revised}  {prefix}  {; revised~}
\setattribute{revised}  {postfix} {}
\setattribute{accepted} {prefix}  {; accepted~}
\setattribute{accepted} {postfix} {}
\setattribute{printed}  {prefix}  {; printed~}
\setattribute{printed}  {postfix} {}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FRONTMATTER STUFF

% COUNTERS, ETC
\newcounter{author}
\newcounter{address}
\newdimen\sv@mathsurround
\def\author@num{0}

% RUNNING HEAD
\def\runtitle#1{\gdef\@runtitle{\runninghead@case{#1}}}                      \def\@runtitle{}
\def\runauthor#1{{\def\etal{et al.}\gdef\@runauthor{\runninghead@case{#1}}}} \def\@runauthor{}

\newdimen\sv@parindent
\sv@parindent\parindent

\newbox\fm@box
\newdimen\fm@size

\let\hy@frontmatter\relax
\let\hy@endfrontmatter\relax
\let\tableofcontents@fmt\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FRONTMATTER

\def\frontmatter{%
  \global\c@author\z@
  \global\c@address\z@
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
%
  \if@changetoc
     \let\old@tableofcontents\tableofcontents%
     \def\tableofcontents{\let\tableofcontents@fmt\old@tableofcontents}%
  \fi
%
  \def\pdftitle##1{\write@pdfinfo{\user@hy@title}{##1}}
  \def\pdfauthor##1{\write@pdfinfo{\user@hy@author}{##1}}
  \def\pdfsubject##1{\write@pdfinfo{\user@hy@subject}{##1}}
  \def\pdfkeywords##1{\write@pdfinfo{\user@hy@keywords}{##1}}
%
  \sv@mathsurround\mathsurround \m@th
  \parindent\z@
  \hy@frontmatter
  \global\let\maketitle\relax
  \open@fm \ignorespaces}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENDFRONTMATTER

\def\endfrontmatter{%
  \global\@topnum\z@
  \set@pagerange
  \csname form@runauthors\endcsname%
  \markboth{\@runauthor}{\@runtitle}%
  \thispagestyle{copyright}%
%
  \put@fmt@data%
%
  \close@fm
%
  \firstpage@cmd
%
  \write@pdfinfo{\hy@author}{\the\authors@list}
  \write@pdfinfo{\hy@subject}{\journal@name@pre\journal@name\journal@name@post%
                              \@copyrightyear@pre\@copyrightyear\@copyrightyear@post%
                              \@volume@pre\@volume\@volume@post%
                              \@issue@pre\@issue\@issue@post%
                              \@pagerange@pre\@pagerange\@pagerange@post}
  \write@pdfinfo{\hy@keywords}{\the\keywords@list}
  \mdforvkt{main-article-info}{pubyear}{\@pubyear}%
  \mdforvkt{main-article-info}{firstpage}{\the\c@firstpage}%
  \mdforvkt{main-article-info}{lastpage}{\the\c@lastpage}%
%
  \write\@mainaux{\string\gdef\string\author@num{\the\c@author}}
  \hy@endfrontmatter
  \global\mathsurround\sv@mathsurround
  \global\c@footnote\z@
  \global\let\@thanks\@empty  
  \let\title\relax       
  \let\author\relax
  \let\address\relax
  \let\frontmatter\relax \let\endfrontmatter\relax
  \let\@maketitle\relax  \let\@@maketitle\relax
  \aftergroup\frontmatter@cmd
  }


\def\put@fmt@data{%
  \copyright@fmt%
  \@thanks%
  \abstract@fmt%
  \keyword@fmt%
  \history@fmt
  \tableofcontents@fmt}


\newdimen\t@xtheight
\def\init@settings{
\splittopskip=\topskip \splitmaxdepth=\maxdepth
\t@xtheight\textheight \advance\t@xtheight-\splittopskip}

\def\no@harm{%
  \def\qq@group@start{}%
  \def\qq@group@end{}%
  \let\thanks=\@gobble%
  \let\thanksref=\@gobble%
  \let~\space%
  \def\ead[##1]##2{}%
  \let\\=\@empty%
  \def\protect{\noexpand\protect\noexpand}}

\def\open@fm{%
  \global\setbox\fm@box=\vbox\bgroup
  \hsize=\textwidth
  \frontmatter@style}

\def\close@fm{%
  \par \egroup
  \fm@size=\dp\fm@box \advance\fm@size by \ht\fm@box
  \@whiledim\fm@size>\t@xtheight \do{%
    \global\setbox\@tempboxa=\vsplit\fm@box to \t@xtheight
    \unvbox\@tempboxa 
    \fm@size=\dp\fm@box \advance\fm@size by \ht\fm@box}
  \if@twocolumn
    \emergencystretch=1pc \twocolumn[\unvbox\fm@box]
  \else
    \unvbox\fm@box
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DOCHEAD
\def\dochead#1{%
  \bgroup
    \dochead@size
    \leavevmode\vphantom{\strut}\dochead@case{#1}\par
  \egroup
  \setattribute{title}{skip}{8\p@}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TITLE
\def\title#1{%
  \vglue\title@skip%
% check if we are in {frontmatter}
  \def\reserved@a{frontmatter}
  \ifx\reserved@a\@currenvir \else \hy@frontmatter\fi
  \bgroup%
    \no@harm%
    \xdef\@argi{#1}%
  \egroup%
  \write@pdfinfo{\hy@title}{\@argi}%
  \mdforvkt{main-article-info}{title}{#1}%
  \bgroup%
    \title@style\title@size\title@case{#1}\par%
  \egroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ATLTITLE

\def\atltitle#1{%
  \vglue\atltitle@skip%
  \bgroup
    \title@size #1\par%
  \egroup}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AUTHOR

% AUG - author block
\def\smart@par{\ifhmode\par\fi}
\newenvironment{aug}{}{\smart@par}


\def\and{\unskip~and~\ignorespaces}

\def\author{\@ifnextchar[{\author@fmt}{\author@fmt[]}}

\def\author@fmt[#1]#2{%
  \stepcounter{author}%
  \author@fmt@init%
  \let\author@fmt@init\relax%
  \bgroup% 
     \def\degs##1{##1}\def\fnms##1{##1}\def\inits##1{##1}\def\snm##1{##1}\def\roles##1{##1}%
     \@tempcnta=\author@num\relax%
     \ifnum\c@author=\@tempcnta \def\author@sep{ and }\else \def\author@sep{, }\fi%
     \ifnum\c@author=1\addto@authors@list{#2}\else\addto@authors@list{\author@sep #2}\fi%
     \def\fnms##1{\cmd@for@aut@elem{fnm}{\the\c@author}{##1}\mdforvkt{main-article-info}{fnm-\the\c@author}{##1}{\fnms@size{##1}}}%
     \def\snm##1{\cmd@for@aut@elem{snm}{\the\c@author}{##1}\mdforvkt{main-article-info}{snm-\the\c@author}{##1}\snm@size{##1}%
     \expandafter\newtoks\csname @author@\the\c@author\endcsname%
      \expandafter\expandafter\expandafter\global\csname @author@\the\c@author\endcsname={##1}%
     }%
     \noindent#2\author@thanksref{#1}%
  \egroup}

\let\author@thanksref\thanksref

\def\author@fmt@init{%
   \vskip\authors@skip%
   \noindent\leavevmode\author@style\author@size\author@prefix }

\let\author@fmt@init@def\author@fmt@init

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DEDICATED
\def\dedicated#1{%
  \vskip\dedicated@skip
  \bgroup
    \dedicated@size #1\par
  \egroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ADDRESS
\def\address{\@ifnextchar[{\address@fmt}{\address@fmt[]}}

\def\address@fmt[#1]#2{%
  \smart@par%
  \let\author@fmt@init\author@fmt@init@def
  \vskip\address@skip%
  {\address@style\address@size\leavevmode\ifx.#1.\else\usethankscounter{addressref}\thanksmark{#1}\restorethankscounter\fi#2\par}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AFFILIATION

\def\affiliation{\@ifnextchar[{\affiliation@fmt}{\affiliation@fmt[]}}

\def\affiliation@fmt[#1]#2{%
  \smart@par%
  \let\author@fmt@init\author@fmt@init@def%
  \vskip\affiliation@skip%
  \def\affiliation@skip{\z@}%
  \bgroup
    \affiliation@size%
    \leavevmode%
    \ifx.#1.\else\usethankscounter{addressref}\thanksmark{#1}\restorethankscounter\fi%
    #2\par
  \egroup
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COPYRIGHTOWNER

\def\copyright@fmt{%
  \@ifundefined{copyrightowner@text}{}{\safe@footnotetext{\copyright@owner}}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ABSTRACT

\newbox\abstract@box

\define@key{abstract}{language}{\set@loc@hyphenation{#1}\set@loc@abstractname{#1}}

\gdef\abstract{\@ifnextchar[{\@abstract}{\@abstract[]}}

\def\@abstract[#1]{%
     \setkeys{abstract}{#1}%
     \global\setbox\abstract@box=\vbox\bgroup%
     \ifvoid\abstract@box\else%
        \unvbox\abstract@box%
        \vskip\abstract@skip%
     \fi%
     \@tempdima\textwidth%
     \advance\@tempdima by-\abstract@width%
     \divide\@tempdima by2%
     \abstract@style%
     \leftskip\@tempdima\rightskip\@tempdima%
     \abstract@size%
     \parindent\sv@parindent%
     \noindent\hskip\abstract@indent{\abstractname@size\abstractname\abstractname@skip}\ignorespaces}

\def\endabstract{\par\egroup}

\def\abstract@fmt{%
  \ifvoid\abstract@box\else
    \vskip\abstract@skip%
    \unvbox\abstract@box
  \fi}

\def\set@loc@hyphenation#1{%
  \@ifundefined{l@#1}{}{\expandafter\language\csname l@#1\endcsname}}

\def\set@loc@abstractname#1{%
   \def\abstractname@english{Abstract}
   \def\abstractname@german{Zusammenfassung}
   \def\abstractname@french{R\'esum\'e}
   \def\abstractname@spanish{Resumen.}
   \@ifundefined{abstractname@#1}%
      {\@latex@error{Nera kalbos '#1` palaikymo!}{}}%
      {\edef\abstractname{\csname abstractname@#1\endcsname}}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HISTORY: received, revised, accepted

\def\history@exist{0}

\def\received#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@received{#1}\gdef\history@exist{1}\fi}
  \def\@received{\@nil}
\def\revised#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@revised{#1}\gdef\history@exist{1}\fi}
  \def\@revised{\@nil}
\def\accepted#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@accepted{#1}\gdef\history@exist{1}\fi}
  \def\@accepted{\@nil}
\def\printed#1{\def\@tempa{#1}\ifx\@tempa\@empty\else\gdef\@printed{#1}\gdef\history@exist{1}\fi}
  \def\@printed{\@nil}

\def\empty@data{\@nil}

\def\history@fmt{%
  \ifcase\history@exist\else%
  \bgroup
    \nobreak%
    \vskip\history@skip%
    \nobreak%
    \history@style%
    \history@size%
    \@tempdima\textwidth%
    \advance\@tempdima by-\history@width%
    \divide\@tempdima by2%
    \leftskip\@tempdima
    \rightskip\@tempdima
    \leavevmode
    \history@prefix
    \ifx\@received\empty@data \else
      \received@prefix\@received \received@postfix%
    \fi
    \ifx\@revised\empty@data \else
      \revised@prefix\@revised \revised@postfix%
    \fi
    \ifx\@accepted\empty@data \else
      \accepted@prefix\@accepted \accepted@postfix%
    \fi
    \ifx\@printed\empty@data \else
      \printed@prefix\@printed \printed@postfix%
    \fi
  \history@postfix\par%
  \egroup%
  \gdef\history@exist{0}
\fi
}

\def\sday#1{#1}
\def\smonth#1{\@ifundefined{month@item@#1}%
     {\@latex@error{Nera tokio menesio, kurio numeris #1!}{??}}%
     {\getitemvalue{month}{#1}}%
  }%
\def\syear#1{#1}
\setvaluelist{month}{January,February,March,April,May,June,July,August,September,October,November,December}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% KEYWORDS

\newbox\keyword@box
\newdimen\pre@kwd@depth

\setattribute{keyword}{AMS}{AMS 2000 subject classifications:}
\setattribute{keyword}{KWD}{Keywords and phrases:}
% raktas=class
\setattribute[default]{keyword}{class}{KWD}

%  \keyword@class-> KWD
%  \keyword@KWD  -> AMS 2000... 

\gdef\keyword{\@ifnextchar[{\@keyword}{\@keyword[class=KWD]}}

\gdef\@keyword[#1]{%
  \do@option@list{keyword}{#1}%
  \def\keyword@name{\csname keyword@\keyword@class\endcsname}%
  \let\kwd@sep\relax
%
  \global\setbox\keyword@box=\vbox\bgroup%
     \ifvoid\keyword@box\else%
        \unvbox\keyword@box
        \vskip-\pre@kwd@depth\vtop to\pre@kwd@depth{}%
     \fi
     \@tempdima\textwidth%
     \advance\@tempdima by-\keyword@width%
     \divide\@tempdima by2%
     \keyword@style%
     \leftskip\@tempdima\rightskip\@tempdima%
     \keyword@size%
     \parindent\sv@parindent%
     \noindent\hskip\keyword@indent{\keywordname@size\keyword@name}\space\hskip.1pt}

\def\endkeyword{\keyword@postfix\par\global\pre@kwd@depth\prevdepth\egroup}

\def\keyword@fmt{%
  \ifvoid\keyword@box\else
    \vskip\keyword@skip%
    \unvbox\keyword@box
  \fi}


% \kwd[; ]{foo}
  \def\sep{\unskip\string, }%
  \newif\if@first@kwd \@first@kwdtrue
  \DeclareRobustCommand*\kwd{\@ifnextchar[\@kwd{\@kwd[\kwd@sep]}}%
  \def\@kwd[#1]#2{\unskip#1{#2}%
    \if@first@kwd\global\@first@kwdfalse\addto@keywords@list{#2}\else\addto@keywords@list{, #2}\fi\let\kwd@sep\sep}%  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \maketitle
% if \frontmatter is not used, we will redefine \maketitle % todo: erase this - this should be strict rule

\def\local@maketitle{%
  \global\@topnum\z@
  \set@pagerange
  \markboth{\@runauthor}{\@runtitle}%
  \thispagestyle{copyright}%
%
  \put@fmt@data%
%
%  \print@titlepage
%
  \write@pdfinfo{\hy@author}{\the\authors@list}
  \write@pdfinfo{\hy@keywords}{\the\keywords@list}
  \hy@endfrontmatter
  \global\mathsurround\sv@mathsurround
  \global\c@footnote\z@
  \global\let\@thanks\@empty  
  \let\title\relax       
  \let\author\relax
  \let\address\relax
  \let\frontmatter\relax \let\endfrontmatter\relax
  \let\@maketitle\relax  \let\@@maketitle\relax
  \normalfont\normaltext
  \parindent\sv@parindent
  \frontmatter@cmd
  }

\AtBeginDocument{\let\maketitle\local@maketitle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROCESS LAYOUT OPTIONS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Put keywords as footnote
\if@keywordsasfootnote

  \newtoks\keyword@toks

  \newpseudoenvironment{keyword}{\gdef\keyword@exist{1}\get@keyword@toks}{}

  \def\get@keyword@toks#1\end{\keyword@toks=\expandafter{\the\keyword@toks\keyword#1\endkeyword}\@gobble}

  \def\keyword@exist{0}
  
  \gdef\keyword#1{\@ifnextchar[{\@keyword}{\@keyword[class=KWD]}}

  \gdef\@keyword[#1]{%
    \do@option@list{keyword}{#1}%
    \def\keyword@name{\csname keyword@\keyword@class\endcsname}%
    \let\kwd@sep\relax%
    \keyword@style%
    \keyword@size%
    \parindent\sv@parindent%
    \pre@kwd%
    \hbox{\keywordname@size\keyword@name}\space\hskip.1pt}%

  \gdef\endkeyword{\keyword@postfix\gdef\pre@kwd{\par\leavevmode}}

  \let\pre@kwd\relax

  \def\keyword@fmt{\ifcase\keyword@exist\else\safe@footnotetext{\the\keyword@toks}\fi}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Put history as footnote
\if@historyasfootnote

  \def\history@fmt{%
    \ifcase\history@exist\else%
    \safe@footnotetext{%
        \nobreak%
        \history@style%
        \history@size%
        \leavevmode
        \history@prefix
        \ifx\@received\empty@data \else
          \received@prefix\@received \received@postfix%
        \fi
        \ifx\@revised\empty@data \else
          \revised@prefix\@revised \revised@postfix%
        \fi
        \ifx\@accepted\empty@data \else
          \accepted@prefix\@accepted \accepted@postfix%
        \fi
        \ifx\@printed\empty@data \else
          \printed@prefix\@printed \printed@postfix%
        \fi
        \history@postfix}%\par}%
  \fi}





\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Put address as footnote
\if@addressasfootnote
  \def\address@fmt[#1]#2{%
     \ifx.#1.%
       \safe@footnotetext{#2}
     \else%
       \usethankscounter{addressref}%
       \bgroup
         \def\\{\hfill\break}
         \thankstext{#1}{#2}%
       \egroup
       \restorethankscounter%
     \fi%
                        }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Put address at end
\if@addressatend
\def\address{\@ifnextchar[{\address@fmt}{\address@fmt[default]}}
%
% \def\address@ref@A=1
% \newtoks\@address@1
% \@address@1={#2}
%
\def\address@fmt[#1]#2{%
  \stepcounter{address}%
  \expandafter\protected@xdef\csname address@ref@#1\endcsname{\the\c@address}%
  \expandafter\newtoks\csname @address@\the\c@address\endcsname
  \expandafter\expandafter\expandafter\global\csname @address@\the\c@address\endcsname={#2}}

\let\safe@phantomsection\@gobble

% print address by number: \printaddressnum{1}
\def\printaddressnum#1{%
\xdef\@tmp{#1}%
\bgroup
\@ifundefined{@address@#1}{\@latex@error{Error: there are no address with number '#1'!}{??}}{
  \address@size
  \ifnum#1=1%
    \safe@phantomsection{\addcontentsline{toc}{section}{Author's addresses}}%
  \fi%
  \begin{tabular}[t]{@{}l@{}}
  \expandafter\expandafter\expandafter\the\csname @address@\@tmp\endcsname
  \end{tabular}}
\egroup
}

\def\printauthornum#1{
\xdef\@tmp{#1}%
\bgroup
\@ifundefined{@author@#1}{\@latex@error{Error: there are no author with number '#1'!}{??}}{
  \addressauthor@size
  \expandafter\expandafter\expandafter\the\csname @author@\@tmp\endcsname
  }
\egroup
}

% print all addresses:
\def\address@par{\par\vskip3pt}

\def\printaddresses{%
\vskip\address@skip%
%\addcontentsline{toc}{section}{Author's addresses}%
\def\last@right@glue{\par}%
\ifodd\c@address   \def\last@right@glue{\hfill\hbox{}\address@par} \fi%
\ifnum\c@address=1 \def\last@right@glue{\address@par}\fi%
\@tempcnta=0%
\bgroup\parindent\z@
\@whilenum{\@tempcnta<\c@address}%
  \do{%
    \advance\@tempcnta\@ne
    \ifodd\@tempcnta \def\left@glue{} \def\right@glue{} %     nelyginis
       \else \def\left@glue{\hfill} \def\right@glue{\address@par}\fi % lyginis
    \ifnum\@tempcnta=\c@address \let\left@glue\hfill \let\right@glue\last@right@glue\fi %paskutinis narys
    \left@glue\expandafter\printaddressnum{\the\@tempcnta}\right@glue%
     }
\egroup
}

% invoke \printaddresses at end of document:
\let\old@enddocument\enddocument
\def\enddocument{\printaddresses\old@enddocument}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% smart \MR
%% code suggested by Vilmos Prokaj <prokaj@cs.elte.hu>
%% solves the problem when MR is in a format
%%  \MR{MR1037262 (91i:60148)}

%  without MR this macro removes the MR prefix if it
%  is present unchange the argument otherwise
\def\woMR#1{\w@MR#1MR#1MR\relax}%
\def\w@MR#1MR#2MR#3\relax{#2}

% this splits MR... (...)
\def\@MR#1 #2\relax#3{\csname startchkuriskip\endcsname%
 \href{http://www.ams.org/mathscinet-getitem?mr=#1}%
 {\MRfixed{#3}}\csname endchkuriskip\endcsname}%

\def\MRfixed{MR\woMR}%

\let\MR\MRfixed

% Zebtralblatt
\def\Zbl#1{\csname startchkuriskip\endcsname\href{http://www.emis.de/cgi-bin/MATH-item?#1}{Zbl~#1}\csname endchkuriskip\endcsname}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% interaction with hyperref

\def\test@hyperref{\@ifundefined{Hy@SetCatcodes}{}{\dupart@hyperref@settings}}

\AtBeginDocument{\test@hyperref}

\def\dupart@hyperref@settings{%
%
% hooks for the \thanksref, \thankstext:
  \def\thankref@hyperlink##1{%
     \edef\@tempx{##1thanks}%
     \hbox{\hyperlink{##1}{\saferef{\@tempx}}}}
  \def\thanks@hypertarget##1{\smash{\raise\baselineskip\hbox{\protect\hypertarget{##1}{}}}}
% redefine pagenumbering
  \let\pagenumbering\dup@pagenumbering
% activate href
   \let\dup@href\href%
   \let\safe@phantomsection\phantomsection
% put document info
   \def\write@pdfinfo##1##2{\protected@write\@auxout{\no@harm}{\string\gdef\string##1{##2}}}
   \@ifundefined{hy@title}{}{\pdfstringdef\@pdftitle{\hy@title}}
   \@ifundefined{hy@author}{}{\pdfstringdef\@pdfauthor{\hy@author}}
   \@ifundefined{hy@subject}{}{\pdfstringdef\@pdfsubject{\hy@subject}}
   \@ifundefined{hy@keywords}{}{\pdfstringdef\@pdfkeywords{\hy@keywords}}
%
   \@ifundefined{user@hy@title}{}{\global\let\@pdftitle\user@hy@title}
   \@ifundefined{user@hy@author}{}{\global\let\@pdfauthor\user@hy@author}
   \@ifundefined{user@hy@subject}{}{\global\let\@pdfsubject\user@hy@subject}
   \@ifundefined{user@hy@keywords}{}{\global\let\@pdfkeywords\user@hy@keywords}
%
% MathSciNet:
%   \def\MR##1{\href{http://www.ams.org/mathscinet-getitem?mr=##1}{MR##1}}
   %% MR with hyperef
   \def\MR##1{\@MR##1 \relax{##1}}%
%   \@ifundefined{Hy@SetCatcodes}{\let\MR\MRfixed}{\relax}%
% we need \texttildelow command in hyperref
\let\sv@hyper@normalise\hyper@normalise%
\def\hyper@normalise##1{\let\texttildelow\hyper@tilde\sv@hyper@normalise{##1}}%
}

\def\write@pdfinfo#1#2{}

\newtoks\authors@list
\def\addto@authors@list#1{%
  \begingroup%
    \no@harm%
    \xdef\@act{\global\noexpand\authors@list{\the\authors@list#1}}\@act%
  \endgroup}

\newtoks\keywords@list
\def\addto@keywords@list#1{%
  \begingroup%
    \no@harm%
    \xdef\@act{\global\noexpand\keywords@list{\the\keywords@list#1}}\@act%
  \endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SECTION, SUBSECTION ETC.
% we do not like article appearance:

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-\bigskipamount}%
                                   {\medskipamount}%
                                   {\raggedright\bfseries\mathversion{bold}}}

\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
                                   {-\bigskipamount}%
                                   {\medskipamount}%
                                   {\raggedright\bfseries\itshape\mathversion{bold}}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {-\bigskipamount}%
                                   {\medskipamount}%
                                   {\raggedright\itshape}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                   {\medskipamount}%
                                   {-1em}%
                                   {\bfseries}}

\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                   {\medskipamount}%
                                   {-1em}%
                                   {\itshape}}


% Format for the counter:
\def\section@numbersep{.}
\def\subsection@numbersep{.}
\def\subsubsection@numbersep{.}
\def\paragraph@numbersep{.}
\def\subparagraph@numbersep{.}

\def\@seccntformat#1{{\csname #1@prefix\endcsname\csname the#1\endcsname\csname#1@numbersep\endcsname\enspace}}


\let\specialsection\section

\@namedef{specialsection*}{\section*}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% loading of amsmath

\if@load@amsmath
  \if@amsmath@leqno
     \PassOptionsToPackage{leqno}{amsmath}
  \fi
  \RequirePackage[cmex10]{amsmath}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% loading of amsthm 

\let\thm@lowercase\lowercase
\def\set@amsthm{%
  \def\cancel@indent{\everypar{{\setbox\z@\lastbox }\everypar{}}}%
  \def\@endtheorem{\endtrivlist \@endpefalse \aftergroup\cancel@indent}%
  \let\@upn\relax
  % we want plain theorem name would be lowercase in any case
  \let\@@iden\@iden
  \thm@notefont{\upshape}%
  \newtheoremstyle{plain}     {\baselineskip}{\baselineskip}{\itshape\let\@@iden\thm@lowercase}{}{\scshape}{}{\newline}{}%
  \newtheoremstyle{definition}{\baselineskip}{\baselineskip}{\normalfont}{}{\itshape}{}{\newline}{}%
  \newtheoremstyle{remark}    {\baselineskip}{\baselineskip}{\normalfont}{}{\itshape}{}{\newline}{}%
  \gdef\@begintheorem##1##2[##3]{%
    \deferred@thm@head{\the\thm@headfont \thm@indent
      \@ifempty{##1}{\let\thmname\@gobble}{\let\thmname\@@iden}%
      \@ifempty{##2}{\let\thmnumber\@gobble}{\let\thmnumber\@iden}%
      \@ifempty{##3}{\let\thmnote\@gobble}{\let\thmnote\@iden}%
      \thm@swap\swappedhead\thmhead{##1}{##2}{##3}%
      \the\thm@headpunct
      \thmheadnl % possibly a newline.
      \hskip\thm@headsep
    }%
  \ignorespaces}%
  \renewenvironment{proof}[1][\proofname]{\par
       \pushQED{\qed}%
       \normalfont \topsep\baselineskip \partopsep 0pt\relax%
       \trivlist
  \item[\hbox to\linewidth{\hskip\labelsep
        \itshape
    ##1\hfill}]\ignorespaces
  }{%
    \popQED\endtrivlist
    \@endpefalse \aftergroup\cancel@indent
  }%
}


\if@load@amsthm
  \RequirePackage{amsthm} 
  \set@amsthm
\else
  \AtBeginDocument{\@ifpackageloaded{amsthm}{\set@amsthm}{}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% thebibliography, loading natbib

\def\set@natbib{%
  \let\bibfont\thebibliography@size
  \setlength\bibsep{0pt}}

\if@load@natbib
   \RequirePackage{natbib}
   \set@natbib
\else 
  \let\xxx@thebibliography\thebibliography
  \def\thebibliography{\thebibliography@size\xxx@thebibliography}
  \g@addto@macro\@openbib@code{\itemsep\z@}
  \AtBeginDocument{\@ifpackageloaded{natbib}{\set@natbib}{}}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% thebibliography - structured

%%%%%%%%% Common macros:

% Setting a "style" for a command:
% \set@bibl@cmd{bvolume}  == \def\bvolume#1{{\bvolume@style #1}}

\def\set@bibl@cmd#1{\expandafter\def\csname #1\endcsname##1{{\csname #1@style\endcsname##1}}}

\let\endbibitem\relax

%%%%%%%%% bauthor, beditor

\def\bbl@bauthor#1{%
  \csname bauthor@hook\endcsname%
{%
  \let\binits\@firstofone%
  \let\bsnm\@firstofone%
  \let\bfnm\@gobble%
  \let\bparticle\@firstofone%
  \let\bsuffix\@firstofone%
  \bauthor@style%
#1}}

\def\bbl@beditor#1{{%
  \let\binits\@firstofone%
  \let\bsnm\@firstofone%
  \let\bfnm\@gobble%
  \let\bparticle\@firstofone%
  \let\bsuffix\@firstofone%
  \beditor@style%
#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bid
% \bid{MR={},doi={},...}

\let\mr@arg\@empty
\let\zbl@arg\@empty
\let\custom@arg\@empty
\define@key{bid}{mr}{\def\mr@arg{#1}}
\define@key{bid}{zbl}{\def\zbl@arg{#1}}
\define@key{bid}{doi}{}
\define@key{bid}{pubmed}{}
\define@key{bid}{pii}{}
\define@key{bid}{custom}{\def\custom@arg{#1}}

\def\bbl@bid#1{%
  \bgroup%
  \csname startchkuriskip\endcsname%
  \setkeys{bid}{#1}%
  \ifx\zbl@arg\@empty\else\unskip\ \split@Zbl\zbl@arg.\fi%
  \ifx\mr@arg\@empty\else\unskip\ \split@MR\mr@arg.\fi%
  \ifx\custom@arg\@empty\else\unskip\ \custom@arg\fi%
  \csname endchkuriskip\endcsname%
  \egroup
}
\let\bid\bbl@bid

\newcounter{mrinbid}
\def\split@MR#1{%
  \edef\mr@list{#1}%
  \setcounter{mrinbid}{1}%
  \@for\@curr@mr:=\mr@list\do{%
    \ifnum\c@mrinbid>1\relax;\ \fi%
    \MR{\@curr@mr}%
    \stepcounter{mrinbid}%
  }%
}

\newcounter{zblinbid}
\def\split@Zbl#1{%
  \edef\zbl@list{#1}%
  \setcounter{zblinbid}{1}%
  \@for\@curr@zbl:=\zbl@list\do{%
    \ifnum\c@zblinbid>1\relax;\ \fi%
    \Zbl{\@curr@zbl}%
    \stepcounter{zblinbid}%
  }%
}

% for compatibility with old bibtex style
\def\bdoi#1{\ignorespaces}

%%%%%%%%% common@pub@types

\def\common@pub@types{%
  \def\AND{and }%
  \let\betal\@firstofone%
  \set@bibl@cmd{btitle}%
  \let\byear\@firstofone%  
  \let\bpages\@firstofone%
  \let\bmisc\@firstofone%
  \let\bnote\@firstofone%
  \let\banumber\@firstofone%
  \let\bmrnumber\MR%
  \let\bid\bbl@bid%
  \set@bibl@cmd{bvolume}%
  \csname common@pub@types@hook\endcsname%
}


%%%%%%%%% default stiliai

  \setattribute{bauthor}{style}{\scshape}
  \setattribute{beditor}{style}{\scshape}

  \setattribute{bjournal}  {style}{\itshape}
  \setattribute{bbooktitle}{style}{\itshape}
  \setattribute{bseries}   {style}{\itshape}

  \setattribute{bvolume}   {style}{\bfseries}

%%%%%%%%%  barticle

\def\barticle{\@ifnextchar[{\@barticle}{\@barticle[]}}

\def\@barticle[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \set@bibl@cmd{bjournal}%
}

%%%%%%%%% bbook

\def\bbook{\@ifnextchar[{\@bbook}{\@bbook[]}}

\def\@bbook[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\beditor\bbl@beditor%
  \let\bedition\@firstofone%
  \set@bibl@cmd{bseries}%
  \let\bpublisher\@firstofone%
  \let\baddress\@firstofone%
  \let\bisbn\@gobble%
%
  \let\btitle@style\itshape%
}


%%%%%%%%% bincollection

\def\bincollection{\@ifnextchar[{\@bincollection}{\@bincollection[]}}

\def\@bincollection[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\beditor\bbl@beditor%
  \set@bibl@cmd{bbooktitle}%
  \let\bchapter\@firstofone%
  \let\bedition\@firstofone%
  \set@bibl@cmd{bseries}%
  \let\bpublisher\@firstofone%
  \let\baddress\@firstofone%
  \let\bisbn\@gobble%
  \def\bauthor@hook{\let\beditor@style\relax}
}

%%%%%%%%% binproceedings

\def\binproceedings{\@ifnextchar[{\@binproceedings}{\@binproceedings[]}}

\def\@binproceedings[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\beditor\bbl@beditor%
  \set@bibl@cmd{bbooktitle}%
  \set@bibl@cmd{bseries}%
  \let\borganization\@firstofone%
  \let\bpublisher\@firstofone%
  \let\baddress\@firstofone%
  \let\bisbn\@gobble%
}

%%%%%%%%% binbook

\def\binbook{\@ifnextchar[{\@binbook}{\@binbook[]}}

\def\@binbook[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\beditor\bbl@beditor%
  \set@bibl@cmd{bbooktitle}%
  \let\bchapter\@firstofone%
  \let\bedition\@firstofone%
  \set@bibl@cmd{bseries}%
  \let\bpublisher\@firstofone%
  \let\baddress\@firstofone%
  \let\bisbn\@gobble%
%
  \let\btitle@style\itshape
}


%%%%%%%%% bproceedings

\def\bproceedings{\@ifnextchar[{\@bproceedings}{\@bproceedings[]}}

\def\@bproceedings[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\beditor\bbl@beditor%
  \let\bedition\@firstofone%
  \set@bibl@cmd{bseries}%
  \let\bpublisher\@firstofone%
  \let\borganization\@firstofone%
  \let\baddress\@firstofone%
  \let\bisbn\@gobble%
%
  \let\btitle@style\itshape
}


%%%%%%%%% btechreport

\def\btechreport{\@ifnextchar[{\@btechreport}{\@btechreport[]}}

\def\@btechreport[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\btype\@firstofone%
  \let\bnumber\@firstofone%
  \let\binstitution\@firstofone%
  \let\baddress\@firstofone%
}

%%%%%%%%% bmanual

\def\bmanual{\@ifnextchar[{\@bmanual}{\@bmanual[]}}

\def\@bmanual[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\bedition\@firstofone%
  \let\borganization\@firstofone%
  \let\baddress\@firstofone%
  \let\bisbn\@gobble%
}

%%%%%%%%% mastersthesis

\def\bmastersthesis{\@ifnextchar[{\@bmastersthesis}{\@bmastersthesis[]}}

\def\@bmastersthesis[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\bschool\@firstofone%
  \let\btype\@firstofone%
  \let\baddress\@firstofone%
}

%%%%%%%%% phdthesis

\def\bphdthesis{\@ifnextchar[{\@bphdthesis}{\@bphdthesis[]}}

\def\@bphdthesis[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\bschool\@firstofone%
  \let\btype\@firstofone%
  \let\baddress\@firstofone%
}

%%%%%%%%% bbooklet

\def\bbooklet{\@ifnextchar[{\@bbooklet}{\@bbooklet[]}}

\def\@bbooklet[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\bhowpublished\@firstofone%
  \let\baddress\@firstofone%
}

%%%%%%%%% bunpublished

\def\bunpublished{\@ifnextchar[{\@bunpublished}{\@bunpublished[]}}

\def\@bunpublished[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
}

%%%%%%%%% bmisc

\def\bmisc{\@ifnextchar[{\@bmisc}{\@bmisc[]}}

\def\@bmisc[#1]{%
  \common@pub@types%
  \let\bauthor\bbl@bauthor%
  \let\bhowpublished\@firstofone%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \bptok

\def\bptok#1{\ignorespaces}
\def\bptnote#1{\ignorespaces}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% appendix

% todo: setup as in DMJ
\def\app@section@numbersep{:}
\renewcommand\appendix{\par
  \let\old@section\section%
  \def\section{\@ifnextchar*{\@appsectionstar}{\@appsectionnostar}}%
  \def\section@prefix{\appendixname\ }%
  \let\section@numbersep\app@section@numbersep%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}%
}

\def\@appsectionstar*#1{%
  \old@section*{#1}%
  \setcounter{section}{1}%
%     \addcontentsline{toc}{section}{#1}
}

\def\@appsectionnostar#1{%
  \ifx.#1.% 
    \refstepcounter{section}%
    \def\section@numbersep{}\old@section*{\appendixname\ \@Alph\c@section}%
  \else%
    \let\section@numbersep\app@section@numbersep\old@section{#1}%
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% supplement
%
%\begin{supplement}[id=suppA]
%  \sname{Supplement A}
%  \stitle{}
%  \slink[doi]{}
%  \slink[url]{http://lib.stat.cmu.edu/aoas/???/???}
%  \sdescription{}
%\end{supplement}
% \thesuppdoi{suppA}
% \ref{suppA}
% \hyperlink{suppA}{text}

\def\supplement@name{Supplementary Material}

\def\sname#1{\def\@sname{#1}\def\@currentlabel{#1}}
\def\stitle#1{\def\@stitle{#1}}
\def\sdatatype#1{\def\@sdatatype{#1}}
\def\slink[#1]#2{\expandafter\def\csname slink@#1\endcsname{#2}}
\def\sdescription#1{\def\@sdescription{#1}}

\def\suppsection@fmt{\specialsection*{\supplement@name}}

\def\slink@doi@fmt{%
  \url@fmt{doi: }{}{\slink@doi}{\doi@base\slink@doi}%
  \@ifundefined{supp@label}{}{%
    \expandafter\xdef\csname\supp@label @doi\endcsname{\slink@doi}%
    \expandafter\xdef\csname\supp@label @url\endcsname{\doi@base\slink@doi}}%
}

\def\slink@url@fmt{%
  \url@fmt{}{}{\slink@url}{\slink@url}%
  \@ifundefined{supp@label}{}{%
     \expandafter\xdef\csname\supp@label @url\endcsname{\slink@url}}%
}

\def\thesuppdoi#1{\@ifundefined{#1@doi}%
  {\@latex@error{Undefined supplement id=#1}{??}}%
  {\def\@tempx{\csname #1@doi\endcsname}%
   \@ifundefined{#1@url}{\def\@tempy{\doi@base\csname #1@url\endcsname}}{\def\@tempy{\csname #1@url\endcsname}}%
   \url@fmt{DOI: }{}{\@tempx}{\@tempy}}%
}

\define@key{supplement}{id}{\def\supp@label{#1}}

\long\def\supplement{\@ifnextchar[{\@supplement}{\@supplement[]}}

\long\def\@supplement[#1]{%
  \suppsection@fmt%
  \global\let\suppsection@fmt\smallskip%
  \setkeys{supplement}{#1}%
}

\def\endsupplement{%
  \@ifundefined{@sname}{}{\@ifundefined{supp@label}{}{\hypertarget{\supp@label}{}\label{\supp@label}}\textbf{\@sname: }}%
  \@ifundefined{@stitle}{}{\textbf{\@stitle\ }}%
%
  \\
  (%
  \@ifundefined{slink@doi}{}{\slink@doi@fmt}%
  \@ifundefined{slink@url}{}{\slink@url@fmt}%
  \@ifundefined{@sdatatype}{}{; \@sdatatype}%
  ).
  \@ifundefined{@sdescription}{}{\@sdescription}%
  \par}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOC in "article" class is a mess:


% for hyperref
\def\toclevel@title{0}

\newcommand*\l@title[2]{}
\newcommand*\l@author[2]{}
\newcommand*\l@doi[2]{}
\newcommand*\l@arxiv[2]{}
\newcommand*\l@jobname[2]{}
\newcommand*\l@begintocitem[2]{}
\newcommand*\l@endtocitem[2]{}

\newif\if@changetoc  \@changetocfalse
\@ifclassloaded{article}{\@changetoctrue}{}

\if@changetoc

  \@ifundefined{contentsname@cmd}{\def\contentsname@cmd{\section*{\contentsname}}}{}

  \renewcommand\tableofcontents{%
      \nocontentsline
      \contentsname@cmd%
      \@starttoc{toc}%
      }

  \renewcommand*\l@section{\@dottedtocline{1}{\z@}{1.5em}}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% number lines



  \long\def\l@addto@macro#1#2{%
       \toks@\expandafter{#1#2}%
       \edef#1{\the\toks@}}

   \setattribute{numberlines}{size}{\scriptsize\ttfamily}
   \setattribute{numberlines}{skip}{24\p@}

   \def\numberlines@hook{%
       \l@addto@macro\@evenhead\put@numberlines@box%
       \l@addto@macro\@oddhead\put@numberlines@box}

   \g@addto@macro\ps@dupheadings\numberlines@hook
   \g@addto@macro\ps@copyright\numberlines@hook

   \newbox\numberlines@box
   \newskip\numberlines@box@skip

   \def\set@numberlines@box{%
     \setlength\numberlines@box@skip\headsep
     \addtolength\numberlines@box@skip{5\p@}
   %
     \setbox\numberlines@box\vtop to\textheight{%
       \parindent\z@    
       \vskip\z@   
       \@tempcnta=0
       \@tempdima=\z@
       \loop
         \advance\@tempcnta by1
         \advance\@tempdima by\baselineskip
         \hbox to\textwidth{%
            \llap{\numberlines@size\the\@tempcnta\kern\numberlines@skip}
            \hfill
            \rlap{\numberlines@size\kern\numberlines@skip\the\@tempcnta}}
       \ifdim\@tempdima<\textheight\repeat
       \vss
     }%
   %
       \ht\numberlines@box\z@
       \dp\numberlines@box\z@
   }

   \def\put@numberlines@box{\lower\numberlines@box@skip\hbox to\z@{\hss\copy\numberlines@box}}

   
\AtBeginDocument{\ifnumberlines@\set@numberlines@box\fi}

% do not add to TOC
\def\ignorecontentsline{\let\sv@contentsline\contentsline\let\contentsline\@gobblefour}
\def\restorecontentsline{\let\contentsline\sv@contentsline}

% add to bookmarks, do not add to TOC
\def\write@toc@ignorecontentsline {\addtocontents{toc}{\protect\ignorecontentsline}}
\def\write@toc@restorecontentsline{\addtocontents{toc}{\protect\restorecontentsline}} 


\pagenumbering{arabic}
\init@settings
\pagestyle{dupheadings}

\endinput
%%
%% History:
%% 2011.09.30/v1.0.0alpha   alpha
%% 2011.10.19/v1.0.0beta1   first beta
%% 2012.03.01/v1.0.0beta1.1 added 'pagebackref' option to 'hyperref'
%% 2012.06.21/v1.0.1        title issue fixed
%% 2012.06.28/v1.1.0        new command: printauthornum, VTeX setup: metadata,  bid, bptok, bptnote
%% 2012.06.29/v1.1.1        \texttildelow definition for hyperref
%%           /v1.2.0        runauthor hooks for VTeX
%%           /v1.3.0        added link skips settings for VTeX
%% 2012.07.05/v1.3.1        qq hooks added to no@harm
%% 2012.07.13/v1.3.2        ignore in TOC hooks
%% 2012.08.08/v1.4.0        multi MR numbers added, appendix sections updated
%% 2012.08.24/v1.5.0        multi Zbl numbers added, new key 'custom' added to bid
%% 2012.09.20/v1.6.0        infoline placement changed
