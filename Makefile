.PHONY: clean

EXTRASTYS = abhepexpt.sty abhep.sty abmath.sty lineno.sty SIunits.sty varwidth.sty

thesis.pdf: thesis.tex thesis.cls theory.tex detector.tex reconstruction.tex categorisation.tex modelling.tex statandresults.tex conclusions.tex frontmatter.tex backmatter.tex
	@rm -f $(EXTRASTYS)
	unzip extrastyles.zip
	@rm -f thesis.{aux,toc,lof,lot}
	(rm -f thesisfeynmandiags.* && pdflatex thesis && mpost thesisfeynmandiags.mp && bibtex thesis && pdflatex thesis && pdflatex thesis) || rm -f $(EXTRASTYS) thesis.pdf
	@rm -f thesis.{aux,toc,lof,lot}
	@rm -f $(EXTRASTYS)

clean:
	@rm -f $(EXTRASTYS)
	@rm -f thesis.pdf thesis.log thesis.aux
	@rm -f *.bbl *.blg *.lof *.cut
	@rm -f *.lot *.out *.toc
