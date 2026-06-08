(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold nil)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic nil) ; if nil, italics is universally disabled
  :config
  ;; This is my custom theme
  ;; (load-theme 'doom-flexoki-minimal-light t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(use-package modus-flexoki
  :vc (:url "https://github.com/dpassen/modus-flexoki"
            :rev :newest)
  :custom
  (modus-themes-common-palette-overrides
   '((comment red-intense)
     (variable-use fg)
     (variable fg)
     (property fg)
     (type pink)
     (fnname-call blue)
     (number constant)
     ))
  :config
  (load-theme 'modus-flexoki-light :no-confirm))

;; (use-package modus-themes
;;   :straight t
;;   )

(provide 'init-theme)
