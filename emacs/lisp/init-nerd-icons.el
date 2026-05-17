(use-package nerd-icons
  :ensure t
  :straight t
  :defer t)

(use-package nerd-icons-dired
  :ensure t
  :straight t
  :defer t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :ensure t                               ;; Ensure the package is installed.
  :straight t
  :after (:all nerd-icons marginalia)     ;; Load after `nerd-icons' and `marginalia' to ensure proper integration.
  :config
  (nerd-icons-completion-mode)            ;; Activate nerd icons for completion interfaces.
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup)) ;; Setup icons in the marginalia mode for enhanced completion display.

(use-package nerd-icons-corfu
  :ensure t
  :straight t
  :defer t
  :after (:all corfu))

(provide 'init-nerd-icons)
