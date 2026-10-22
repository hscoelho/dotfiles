;;; -*- lexical-binding: t -*-

(use-package pdf-tools
  :straight t)

(use-package auctex
  :straight t
  :init
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  )

(provide 'init-latex)
