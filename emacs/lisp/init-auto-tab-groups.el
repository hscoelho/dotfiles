;;; -*- lexical-binding: t -*-
(use-package project-tab-groups
  :straight t
  :config
  (project-tab-groups-mode 1))

;; Switch tab-bar-format-tabs to tab-bar-format-tabs-groups
(setq tab-bar-format '(tab-bar-format-history tab-bar-format-tabs-groups tab-bar-separator tab-bar-format-add-tab))

(provide 'init-auto-tab-groups)
