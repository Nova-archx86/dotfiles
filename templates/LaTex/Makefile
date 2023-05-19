cc=pdflatex
cmd=mupdf

viewdoc: document.pdf
	$(cmd) document.pdf

%.pdf:%.tex
	$(cc) $<

clean:
	rm -rf *.aux *.log *.pdf
