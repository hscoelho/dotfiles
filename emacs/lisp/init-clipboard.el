;;; -*- lexical-binding: t -*-
(use-package clipetty
  :ensure t
  :straight t
  :hook (after-init . global-clipetty-mode))


(setq select-enable-primary nil) ;; this is set to nil because it was yanking visual mode text automatically
(setq select-enable-clipboard t)
(setq xterm-extra-capabilities '(getSelection setSelection))

(provide 'init-clipboard)
