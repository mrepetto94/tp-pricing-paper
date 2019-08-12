(TeX-add-style-hook
 "SCS19_final_vignette"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("beamer" "10pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("ccicons" "scale=2")))
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"
    "appendixnumberbeamer"
    "booktabs"
    "graphicx"
    "amsmath"
    "mathtools"
    "tikz"
    "amsfonts"
    "cite"
    "ccicons"
    "xspace")
   (TeX-add-symbols
    '("scalemath" 2)
    "themename")
   (LaTeX-add-labels
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
    "wrgpfeasible"
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
    "tern"
    "last"
    "res-comparison"
    "fea-comparison"
    "dev-comparison")
   (LaTeX-add-bibliographies
    "reference"))
 :latex)

