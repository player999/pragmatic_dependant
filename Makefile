
all:compile zip
	@nohup evince ./output/pragmatic_dependent.pdf >/dev/null&
	@echo

compile:clean
	@latex -output-directory=./output ./pragmatic_dependent.tex 
	@bibtex ./output/pragmatic_dependent.aux
	@latex -output-directory=./output ./pragmatic_dependent.tex ./pragmatic_dependent.aux
	@latex -output-directory=./output ./pragmatic_dependent.tex ./pragmatic_dependent.aux
	@dvips -t a4 -o ./output/pragmatic_dependent.ps ./output/pragmatic_dependent.dvi
	@ps2pdf ./output/pragmatic_dependent.ps ./output/pragmatic_dependent.pdf

clean:
	@rm -f ./output/*

zip:
	@rm -f ./pics/*~
	@rm -f ZakharchenkoTaras_PragmaticDependent.zip 
	@zip -r ZakharchenkoTaras_PragmaticDependent.zip *.bst *.cls *.tex *.bim ./pics
