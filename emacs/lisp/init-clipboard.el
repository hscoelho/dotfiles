;;; -*- lexical-binding: t -*-
(use-package clipetty
  :ensure t
  :straight t
  :hook (after-init . global-clipetty-mode))


(setq select-enable-primary t)
(setq select-enable-clipboard t)
(setq xterm-extra-capabilities '(getSelection setSelection))

(provide 'init-clipboard)
