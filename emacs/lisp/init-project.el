;;; -*- lexical-binding: t -*-

;; alternative packages that might be worth exploring:
;; tabspaces: https://codeberg.org/mclear-tools/tabspaces


(use-package auto-tab-groups
  :straight (auto-tab-groups :type git :host github :repo "MArpogaus/auto-tab-groups")
  :init
  ;; A tab group for each project, made by `project-switch-project'.
  (auto-tab-groups-project-mode)
  ;; The modern tab style.  The icons come from nerd-icons, if you
  ;; have it.  Plain strings also work:
  ;; (auto-tab-groups-eyecandy-icons '(("HOME" . "⌂")))
  (auto-tab-groups-eyecandy-mode)
  (auto-tab-groups-mode))

;; this is a simple version of the auto-tab-groups
;; I prefer auto-tab-groups because of the eyecandy mode
;; (use-package project-tab-groups
;;   :straight t
;;   :config
;;   (project-tab-groups-mode 1))
;; (setq tab-bar-format '(tab-bar-format-history tab-bar-format-tabs-groups tab-bar-separator))

(setq project-switch-commands 'consult-project-buffer)
(setq project-vc-extra-root-markers '(".project"))

(provide 'init-project)
