;;; -*- lexical-binding: t -*-

;; alternative packages that might be worth exploring:
;; tabspaces: https://codeberg.org/mclear-tools/tabspaces


(use-package auto-tab-groups
  :straight (auto-tab-groups :type git :host github :repo "MArpogaus/auto-tab-groups")
  :init
  ;; A tab group for each project, made by `project-switch-project'.
  (auto-tab-groups-project-mode)
  (auto-tab-groups-mode))

(use-package modern-tab
  :straight (modern-tab :type git :host github :repo "MArpogaus/modern-tab")
  :hook ((after-init . modern-tab-bar-mode)
         (after-init . modern-tab-line-mode)))

;; this is a simple version of the auto-tab-groups
;; I prefer auto-tab-groups because of the eyecandy mode
;; (use-package project-tab-groups
;;   :straight t
;;   :config
;;   (project-tab-groups-mode 1))
;; (setq tab-bar-format '(tab-bar-format-history tab-bar-format-tabs-groups tab-bar-separator))

(setq project-switch-commands 'project-find-file)
(setq project-vc-extra-root-markers '(".project"))

(provide 'init-project)
