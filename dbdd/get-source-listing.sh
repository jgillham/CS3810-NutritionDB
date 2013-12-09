#!/bin/bash
find prj.link/ -iname "*.java" | sort | while read FILE; do
    DISPLAY=${FILE##prj.link/}
    echo "\\subsection{$DISPLAY}"
    echo "\\lstinputlisting[language=java]{$FILE}"
done
