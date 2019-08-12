(TeX-add-style-hook
 "main_ieee"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("IEEEtran" "conference" "final" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("hyperref" "unicode=true")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
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
    "booktabs")
   (TeX-add-symbols
    "tightlist")
   (LaTeX-add-labels
    "introduction"
    "keywords"
    "methods-used"
    "wgpmin"
    "wgpsoftgoal"
    "wgphardgoal"
    "wgppositivity"
    "rpmin"
    "rpcon"
    "u-set"
    "wrgpmin"
    "wrgpsoftgoal"
    "wrgptuning"
    "wrgphardgoal"
    "wrgppositivity"
    "the-model"
    "dm_obj"
    "dm_tax"
    "dm_median"
    "dm_management"
    "the-robust-counterpart"
    "lquartile"
    "uquartile"
    "ps-goal"
    "es-goal"
    "results"
    "last"
    "conclusion")
   (LaTeX-add-bibliographies
    "reference"))
 :latex)

