;;; -*- lexical-binding: t -*-

;;; If nerd-icons are not appearing in the GUI, run 'M-x nerd-icons-install-fonts'!

(use-package nerd-icons
  :straight t
  :defer t)

(use-package nerd-icons-dired
  :straight t
  :defer t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :straight t
  :after (:all nerd-icons marginalia)     ;; Load after `nerd-icons' and `marginalia' to ensure proper integration.
  :config
  (nerd-icons-completion-mode)            ;; Activate nerd icons for completion interfaces.
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup)) ;; Setup icons in the marginalia mode for enhanced completion display.

(use-package nerd-icons-corfu
  :straight t
  :defer t
  :after (:all corfu))

(provide 'init-nerd-icons)
