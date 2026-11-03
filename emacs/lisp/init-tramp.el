;;; -*- lexical-binding: t -*-

(use-package tramp
  :ensure nil
  :config
  ;; Append 'tramp-own-remote-path to use the remote user's PATH (~/.bashrc, ~/.zshrc)
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(use-package tramp-rpc
  :straight (:host github :repo "ArthurHeymans/emacs-tramp-rpc" :branch "master")
  )

(provide 'init-tramp)
