# 
# Makefile
#

export TEXINPUTS := .:$(TEXINPUTS):

DOC := thesis.tex
DEPENDENCIES := $(DOC) ucbthesis.cls abstract.tex \
	chap1.tex references.bib chap2.tex chap3.tex chap4.tex chap5.tex 

all: thesis

thesis: $(DOC)
	@make doc-build

thesis-save-temps: $(DOC)
	@make doc-build-save-temps

doc-build: $(DOC:.tex=.pdf)

.SUFFIXES: .tex .pdf

%.pdf: %.tex $(DEPENDENCIES)
	pdflatex $<
	biber $(<:.tex=)
	pdflatex $<

purge:
	-rm -f *.aux *.dvi *.log *.bbl *.blg *.thm *.out *.fdb_latexmk *.toc *.run.xml *.los *.lof *.bcf *.lot

clean: purge
	-rm -f thesis.pdf
