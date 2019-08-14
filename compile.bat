chcp 65001 
del	*.aux	*.bak	*.log	*.bbl	*.blg	*.thm	*.toc	*.out	*.lof	*.lol	*.lot	*.fdb_latexmk	*.synctex.gz	*.ent	/s

ptex2pdf -l -u -ot "-kanji=utf8 "  -od "-p B5 " main-vertical-punctuation

del	*.aux	*.bak	*.log	*.bbl	*.blg	*.thm	*.toc	*.out	*.lof	*.lol	*.lot	*.fdb_latexmk	*.synctex.gz	*.ent	/s
