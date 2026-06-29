;;; -*- lexical-binding: t -*-
(use-package doom-modeline
  :ensure t
  :straight t
  :defer t
  :custom
  (doom-modeline-buffer-file-name-style 'buffer-name)  ;; Set the buffer file name style to just the buffer name (without path).
  (doom-modeline-project-detection 'project)           ;; Enable project detection for displaying the project name.
  (doom-modeline-buffer-name t)                        ;; Show the buffer name in the mode line.
  (doom-modeline-vcs-max-length 25)                    ;; Limit the version control system (VCS) branch name length to 25 characters.
  :config
  (setq doom-modeline-icon t)                      ;; Enable icons in the mode line if nerd fonts are used.
  (setq doom-modeline-icon nil)
  :hook
  (after-init . doom-modeline-mode))

(provide 'init-modeline)
