SOURCE=$(wildcard *.tex)
OBJ=$(SOURCE:%.tex=%.pdf)
GENFOLDER=gen
PRJLINK=prj.link
SOURCE_LINE_COUNT_REPORT=$(GENFOLDER)/source-line-count.txt
SOURCELISTING=$(GENFOLDER)/java-source-listing.tex

view: compile
	gnome-open $(OBJ) || open $(OBJ)

compile: $(SOURCE_LINE_COUNT_REPORT) $(SOURCELISTING) $(OBJ)

%.pdf : %.tex
	pdflatex -draftmode -interaction=nonstopmode -halt-on-error $<
	pdflatex -interaction=nonstopmode -halt-on-error $<

$(GENFOLDER):
	mkdir -p $(GENFOLDER)
$(PRJLINK):
	ln -fs ../java $(PRJLINK)
$(SOURCELISTING): $(PRJLINK) $(GENFOLDER)
	./get-source-listing.sh > $(SOURCELISTING)
$(SOURCE_LINE_COUNT_REPORT): $(PRJLINK) $(GENFOLDER)
	./get-source-line-count.sh > $(SOURCE_LINE_COUNT_REPORT)
fake:
	mkdir -p $(GENFOLDER)
	touch $(SOURCELISTING)
clean:
	rm -f *.aux *.log *.pdf *.toc *.backup
	rm -f $(PRJLINK)
	rm -rf $(GENFOLDER)
