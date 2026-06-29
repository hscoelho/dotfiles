;;; -*- lexical-binding: t -*-
;;; CORFU
(use-package corfu
  :straight t
  :defer t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-trigger ".")
  (corfu-auto-prefix 1)
  (corfu-cycle t)
  (corfu-quit-no-match t)
  (global-corfu-minibuffer nil)
  (corfu-scroll-margin 5)
  (corfu-max-width 50)
  (corfu-min-width 50)
  (corfu-popupinfo-delay 0.5)
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)
  ;; (keymap-unset corfu-map "RET")
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode t))

(use-package nerd-icons-corfu
  :ensure t
  :straight t
  :defer t
  :after (:all corfu))

(provide 'init-corfu)
