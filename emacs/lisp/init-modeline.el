;;; -*- lexical-binding: t -*-
(use-package doom-modeline
  :straight t
  :defer t
  :custom
  (doom-modeline-project-detection 'project)           ;; Enable project detection for displaying the project name.
  (doom-modeline-buffer-name t)                        ;; Show the buffer name in the mode line.
  (doom-modeline-project-name t)
  (doom-modeline-vcs-max-length 25)                    ;; Limit the version control system (VCS) branch name length to 25 characters.
  :config
  (setq doom-modeline-icon t)                      ;; Enable icons in the mode line if nerd fonts are used.
  (setq doom-modeline-icon nil)
  :hook
  (after-init . doom-modeline-mode))

(provide 'init-modeline)
