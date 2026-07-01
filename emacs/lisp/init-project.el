;;; -*- lexical-binding: t -*-

(use-package projectile
  :straight t
  :init
  (projectile-mode +1)
  :config
  )

;; (setq project-switch-commands 'consult-project-buffer)
(setq projectile-switch-project-action 'consult-project-buffer )

(provide 'init-project)
