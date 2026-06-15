;; TODO: Add modern org package
(use-package org
  :straight t     ;; This is built-in, no need to fetch it.
  :custom
  (org-directory "~/org/")
  (org-agenda-files org-directory)
  ;; (org-agenda-files (list (concat org-directory "tasks.org")
  ;;                         (concat org-directory "notes.org")
  ;;                         (concat org-directory "journal.org")))
  (org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAIT(w)" "|" "DONE(d)" "CANCELED(c)")))
  (org-return-follows-link t)
  (org-log-done 'time)
  (org-default-notes-file (concat org-directory "notes.org"))
  (org-capture-templates
   '(("t" "Todo" entry (file+headline "~/org/tasks.org" "Tasks")
      "* TODO %?\n %T")))
  )

(use-package org-journal
  :straight t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :custom
  (org-journal-file-format "%Y%m%d.org")
  (org-journal-dir "~/org/journal/")
  (org-journal-find-file 'find-file)
  (org-journal-enable-agenda-integration t)
  )

(use-package org-modern
  :straight t
  :hook (org-mode . org-modern-mode)
  )

(provide 'init-org)

