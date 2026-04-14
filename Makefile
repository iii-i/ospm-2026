.SUFFIXES: .tex .aux .pdf

PDFLATEX=xelatex

TEX_INTERMEDIATES = $(PROJ:=.aux) $(PROJ:=.idx) $(PROJ:=.lof) \
	$(PROJ:=.log) $(PROJ:=.lot) $(PROJ:=.out) $(PROJ:=.toc) \
	$(PROJ:=.nav) $(PROJ:=.snm)

.tex.aux: ; $(PDFLATEX) $< /dev/null

.aux.pdf: ; $(PDFLATEX) $(<:.aux=.tex) /dev/null

PROJ = paravirt
TEX_FILES = beamerthemeClearIBM.sty

all: $(PROJ:=.pdf)

$(PROJ:=.aux): $(TEX_FILES)

clean:
	$(RM) $(TEX_INTERMEDIATES) $(PROJ:=.pdf)
