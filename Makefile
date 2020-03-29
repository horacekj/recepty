SOURCES=$(wildcard */*.md *.md)

all: ${SOURCES:.md=.pdf}

%.pdf: %.tex
	mkdir -p build/$(dir $@)
	texfot xelatex -output-directory build/$(dir $@) $?
	cp build/$@ $@

%.tex: %.md sazba/template.tex
	pandoc --template=sazba/template.tex -t latex -f markdown-auto_identifiers $< > $@

clean:
	-rm -rf build

wipe: clean
	-rm -f */*.pdf

.PHONY: all clean wipe
# .PRECIOUS: %.tex
