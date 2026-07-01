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
  (defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p " *Mini" name)
     ;; (string-prefix-p "*epc" name)
     ;; (string-prefix-p "*helm" name)
     ;; (string-prefix-p "*Helm" name)
     ;; (string-prefix-p "*Compile-Log*" name)
     ;; (string-prefix-p "*lsp" name)
     ;; (string-prefix-p "*company" name)
     ;; (string-prefix-p "*Flycheck" name)
     ;; (string-prefix-p "*tramp" name)
     ;; (string-prefix-p "*help" name)
     ;; (string-prefix-p "*straight" name)
     ;; (string-prefix-p " *temp" name)
     ;; (string-prefix-p "*Help" name)
     ;; (string-prefix-p "*mybuf" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
          (not (file-name-extension name)))
     )))

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
