;;; -*- lexical-binding: t -*-

;; In case tutorials are needed
;; https://leahneukirchen.org/blog/archive/2022/03/note-taking-in-emacs-with-howm.html
;; https://emacs101.github.io/howm.html
(use-package howm
  :straight t
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

  ;; RET (translated from <return>) runs the command howm-view-summary-open
  ;; (found in howm-view-summary-mode-map), which is an interactive
  ;; native-comp-function in ‘howm-view.el’.
  ;; RET (translated from <return>) runs the command
  ;; action-lock-magic-return (found in action-lock-mode-map), which is an
  ;; interactive native-comp-function in ‘action-lock.el’.

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
