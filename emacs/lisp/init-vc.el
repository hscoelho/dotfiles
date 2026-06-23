(use-package vc
  :ensure nil                        ;; This is built-in, no need to fetch it.
  :defer t
  :bind
  (("C-x v d" . vc-dir)              ;; Open VC directory for version control status.
   ("C-x v =" . vc-diff)             ;; Show differences for the current file.
   ("C-x v D" . vc-root-diff)        ;; Show differences for the entire repository.
   ("C-x v v" . vc-next-action))     ;; Perform the next version control action.
  :config
  ;; Better colors for <leader> g b  (blame file)
  (setq vc-annotate-color-map
        '((20 . "#f5e0dc")
          (40 . "#f2cdcd")
          (60 . "#f5c2e7")
          (80 . "#cba6f7")
          (100 . "#f38ba8")
          (120 . "#eba0ac")
          (140 . "#fab387")
          (160 . "#f9e2af")
          (180 . "#a6e3a1")
          (200 . "#94e2d5")
          (220 . "#89dceb")
          (240 . "#74c7ec")
          (260 . "#89b4fa")
          (280 . "#b4befe"))))

(use-package vc-jj
  :straight t)

;;; SMERGE
;; Smerge is included for resolving merge conflicts in files. It provides a simple interface
;; to help you keep changes from either the upper or lower version during a merge.
;; This package is built-in, so there's no need to fetch it separately.
;; The keybindings below did not needed to be set, are here just to show
;; you how to work with it in case you are curious about it.
(use-package smerge-mode
  :ensure nil                                  ;; This is built-in, no need to fetch it.
  :defer t
  :bind (:map smerge-mode-map
              ("C-c ^ u" . smerge-keep-upper)  ;; Keep the changes from the upper version.
              ("C-c ^ l" . smerge-keep-lower)  ;; Keep the changes from the lower version.
              ("C-c ^ n" . smerge-next)        ;; Move to the next conflict.
              ("C-c ^ p" . smerge-previous)))  ;; Move to the previous conflict.

(use-package diff-hl
  :straight t
  :custom
  (global-diff-hl-mode t)
  ;; flydiff mode doesn't work with jujutsu yet
  (diff-hl-margin-symbols-alist '((insert . "┃") ;; Customize symbols for each change type.
                                  (delete . "-")
                                  (change . "┃")
                                  (unknown . "┆")
                                  (ignored . "i")))
  )



;;; MAGIT
(use-package magit
  :straight t
  :config
  (setopt magit-format-file-function #'magit-format-file-nerd-icons) ;; Turns on magit nerd-icons
  :defer t)

;;; Majutsu (magit equivalent to jujutsu)
;;; It needs magit to work
(use-package majutsu
  :straight (:host github :repo "0WD0/majutsu"))


(provide 'init-vc)
