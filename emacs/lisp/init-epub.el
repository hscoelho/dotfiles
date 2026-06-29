;;; -*- lexical-binding: t -*-
(use-package nov
  :straight t
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  )

(provide 'init-epub)
