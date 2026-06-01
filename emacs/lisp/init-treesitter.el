
;; If this is required **after** lsp-mode, it breaks my html config (I use web-mode, instead of html-ts-mode)
(use-package treesit-auto
  :ensure t
  :straight t
  :after emacs
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode t)
  ;; (delete 'html treesit-auto-langs)
)

(provide 'init-treesitter)
