;;; -*- lexical-binding: t -*-
(use-package typst-ts-mode
  :straight '(:type git :host codeberg :repo "meow_king/typst-ts-mode" :branch "main"))

(use-package typst-preview
  :straight '(:type git :host github :repo "havarddj/typst-preview.el" :branch "main")

  :init
  (setq typst-preview-autostart t) ; start preview automatically when typst-preview-mode is activated
  (setq typst-preview-open-browser-automatically t) ; open browser automatically when typst-preview-start is run

  :custom
  ;; (typst-preview-browser "default") 	; this is the default option; other options are `eaf-browser' or `xwidget'.
  (typst-preview-browser "eaf") 	; this is the default option; other options are `eaf-browser' or `xwidget'.
  ;; (typst-preview-invert-colors "auto")	; invert colors depending on system theme
  ;; (typst-preview-executable "tinymist") ; path to tinymist binary (relative or absolute)
  (typst-preview-partial-rendering t)   ; enable partial rendering
  
  :config
  (define-key typst-preview-mode-map (kbd "C-c C-j") 'typst-preview-send-position)
  )

(provide 'init-typst)
