;;; -*- lexical-binding: t -*-

(use-package doc-view
  :after evil
  :custom
  (doc-view-continuous t)
  :init
  (evil-define-key 'normal doc-view-mode-map
    (kbd "SPC") nil ; should be evil prefix
    )
  )

(provide 'init-docview)
