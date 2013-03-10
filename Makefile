pdf: phyloqtl.pdf phyloqtl_supp.pdf

all: pdf phyloqtl_combined.pdf phyloqtl_source.tgz

phyloqtl_combined.pdf: phyloqtl.pdf phyloqtl_supp.pdf
	combinepdf -f phyloqtl.pdf phyloqtl_supp.pdf phyloqtl_combined.pdf

phyloqtl.dvi: phyloqtl.tex phyloqtl.bib genetics.bst Makefile Figs/fig1.eps Figs/fig2.eps Figs/fig3.eps Figs/fig4.eps Figs/fig6.eps
	latex phyloqtl
	bibtex phyloqtl
	latex phyloqtl
	latex phyloqtl
	latex phyloqtl

phyloqtl.pdf: phyloqtl.dvi
	dvipdf phyloqtl.dvi phyloqtl.pdf

phyloqtl_supp.pdf: phyloqtl_supp.tex genetics.bst Makefile SuppFigs/power_allpart.pdf SuppFigs/supp_tree_fig.pdf
	xelatex phyloqtl_supp
	xelatex phyloqtl_supp

Figs/fig1.pdf: Figs/fig1.tex Figs/phylotree.pdf
	cd Figs; pdflatex fig1.pdf

Figs/fig1.eps: Figs/fig1.pdf
	cd Figs; pdftops -eps fig1.pdf

Figs/fig2.eps: R/six_taxa_tree.R
	cd R; R CMD BATCH six_taxa_tree.R six_taxa_tree.Rout

Figs/fig4.eps: R/power_summaries.RData R/power_figs.R 
	cd R; R CMD BATCH power_figs.R power_figs.Rout

Figs/fig6.eps: R/app_results.RData R/app_fig.R 
	cd R; R CMD BATCH app_fig.R app_fig.Rout

Figs/phylotree.pdf: R/treefig.R
	cd R; R CMD BATCH treefig.R treefig.Rout

Figs/fig3.eps: R/compare2naive.R R/forfig3.RData
	cd R; R CMD BATCH compare2naive.R compare2naive.Rout

R/forfig3.RData: R/compare2naive_calcroc.R R/nullsims_all.RData R/compare2naive_phyloqtl_rev.RData R/compare2naiveB_ind.RData
	cd R; R CMD BATCH compare2naive_calcroc.R compare2naive_calcroc.Rout

SuppFigs/power_allpart.pdf: R/supp_sim_figs.R R/power_summaries_rev.RData
	cd R; R CMD BATCH supp_sim_figs.R supp_sim_figs.Rout

SuppFigs/supp_tree_fig.pdf: R/supp_treefig.R
	cd R; R CMD BATCH supp_treefig.R supp_treefig.Rout

clean: 
	\rm -f *.aux *.bbl *.blg *.log *.bak *~ *.Rout */*~ */*.Rout */*.aux */*.log

cleanall: 
	\rm -f *.aux *.bbl *.blg *.log *.pdf *.bak *~ *.Rout */*~ */*.Rout Figs/*.eps Figs/*.pdf SuppFigs/*.pdf */*.aux */*.log

phyloqtl_source.tgz: phyloqtl.tex phyloqtl_supp.tex genetics.bst phyloqtl.bib Figs/fig1.eps Figs/fig2.eps Figs/fig3.eps Figs/fig4.eps Figs/fig5.eps Figs/fig6.eps Figs/fig1.pdf SuppFigs/supp_tree_fig.pdf SuppFigs/power_allpart.pdf
	tar czvf phyloqtl_source.tgz phyloqtl.tex phyloqtl_supp.tex genetics.bst phyloqtl.bib Figs/fig?.eps Figs/fig?.pdf SuppFigs/*.pdf

