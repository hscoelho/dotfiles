
;; For some reason, these packages conflict with eachother.
;; It may exist a way to make them work together, but I prefer having images
;; more than a few more keybindings options

(use-package kitty-graphics
  :straight
  (:host github :repo "cashmeredev/kitty-graphics.el")
  :config
  (kitty-graphics-setup)
  )

;; (use-package kkp
;;   :after kitty-graphics
;;   :ensure t
;;   :hook (tty-setup . global-kkp-mode)
;;   :config
;;   ;; (setq kkp-alt-modifier 'alt) ;; use this if you want to map the Alt keyboard modifier to Alt in Emacs (and not to Meta)
;;   )

(provide 'init-kitty)
