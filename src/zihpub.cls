%%
%% ZIH Style-File fuer ZIH Publikationen
%%
%% Autor: Guido Juckeland (guido.juckeland@tu-dresden.de)
%% Datum: Aug 14, 2012
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zihpub}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Provide Options

% Bachelor Inf-Vorlage
\newif\if@bachinf
\@bachinffalse
\DeclareOption{bachinf}{%
  \@bachinftrue
}
\ProcessOptions

% jetzt ``vergewaltigen'' wir ein paar variablen fuer eigene zwecke
\newcommand\matno[1]{\def\@matno{#1}}
\newcommand\copyrighterklaerung[1]{\def\@copyrighterklaerung{#1}}
\newcommand\bibfiles[1]{\def\@bibfiles{#1}}
\newcommand\gutachter[1]{\def\@gutachter{#1}}
\newcommand\birthday[1]{\def\@birthdate{#1}}
\newcommand\placeofbirth[1]{\def\@birthplace{#1}}
\newcommand\acknowledgments[1]{\def\@acknowledgments{#1}}

\def\@isreport{}
\def\@isplain{}
\def\@isdiploma{}
\def\@copyrighterklaerung{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set document type

\def\@isreport{1}
\def\@isdiploma{1}
\LoadClass[11pt]{report}%

% deckblatttitel, je nachdem, was fuer ein dokument erstellt werden soll

\newcommand{\titleheader}[0]{\large A thesis in fulfillment of the requirements for the degree of \\[0.5cm] {\huge Bachelor of Science}}
\newcommand{\copyrightinfo}[0]{ }
\newcommand{\matnolabel}[0]{Mat.-No.: }
\newcommand{\birthstart}[0]{Born }
\newcommand{\birthmiddle}[0]{ in }

\def\@doctype{Bachelor-Arbeit}
\def\@faculty{Informatik}

\def\@copyrightlabel{Copyright Information}
\renewcommand\copyrightinfo[0]{%
\ifx\@empty\@isreport
\section*{\@copyrightlabel}
\else
\chapter*{\@copyrightlabel}
\fi
\@copyrighterklaerung}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Institution fuer Titelseite
\newcommand{\@institution}{
\begin{center}
	%Institution an der die Arbeit geschrieben wurde
	\huge
	\textsc{Technische Universit\"{a}t Dresden}

	\bigskip
	\Large
	\textsc{Department of Computer Science\\
	Institute of Theoretical Computer Science\\
	Chair of Automata Theory\\
	Prof. Dr.-Ing. Franz Baader}
\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zeile unter dem autor zusammenstellen
\def\@subauthorMat{\matnolabel\@matno}
\def\@subauthorBirth{\birthstart\@birthdate\birthmiddle\@birthplace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Automatische Generierung des Dokumentgrundgeruests

	\let\@altdoc=\document
	\let\end@altdoc=\enddocument
	\renewenvironment{document}{%
	\begin{@altdoc}%
	\ifx\@empty\@isplain
	\else
	  \def\@publishers{$\quad$}
	  \def\@subject{$\quad$}
	\fi
	  \begin{titlepage}
		  \enlargethispage{1cm}

		  \@institution
		  \vspace{1cm}

		  \begin{center}
			  % Titel der Arbeit
			  \huge
			  \titleheader\\[1.5cm]
			  \huge
			  \@title
			  \vspace{2cm}

			  % Zweck der Arbeit
			  \Large
			  {\Large \@author }\\[0.5cm]
			  \@subauthorMat\\
			  \@subauthorBirth\\[2cm]

		  \end{center}
		  \vfill

		  \begin{flushleft}
			  \Large
			  First Reviewer: Dr.-Ing Stefan Borgwardt
			  \\
			  Second Reviewer: Prof. Dr. Markus Kr{\"o}tzsch
			  \\[1cm]
			  Dresden, \@date\\[2cm]
		  \end{flushleft}
	  \end{titlepage}


	  \chapter*{Declaration of Authorship}
	  \thispagestyle{empty}

	  I hereby declare that I wrote the bachelor thesis I submitted today to the examination board of the Faculty of Computer Science on the topic:
	  \begin{center}
		  \textit{\@title}
	  \end{center}

	  \noindent completely on my own and that I did not use any sources and tools other than those indicated.
	  All thoughts taken directly or indirectly from external sources are properly denoted as such.\\[1cm]

	  \noindent Dresden, \@date\\[3cm]
	  \@author
	}{%

	\end{@altdoc}}



