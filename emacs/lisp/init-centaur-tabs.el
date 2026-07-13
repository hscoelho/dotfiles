;; Here are a few ideas to actually select tabs:
;; 1. Ace jump(centaur-tabs-ace-jump) - 1 keybinding plus a number
;; 2. Alt+n (centaur-tabs-select-visible-nth-tab)
;; 3. Select first tab then use next-tab
(use-package centaur-tabs
  :straight t
  :after evil
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-cycle-scope 'tabs)
  (setq centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-show-new-tab-button t
        centaur-tabs-set-modified-marker t
        centaur-tabs-show-navigation-buttons t
        centaur-tabs-set-bar 'under
        centaur-tabs-show-count nil
        ;; centaur-tabs-label-fixed-length 15
        ;; centaur-tabs-gray-out-icons 'buffer
        ;; centaur-tabs-plain-icons t
        x-underline-at-descent-line t
        centaur-tabs-left-edge-margin nil)


  (centaur-tabs-change-fonts (face-attribute 'default :font) 110)
  (centaur-tabs-headline-match)
  ;; (centaur-tabs-enable-buffer-alphabetical-reordering)
  ;; (setq centaur-tabs-adjust-buffer-order t)
  (setq uniquify-separator "/")
  (setq uniquify-buffer-name-style 'forward)

  ;; Instead of using the default projectile group function, we use a modified version
  ;; that gives the projectile project the highest priority
  ;; (centaur-tabs-group-by-projectile-project)
  (defun centaur-tabs-buffer-groups()
    "Slightly modified from the default centaur-tabs-projectile-buffer-groups"
    (if centaur-tabs-projectile-buffer-group-calc
        (symbol-value 'centaur-tabs-projectile-buffer-group-calc)
      (set (make-local-variable 'centaur-tabs-projectile-buffer-group-calc)
           (cond
            ;; I'm sending the minibuffers to misc, because I'd like them hidden
            ((string-equal " *" (substring (buffer-name) 0 2)) '("Misc"))
            ((string-equal "*Help*" (substring (buffer-name) 0 6)) '("Misc"))
            ((condition-case _err
                 (projectile-project-root)
               (error nil))
             (list (projectile-project-name)))
            ((or (get-buffer-process (current-buffer)) (memq major-mode '(comint-mode compilation-mode))) '("Term"))
            ((string-equal "*" (substring (buffer-name) 0 1)) '("Misc"))
            ((memq major-mode '(emacs-lisp-mode python-mode emacs-lisp-mode c-mode
                                                c++-mode javascript-mode js-mode
                                                js2-mode makefile-mode
                                                lua-mode vala-mode))
             '("Coding"))
            ((memq major-mode '( nxhtml-mode html-mode
                                 mhtml-mode css-mode))
             '("HTML"))
            ((memq major-mode '(org-mode calendar-mode diary-mode)) '("Org"))
            ((memq major-mode '(dired-mode)) '("Dir"))
            (t '("Other"))))
      (symbol-value 'centaur-tabs-projectile-buffer-group-calc)))

  (evil-define-key 'normal org-journal-mode-map
    (kbd "M-j") nil
    (kbd "M-k") nil
    (kbd "M-J") nil
    (kbd "M-K") nil
    (kbd "M-h") nil
    (kbd "M-l") nil)
  ;; :hook
  ;; (dashboard-mode . centaur-tabs-local-mode)
  ;; (term-mode . centaur-tabs-local-mode)
  ;; (calendar-mode . centaur-tabs-local-mode)
  ;; (org-agenda-mode . centaur-tabs-local-mode)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  ("C-S-<prior>" . centaur-tabs-move-current-tab-to-left)
  ("C-S-<next>" . centaur-tabs-move-current-tab-to-right)
  (:map evil-normal-state-map
        ("<leader> y t" . centaur-tabs-toggle-groups)
        ("<leader> y y" . centaur-tabs-ace-jump)
        ("M-l" . centaur-tabs-forward)
        ("M-h" . centaur-tabs-backward)
        ("M-L" . centaur-tabs-move-current-tab-to-right)
        ("M-H" . centaur-tabs-move-current-tab-to-left)
        ("M-k" . centaur-tabs-backward-group)
        ("M-j" . centaur-tabs-forward-group)
        ("g t" . centaur-tabs-forward)
        ("g T" . centaur-tabs-backward)
        )
  )

(provide 'init-centaur-tabs)
