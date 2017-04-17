\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

\LoadClass[10pt]{article}
\RequirePackage[francais]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ifthen}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{longtable}

%% Mise en page par défaut
\setlength{\textwidth}{160mm}    %% Largeur de la zone texte
\setlength{\oddsidemargin}{0mm}	 %% Texte centré sur la page
\setlength{\LTpre}{0pt}          %% Suppression espace avant longtable
\setlength{\LTpost}{0pt}         %% Suppression espace après longtable

%% Paramètres réglables
\newcommand{\espaceInterRubrique}{\medskip\vspace{\stretch{0.1}}}
\newcommand{\lieu}[1]{\textbf{#1}\ }
\newcommand{\activite}[1]{\textbf{#1}\ }
\newcommand{\comment}[1]{\textsl{#1}\ }
\newcommand{\lien}[1]{\underline{\textcolor{blue}{#1}}}

% L'utilisateur peut les redéfinir ceux-ci «\setlength» si besoin :

\newlength{\rubriquetableauparindent} % indentation au début d'une
% ligne de droite dans un «rubriquetableau». Cette longueur peut
% être négative, auquel cas l'alignement dans le tableau se fait
% compte tenu du retrait de la première ligne : celle-ci ne «bavera»
% pas sur l'espace réservé pour la colonne de gauche, au lieu de cela,
% l'ensemble de la colonne de droite est décalé de l'espace correspondant.

\setlength{\rubriquetableauparindent}{0pt}

%% Macros pratiques

%% L'environnement "rubrique"

% Usage : \begin{rubrique}[Indentation]{Titre} [...] \end{rubrique}
% On met le texte qu'on veut à l'intérieur.

\newenvironment{rubrique}[1]   % "rubrique" prend un seul argument, le titre
{\espaceInterRubrique\relax%
\noindent\textbf{\large #1}\par%
\noindent\rule[0.5ex]{\textwidth}{0.1mm}\par}{}

%% L'environnement "rubriquetableau" %

\makeatletter

\newlength{\@cvlenB}\newlength{\@cvlenC}

\newenvironment{rubriquetableau}[2][\linewidth]%% "rubriquetableau" 
%						% prend deux arguments
{\bgroup\rubrique{#2}%     % le second argument : titre
\setlength{\@cvlenB}{#1}%  % Le premier argument :indentation
\setlength{\@cvlenC}{\linewidth}%	       % Calculs...
\ifthenelse{\lengthtest{\rubriquetableauparindent<0pt}}%
   {\addtolength{\@cvlenC}{\rubriquetableauparindent}}%
   {}%
\addtolength{\@cvlenC}{-\@cvlenB}%
\addtolength{\@cvlenC}{-39pt}%
\begin{longtable}[t]{p{\@cvlenB}!{%
   \ifthenelse{\lengthtest{\rubriquetableauparindent<0pt}}%
	      {\hspace*{-\rubriquetableauparindent}}%
	      {}%
    }>{}p{\@cvlenC}}}%
{\end{longtable}\egroup}%

\makeatother

%% Le chapeau du CV

\newenvironment{adresse}{%
\begin{minipage}{7cm}
\begin{center}
}
{\end{center}\end{minipage}\hfill}

\newenvironment{etatcivil}{%
\begin{minipage}{5cm}
\begin{center}
}
{\end{center}\end{minipage}}

\newenvironment{chapeau}{%
\def\ligne{\rule[2pt]{24pt}{1pt}}%
\noindent\begin{minipage}{\linewidth}\hspace{-2cm}%
}
{\end{minipage}\vspace{\stretch{0.25}}}
