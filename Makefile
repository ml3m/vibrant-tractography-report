export PATH := /Library/TeX/texbin:$(PATH)

MAIN = main
PDF = $(MAIN).pdf

.PHONY: all clean

all: $(PDF)

$(PDF): $(MAIN).tex references.bib
	pdflatex -interaction=nonstopmode $(MAIN).tex
	bibtex $(MAIN)
	pdflatex -interaction=nonstopmode $(MAIN).tex
	pdflatex -interaction=nonstopmode $(MAIN).tex

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.toc *.synctex.gz
