EXAMPLES= ex_cube.pdf ex_sphere.pdf ex_sphere_cube.pdf
LIBS=$(wildcard lib/*)

all: $(EXAMPLES)

examples: $(EXAMPLES)

$(EXAMPLES) : %.pdf : %.ps
	ps2pdf $<
%.ps : %.dvi
	dvips $<
%.dvi: %.tex
	rubber $<
%.tex: %.pp template_tikz.tex 
	sketch -t template_tikz.tex -o $@ $<
%.pp : %.sk $(LIBS)
	gpp -H $< > $@

.PRECIOUS: %.pp %.tex
