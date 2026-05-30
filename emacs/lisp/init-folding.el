(use-package lsp-origami
  :straight t
  :hook (lsp-after-open . lsp-origami-try-enable))

(provide 'init-folding)
