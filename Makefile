MODULES=lib/db lib/dbquery main lib/search testing/unit_test
OBJECTS=$(MODULES:=.cmo)
MLS=$(MODULES:=.ml)
MLIS=$(MODULES:=.mli)

default: build
	utop

build:
	@dune build main.exe

script:
	@dune exec ./script.exe

test: 
	@dune clean
	@dune runtest -j 1

clear:
	rm upick.db

clean:
	@dune clean
	rm -rf doc.public project.zip

docs: clean build 
	@dune build @doc
	mkdir -p doc.public
	cp -r _build/default/_doc/_html doc.public
	
app:
	@dune exec ./main.exe

zip:
	zip project.zip *.ml* .ocamlinit .merlin *.mli* dune dune-project *.txt* *.md* *.json _tags Makefile