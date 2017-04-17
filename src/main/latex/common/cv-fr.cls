\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv-fr}

\LoadClass{cv}

\renewcommand{\ttdefault}{pcr}
\renewcommand{\rmdefault}{ptm}
%\renewcommand{\rmdefault}{phv}
\renewcommand{\sfdefault}{phv}
\newlength{\espaceChamps}
\setlength{\espaceChamps}{1mm}

% Input directory
\newcommand{\workdir}{french}
\newcommand{\educationdir}{\workdir/education}
\newcommand{\experiencedir}{\workdir/experience}
\newcommand{\skilldir}{\workdir/skill}

% Variable
\newlength{\firstcolumnwidth}%
\setlength{\firstcolumnwidth}{2.5cm}%
