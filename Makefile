TEX_FILES = \
	main.tex \
	0-overview.tex \
	10-semantic.tex \
	20-codegen.tex \
	30-optimize.tex \
	appendix.tex
CLASS_FILES = elegantbook.cls
BIB_FILES = reference.bib
IMAGES = image/g4.png image/godbolt.png figure/cover.jpg

.PHONY: all
all: main.pdf

main.pdf: $(TEX_FILES) $(CLASS_FILES) $(IMAGES) $(BIB_FILES)
	xelatex $<
	biber main
	xelatex $<
	xelatex $<

.PHONY: clean
clean:
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb # latex auxiliary files
	rm -f *.dvi *.xdv *-converted-to.* # intermediate documents
	rm -f .pdf
	rm -f *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml # bibliography auxiliary files
	rm -f *.fdb_latexmk *.synctex *.synctex\(busy\) *.synctex.gz *.synctex.gz\(busy\) *.pdfsync # build tool auxilary files
	rm -rf latex.out/ # latexrun
	rm -rf main.pdf
