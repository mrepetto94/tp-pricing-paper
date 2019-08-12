(TeX-add-style-hook
 "SCS19_final"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("IEEEtran" "conference" "final" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("hyperref" "bookmarks=false")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "IEEEtran"
    "IEEEtran10"
    "hyperref"
    "graphicx"
    "amsmath"
    "mathtools"
    "tikz"
    "amsfonts"
    "cite"
    "booktabs"
    "drawstack")
   (TeX-add-symbols
    "tightlist")
   (LaTeX-add-labels
    "introduction"
    "methods-used"
    "wgpmin"
    "wgpsoftgoal"
    "wgphardgoal"
    "wgppositivity"
    "rpmin"
    "rpcon"
    "wrgpmin"
    "wrgpsoftgoal"
    "wrgptuning"
    "wrgphardgoal"
    "wrgppositivity"
    "the-model"
    "fig:tp-m"
    "dm_obj"
    "dm_tax"
    "dm_median"
    "dm_management"
    "p_l"
    "p_u"
    "l_q"
    "up_q"
    "lquartile"
    "uquartile"
    "es-goal"
    "model-deploy"
    "results"
    "tern"
    "last"
    "conclusion"
    "res-comparison"
    "fea-comparison"
    "dev-comparison")
   (LaTeX-add-bibliographies
    "reference"))
 :latex)

