#EXTENDED=yes

ifeq ($(EXTENDED),)
   OPTS = 
else
   OPTS = -a extended
endif

all: prepare html pdf

.PHONY: prepare
prepare:
	mkdir -p build
	bundle install --binstubs

html:
	bundle exec asciidoctor -a html $(OPTS) -b html5 -o build/nxsl.html index.adoc

pdf:
	#asciidoctor-pdf -a pdf-style=netxms-theme.yml -a pdf-fontsdir=fonts -o build/nxsl.pdf index.adoc
	bundle exec asciidoctor-pdf -o build/nxsl.pdf index.adoc

clean:
	rm -rf build/nxsl.pdf build/nxsl.html
