;;; -*- lexical-binding: t -*-
(use-package ghostel
  :straight t
  :custom
  (ghostel-shell "nu")
  )

(use-package evil-ghostel
  :straight t
  :after (ghostel evil)
  :hook (ghostel-mode . evil-ghostel-mode))

(provide 'init-ghostel)
