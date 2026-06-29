;;; -*- lexical-binding: t -*-
;; For this config to work:
;; install dependency first: emacs-jinx in fedora
;; install hunspell pt br as well (hunspell-pt-BR in fedora)
(use-package jinx
  :straight t
  :init
  (global-jinx-mode)
  :custom
  (jinx-languages "en_US pt_BR"))


(provide 'init-jinx)
