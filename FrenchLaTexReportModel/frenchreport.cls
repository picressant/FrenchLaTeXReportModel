%% 
%% Created by Pierre DUPUIS - 2012-2013
%% Document class which modify the classical report to be closer the french student habits
%%
%% Modified by Pierre CRESSANT - 2013 - 2014
%% Document class working with hyperref.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{frenchreport}

% Class & options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\relax%
\LoadClassWithOptions{report}%

% Packages
\RequirePackage{fancyhdr}%
\RequirePackage{graphicx}%
\RequirePackage{natbib}%


% Header and footer
\rhead{}%
\chead{}%
\lhead{}%
\rfoot{}%
\cfoot{\hspace{20mm}--- $\thepage$ ---}% On affiche le numero de page au centre du pied de page.
\lfoot{}%
\renewcommand*{\headrulewidth}{0px}% Retire le trait horizontal en dessous du header.
\renewcommand*{\footrulewidth}{0px}% Retire le trait horizontal au dessus du footer.

\setlength{\headheight}{23pt}% Correction erreur package fancyhdr.
\pagestyle{fancy}% Positionne header et footer sur toutes les pages.

% Sommaire
\let\tableofcontentsOld\tableofcontents% On conserve l'ancienne commande pour eviter la recursivite.
\renewcommand*\tableofcontents[1][Sommaire] {%
	\setlength{\parskip}{0cm plus 0cm minus 0cm}% On retire l'interligne pour ne pas trop espacer les titres
	\let\chapter\chapterOld% On remet l'ancienne version de chapter pour que le sommaire s'affiche convenablement
	\renewcommand*\contentsname{\textsc{{#1}}}% On renomme le titre de la table des matiere avec l'argument (Sommaire par defaut)
	\phantomsection%
	\pdfbookmark{\contentsname}{toc}
	\tableofcontentsOld% On affiche la table des matieres.
	\newpage% On cree une nouvelle page.
	\let\chapter\chapterNew% On remet ensuite la nouvelle version de chapter.
	\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% On replace l'interligne a 1.5 pour le reste du rapport.
}%

% List of figures
\let\listoffiguresOld\listoffigures% On conserve l'ancienne commande pour eviter la recursivite.
\renewcommand*\listoffigures[1][Liste des figures] {%
	\setlength{\parskip}{0cm plus 0cm minus 0cm}% On retire l'interligne pour ne pas trop espacer les titres
	\let\chapter\chapterOld% On remet l'ancienne version de chapter pour que le sommaire s'affiche convenablement
	\phantomsection
	\addtocontents{toc}{\cftpagenumbersoff{chapter}} 
	\addcontentsline{toc}{chapter}{{#1}}
	\addtocontents{toc}{\cftpagenumberson{chapter}} 
	%\addtocontents{toc}{\protect\contentsline{chapter}{{{#1}}}{}}
	\renewcommand*\listfigurename{{#1}}% On renomme le titre de la table des matiere avec l'argument (Liste des figures par defaut)
	\listoffiguresOld% On affiche la table des matieres.
	\thispagestyle{fancy}% On donne a la page de sommaire le style avec header et footer.
	\newpage% On cree une nouvelle page.
	\let\chapter\chapterNew% On remet ensuite la nouvelle version de chapter.
	\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% On replace l'interligne a 1.5 pour le reste du rapport.
}%

% List of Tables
\let\listoftablesOld\listoftables% On conserve l'ancienne commande pour eviter la recursivite.
\renewcommand*\listoftables[1][Liste des tableaux] {%
	\setlength{\parskip}{0cm plus 0cm minus 0cm}% On retire l'interligne pour ne pas trop espacer les titres
	\let\chapter\chapterOld% On remet l'ancienne version de chapter pour que le sommaire s'affiche convenablement
	\phantomsection
	\addtocontents{toc}{\cftpagenumbersoff{chapter}} 
	\addcontentsline{toc}{chapter}{{#1}}
	\addtocontents{toc}{\cftpagenumberson{chapter}} 
	%\addtocontents{toc}{\protect\contentsline{chapter}{{{#1}}}{}}
	\renewcommand*\listoftables{{#1}}% On renomme le titre de la table des matiere avec l'argument (Liste des figures par defaut)
	\listoftablesOld% On affiche la table des matieres.
	\thispagestyle{fancy}% On donne a la page de sommaire le style avec header et footer.
	\newpage% On cree une nouvelle page.
	\let\chapter\chapterNew% On remet ensuite la nouvelle version de chapter.
	\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% On replace l'interligne a 1.5 pour le reste du rapport.
}%


% Bibliography
\let\bibliographyOld\bibliography% On conserve l'ancienne commande pour eviter la recursivite.
\renewcommand*\bibliography[1] {%
	\setlength{\parskip}{0cm plus 0cm minus 0cm}% On retire l'interligne pour ne pas trop espacer les titres
	\let\chapter\chapterOld% On remet l'ancienne version de chapter pour que le sommaire s'affiche convenablement
	%\addtocontents{toc}{\protect\contentsline{chapter}{{Bibliographie}}{}}
	\phantomsection
	\addtocontents{toc}{\cftpagenumbersoff{chapter}} 
	\addcontentsline{toc}{chapter}{{Bibliographie}}
	\addtocontents{toc}{\cftpagenumberson{chapter}} 
	\bibliographyOld{#1}% On affiche la table des matieres.
	\cfoot{}% On retire le numero de page dans le pied de page.
	\thispagestyle{fancy}% On donne a la page de sommaire le style avec header et footer.
	\newpage% On cree une nouvelle page.
	\let\chapter\chapterNew% On remet ensuite la nouvelle version de chapter.
	\pagestyle{fancy}% Positionne header et footer sur toutes les pages.
	\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% On replace l'interligne a 1.5 pour le reste du rapport.	
}%

\setcitestyle{super,open={[},close={]}}%

% Counters
\newcounter{chapterCounter}			  % Compteur pour numerotation automatique des chapitres.
\setcounter{chapterCounter}{0}			  % On démarre a 0 car on incremente au debut de chaque chapitre.
\newcounter{sectionCounter}[chapterCounter]	  % Compteur pour numerotation automatique des sections.
\newcounter{subsectionCounter}[sectionCounter]	  % Compteur pour numerotation automatique des subsections.
\newcounter{subsubsectionCounter}[subsectionCounter] % Compteur pour numerotation automatique des subsubsections.
\newcounter{subsubsubsectionCounter}[subsubsectionCounter] % Compteur pour numerotation automatique des subsubsections.
\newcounter{sectionAppendixCounter}[chapterCounter]	  % Compteur pour numerotation automatique des subsections.


% Chapter
\let\chapterOld\chapter% On conserve la premiere version de la commande chapter pour eviter la recursivite
\renewcommand*\chapter[1]{%
	\refstepcounter{chapterCounter}%
	\chapterOld*{\thechapterCounter \hspace*{5mm} {#1}} % Chiffres romains majuscules
	\addcontentsline{toc}{chapter}{\thechapterCounter \hspace*{5mm} {#1}}%
	\thispagestyle{fancy}% Positionne header et footer sur toutes les pages.
	\vspace*{-10mm}%
-}%
\let\chapterNew\chapter % On cree une commande contenant la version modifiee de chapter pour la remettre dans sommaire

% Chapter sans numerotation (intro, conclu, ...)
\newcommand*\chapterExtra[1]{%
	\let\chapter\chapterOld%
	\phantomsection
	\addcontentsline{toc}{chapter}{{#1}}	
	\chapter*{{#1}}
	\thispagestyle{fancy}%
	\vspace*{-10mm}
	\let\chapter\chapterNew%
}%

% Chapter sans numerotation de page (Remerciemments, Abstract...)
\newcommand*\chapterHors[1]{%
	\let\chapter\chapterOld%
	\phantomsection
	\addtocontents{toc}{\cftpagenumbersoff{chapter}} 
	\addcontentsline{toc}{chapter}{{#1}}
	\addtocontents{toc}{\cftpagenumberson{chapter}} 
	%\addtocontents{toc}{\protect\contentsline{chapter}{\protect\numberline{}Introduction}{}{chapter*.\thepage}}
	\chapter*{{#1}}
	\protect\thispagestyle{empty}%
	\vspace*{-10mm}
	\let\chapter\chapterNew%
}%

% Résumé et Abstract
\newcommand*\chapterResume[1]{%
	\let\chapter\chapterOld%
	\chapter*{{#1}}
	\protect\thispagestyle{empty}%
	\vspace*{-10mm}
	\let\chapter\chapterNew%
}%

% Section
\let\sectionOld\section%
\renewcommand*\section[1]{%
	\refstepcounter{sectionCounter}%
	\vspace*{-5mm}%
    	\sectionOld*{\hspace*{8mm} \thesectionCounter \hspace*{5mm} {#1}}%
	\addcontentsline{toc}{section}{\thesectionCounter \hspace*{5mm} {#1}}%
}%

%\SectionAppendix
\newcommand*\sectionAppendix[1]{
	\refstepcounter{sectionAppendixCounter}%
	\vspace*{-5mm}%
    	\sectionOld*{\hspace*{8mm} \thesectionAppendixCounter \hspace*{5mm} {#1}}%
}%

% Subection
\let\subsectionOld\subsection%
\renewcommand*\subsection[1]{%
	\refstepcounter{subsectionCounter}%
	\setcounter{subsubsectionCounter}{0}
	\setcounter{subsubsubsectionCounter}{0}
	\vspace*{0mm}%
    	\subsectionOld*{\hspace*{16mm} \thesubsectionCounter \hspace*{5mm} {#1}}%
	\addcontentsline{toc}{subsection}{\hspace*{5mm} \thesubsectionCounter \hspace*{5mm} {#1}}%
}%

% Subsubsection
\let\subsubsectionOld\subsubsection%
\renewcommand*\subsubsection[1]{%
	\refstepcounter{subsubsectionCounter}%
	\setcounter{subsubsubsectionCounter}{0}
	\vspace*{0mm}%
    	\subsubsectionOld*{\hspace*{24mm} \thesubsubsectionCounter \hspace*{5mm} {#1}}%
	\addcontentsline{toc}{subsubsection}{\hspace*{10mm} \thesubsubsectionCounter \hspace*{5mm} {#1}}%
}%

%Paragraph
\let\subsubsubsectionOld\paragraph%
\renewcommand*\paragraph[1]{%
	\refstepcounter{subsubsubsectionCounter}%
	\vspace*{0mm}%
    	\subsubsubsectionOld*{\hspace*{32mm} \thesubsubsubsectionCounter \hspace*{5mm} {#1} \newline}%
	\addcontentsline{toc}{section}{\hspace*{15mm} \thesubsubsubsectionCounter \hspace*{5mm} {#1}}%
	\vspace{0.5mm}
}%



% FIGURE
\newcommand*\fig[3]{% Fonction qui affiche une image de maniere centree et accompagnee de sa legende
      \begin{figure}[h!]%
      \begin{center}%
      	\includegraphics[scale={#2}]{{#1}}%
	\caption{{#3}}%
	\label{{#3}}%
      \end{center}%
      \end{figure}%
}%

\newcommand*\figRotate[4]{% Fonction qui affiche une figure selon un certain angle de rotation (utile pour les figures au format paysage)
      \begin{figure}[h!]%
      \begin{center}%
      	\includegraphics[scale={#2}, angle={#4}]{{#1}}%
	\caption{{#3}}%
	\label{{#3}}%
      \end{center}%
      \end{figure}%
}%

\setlength{\parindent}{1cm}% Alinea pre-paragraphe
\setlength{\parskip}{0.5cm plus 0.5cm minus 0cm}% Espace post-paragraphe
\renewcommand{\baselinestretch}{1.5}% Interligne

% PAGE DE GARDE
\newcommand*\subtitle[1]{%
	\newcommand*\@subtitle{{#1}}% Si subtitle est invoque, on cree une variable du meme nom
}%
\newcommand*\formation[1]{%
	\newcommand*\@formation{{#1}}% Si formation est invoque, on cree une variable du meme nom
}%
\newcommand*\mention[1]{%
	\newcommand*\@mention{{#1}}% Si mention est invoque, on cree une variable du meme nom
}%
\newcommand*\emphasis[1]{%
	\newcommand*\@emphasis{{#1}}% Si emphasis est invoque, on cree une variable du meme nom
}%
\newcommand*\societe[1]{%
	\newcommand*\@societe{{#1}}% Si societe est invoque, on cree une variable du meme nom
}%
\newcommand*\address[1]{%
	\newcommand*\@address{{#1}}% Si address est invoque, on cree une variable du meme nom
}%
\newcommand*\supervisor[1]{%
	\newcommand*\@supervisor{{#1}}% Si supervisor est invoque, on cree une variable du meme nom
}%
\newcommand*\dates[1]{%
	\newcommand*\@dates{{#1}}% Si dates est invoque, on cree une variable du meme nom
}%
\newcommand*\llogo[2]{%
	\newcommand*\@llogo{% Logo a gauche (l)
		\includegraphics[scale={#2}]{{#1}}% Si llogo est invoque, on cree un variable du meme nom qui affiche la figure
	}%
}%
\newcommand*\clogo[2]{%
	\newcommand*\@clogo{% Logo au centre (c)
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\newcommand*\rlogo[2]{%
	\newcommand*\@rlogo{% Logo a droite (r)
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\newcommand*\fllogo[2]{%
	\newcommand*\@fllogo{% Logo en bas a gauche (fl)
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\newcommand*\frlogo[2]{%
	\newcommand*\@frlogo{% Logo en bas a droite (fr)
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\newcommand*\banner[2]{%
	\newcommand*\@banner{% Image pour illustrer la page de garde
		\includegraphics[scale={#2}]{{#1}}%
	}%
}%
\newcommand*\maketitleCommun{%
	\ifx\@clogo\@undefined% S'il n'y a pas de logo central (car generalement on en met que deux)
		\noindent \@llogo \hspace*{\stretch{1}} \@rlogo% on affiche que les logos de gauche et droite
	\else% sinon
		\noindent \@llogo \hspace*{\stretch{1}} \@clogo \hspace*{\stretch{1}} \@rlogo% on affiche les trois logos
	\fi%
	\vfill% longueur elastique de coefficient 1 permettant de separer la page verticalement grace aux vfill suivant
	\begin{center}%	
		\begin{LARGE}%
			\@title \\% Affiche le titre
			\vspace*{-5mm} \hrulefill \\% cree une ligne horizontale entre le titre et le sous-titre
			\@subtitle% Affiche le sous-titre
		\end{LARGE}%
		\vfill%
		\ifx\@banner\@undefined% si la figure de page de garde n'existe pas
		\else% on ne fait rien, sinon
			\@banner% on l'affiche
		\fi%
		\vfill%
		\begin{large}%
			\@date \\% affiche la date de compilation
			\textsc{\@author} \\% affiche l'auteur en lettre capitale
		\end{large}%
	\end{center}%
}
\newcommand*\maketitleGphy{%
	\noindent \@llogo \hspace*{\stretch{1}} \@rlogo% on affiche un logo a gauche et a droite
	\vfill% longueur elastique de coefficient 1 permettant de separer la page verticalement grace aux vfill suivant
	\begin{center}%	
		\@formation \\% On affiche l'intitule de la formation
		\@mention \\% On affiche la mention relative a cette formation
		\vspace*{5mm} \@emphasis \\% On affiche la specialite choisie dans cette formation
		\begin{large}%
			\vspace*{5mm} \@title \\% Affiche le titre
		\end{large}%
		\begin{LARGE}%
			\hrulefill \\% On cree une ligne horizontale au dessus du sous-titre
			\@subtitle \\% Affiche le sous-titre, ici le sujet de stage
			\hrulefill% On cree une ligne horizontale en dessous du sous-titre
		\end{LARGE}%
		\vfill%
		\ifx\@banner\@undefined% Si la banniere n'existe pas
		\else% On ne fait rien, sinon
			\@banner% On l'affiche
		\fi%
	\end{center}%
	\noindent \@societe \\% On affiche le nom de la societe
	\@address \\% On affiche l'adresse de la societe
	\ifx\@dates\@undefined% si les dates de stage ne sont pas renseignees
		\@date \\% affiche la date de compilation
	\else% on ne fait rien, sinon
		\@dates \\% on les affiche
	\fi%
	\@supervisor \\% On affiche le nom du superviseur
	\@author \\% On affiche le nom de l'auteur
	\vfill%
	\noindent \@fllogo \hspace*{\stretch{1}} \@frlogo% on affiche un logo a gauche et a droite en bas de page
}
\renewcommand*\maketitle[1][commun]{% On redefinit maketitle avec comme argument par defaut "commun"
	\thispagestyle{empty}% On enleve pied de page et en-tete
	\def\communText{commun}% On stocke les valeurs possibles d'argument
	\def\gphyText{gphy}%
	\def\next{#1}% On stocke l'argument
	\ifx\communText\next% Si l'argument vaut "commun"
		\maketitleCommun% On utilise le skin commun
	\else% Sinon
		\ifx\gphyText\next% Si l'argument vaut "gphy"
			\maketitleGphy% On utilise le skin gphy
		\else% Sinon
		\fi%
	\fi%
	\newpage% On insere un saut de page
}%

%Changes counters for display
\renewcommand\thesectionCounter{\Roman{chapterCounter}.\arabic{sectionCounter}}
\renewcommand\thesubsectionCounter{\Roman{chapterCounter}.\arabic{sectionCounter}.\arabic{subsectionCounter}}
\renewcommand\thesubsubsectionCounter{\Roman{chapterCounter}.\arabic{sectionCounter}.\arabic{subsectionCounter}.\arabic{subsubsectionCounter}}
\renewcommand{\thechapterCounter}{\Roman{chapterCounter}}
\renewcommand{\thesectionAppendixCounter}{\Alph{sectionAppendixCounter}}

% Others
\RequirePackage[colorlinks=true, linkcolor=black, urlcolor=black, citecolor=black]{hyperref}% change ref color; needs to be at the end of the document
\RequirePackage[all]{hypcap}% to jump to the top of the image instead of the top of the caption; needs to be after hyperref
\RequirePackage{tocloft} 
