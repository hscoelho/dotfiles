;;; -*- lexical-binding: t -*-
;; `fzf`
(use-package fzf-native
  :vc (:url "https://github.com/dangduc/fzf-native" :rev :newest))

(use-package fussy
  :straight t
  :config
  (fussy-setup-fzf)
  )

(provide 'init-fussy)
