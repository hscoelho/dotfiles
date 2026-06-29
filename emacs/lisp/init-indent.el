;;; -*- lexical-binding: t -*-
(use-package indent-bars
  :straight t
  :hook (prog-mode . indent-bars-mode)) ; or whichever modes you prefer

(use-package dtrt-indent
  :straight t
  :config
  :hook (prog-mode . dtrt-indent-mode))

(provide 'init-indent)
