;;; -*- lexical-binding: t -*-

;; I tried with the terminal and it didn't work. Also, I prefer reading epubs in nov.
;; However, this might be interesting, so I'm keeping it in my config without including it for now.
(use-package reader
  :straight '(reader :type git :host codeberg :repo "MonadicSheep/emacs-reader"
                     :files (:defaults "render-core.so")
                     :pre-build ("make" "all")))

(provide 'init-reader)
