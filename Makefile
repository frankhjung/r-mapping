#!/usr/bin/make -s

.PHONY: all clean
.SUFFIXES: .Rmd .pdf

R = /usr/bin/R
DOC = fakenews
RMD := $(patsubst %, %.Rmd, $(DOC))
PDF := $(patsubst %.Rmd, %.pdf, $(RMD))

.Rmd.pdf:
	@$(R) -q --slave --vanilla --file=make.R --args $<

$(PDF): $(RMD)

all: clean $(PDF)

clean:
	@$(RM) $(PDF)

cleanall: clean
	@$(RM) -rf cache figure *.tex *.html
