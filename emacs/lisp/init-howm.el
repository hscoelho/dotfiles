;;; -*- lexical-binding: t -*-

;; In case tutorials are needed
;; https://leahneukirchen.org/blog/archive/2022/03/note-taking-in-emacs-with-howm.html
;; https://emacs101.github.io/howm.html
(use-package howm
  :straight t
  :after evil
  :init
  ;; 
  ;; Options: Remove the leading ";" in the following lines if you like.
  ;; 
  ;; Format
  ;; (require 'howm-markdown) ;; Write notes in markdown-mode. (*1)
  (require 'howm-org) ;; Write notes in Org-mode. (*2)
  ;; 
  ;; Preferences
  (setq howm-directory "~/org/howm") ;; Where to store the files?
  (setq howm-follow-theme t) ;; Use your Emacs theme colors. (*3)

  (evil-define-key 'normal 'global
    (kbd "<leader> n n") 'howm-menu
    (kbd "<leader> n c") 'howm-create
    (kbd "<leader> n e") 'howm-remember
    (kbd "<leader> n t") 'howm-list-todo
    (kbd "<leader> n s") 'howm-list-grep
    (kbd "<leader> n a") 'howm-list-notes
    (kbd "<leader> n .") 'howm-find-today
    (kbd "<leader> n :") 'howm-find-yesterday
    )

  (evil-define-key 'normal howm-view-summary-mode-map
    (kbd "RET") #'howm-view-summary-open
    "q" #'howm-view-kill-buffer
    )

  ;; howm-menu-mode
  (evil-define-key 'normal howm-menu-mode-map
    "<return>"   #'action-lock-magic-return
    "e"   #'howm-remember
    "c"   #'howm-create
    "D"   #'howm-duplicate-line
    "s"   #'howm-list-grep-fixed
    "g"   #'howm-list-grep
    "o"   #'howm-list-occur
    "h"   #'howm-history
    "a"   #'howm-list-notes
    "l"   #'howm-list-recent
    "A"   #'howm-list-around
    "w"   #'howm-random-walk
    "y"   #'howm-list-schedule
    "t"   #'howm-list-todo
    "."   #'howm-find-today
    ":"   #'howm-find-yesterday
    "b"   #'howm-list-buffers
    "x"   #'howm-list-mark-ring
    "Q"   #'howm-kill-all
    "d"   #'howm-insert-date
    "m"   #'howm-menu-edit
    "q" #'bury-buffer
    )

  ;; Use ripgrep as grep
  (setq howm-view-use-grep t)
  (setq howm-view-grep-command "rg")
  (setq howm-view-grep-option "-nH --no-heading --color never")
  (setq howm-view-grep-extended-option nil)
  (setq howm-view-grep-fixed-option "-F")
  (setq howm-view-grep-expr-option nil)
  (setq howm-view-grep-file-stdin-option nil)
  ;; 
  ;; Performance
  ;;(setq howm-menu-expiry-hours 1) ;; Cache menu N hours. (*4)
  ;;(setq howm-menu-refresh-after-save nil) ;; Speed up note saving. (*5)
  )

(provide 'init-howm)
