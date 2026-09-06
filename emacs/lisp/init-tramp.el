;;; -*- lexical-binding: t -*-

(use-package tramp
  :ensure nil
  :config
  ;; Append 'tramp-own-remote-path to use the remote user's PATH (~/.bashrc, ~/.zshrc)
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(provide 'init-tramp)
