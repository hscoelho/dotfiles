;;; -*- lexical-binding: t -*-

;; alternative packages that might be worth exploring:
;; auto-tab-groups: https://github.com/MArpogaus/auto-tab-groups
;; tabspace: https://codeberg.org/mclear-tools/tabspaces
;; for now, I think this simple one is exactly what I need
(use-package project-tab-groups
  :straight t
  :config
  (project-tab-groups-mode 1))


;; Switch tab-bar-format-tabs to tab-bar-format-tabs-groups
(setq tab-bar-format '(tab-bar-format-history tab-bar-format-tabs-groups tab-bar-separator tab-bar-format-add-tab))

(setq project-switch-commands 'consult-project-buffer)
(setq project-vc-extra-root-markers '(".project"))

(provide 'init-project)
