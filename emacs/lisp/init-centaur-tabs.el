(use-package centaur-tabs
  :straight t
  :after evil
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-cycle-scope 'tabs)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  ("C-S-<prior>" . centaur-tabs-move-current-tab-to-left)
  ("C-S-<next>" . centaur-tabs-move-current-tab-to-right)
  (:map evil-normal-state-map
      ("<leader> y y" . centaur-tabs-toggle-groups)
      ("M-j" . centaur-tabs-forward)
      ("M-k" . centaur-tabs-backward)
      ("M-J" . centaur-tabs-move-current-tab-to-right)
      ("M-K" . centaur-tabs-move-current-tab-to-left)
      ("M-h" . centaur-tabs-backward-group)
      ("M-l" . centaur-tabs-forward-group)
      ("g t" . centaur-tabs-forward)
      ("g T" . centaur-tabs-backward)))

(provide 'init-centaur-tabs)
