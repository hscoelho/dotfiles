(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold nil)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic nil) ; if nil, italics is universally disabled
  :config
  ;; This is my custom theme
  (load-theme 'doom-flexoki-minimal-light t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(provide 'init-theme)
