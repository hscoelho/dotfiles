;;; -*- lexical-binding: t -*-

;; (when (member system-type '(gnu gnu/linux gnu/kfreebsd darwin))
;;   (unless (find-font (font-spec :name "Symbols Nerd Font Mono"))
;;     (nerd-icons-install-fonts t)))

;; (when (android)
  ;; TODO: Add the correct path here...
  ;; (unless (find-font (font-spec :name "Symbols Nerd Font Mono"))
  ;; (nerd-icons-install-fonts "c:/Users/username/Desktop/"))
;; )

(use-package nerd-icons
  :straight t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  :config
  ;; Fallback font to properly show nerd-icons!
  (if (android)
      (set-fontset-font t nil  "Symbols Nerd Font Mono-22" nil 'prepend)
    (set-fontset-font t nil  "Symbols Nerd Font Mono-14" nil 'append))
  )

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
