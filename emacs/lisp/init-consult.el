;; -*- lexical-binding: t; -*-

(use-package consult
  :straight t
  :init
  ;; Enhance register preview with thin lines and no mode line.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult for xref locations with a preview feature.
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref
        consult-async-min-input 1)
  )

;; Custom consult commands
(defun custom-consult-lsp-lens-execute()
  ;; If line number is ever needed:
  ;; (line (line-number-at-pos (overlay-start ov))
  ;; (label (format "Line %d: %s" line title)))
  (interactive)
  (unless (bound-and-true-p lsp-lens--overlays)
    (user-error "No active LSP lenses found in current buffer"))
  (let ((candidates '()))
    (dolist (ov lsp-lens--overlays)
      (dolist (md (overlay-get ov 'lsp--metadata))
        (let* ((label (substring-no-properties md))
               (action (get-text-property 0 'action md)))
          (push (cons label action) candidates))))
    (setq candidates (nreverse candidates))
    (if (null candidates)
        (message "No selectable lsp lens candidates")
    (message "%S" candidates)
    (setq selected-action (consult--read candidates
     :sort nil
     :lookup #'consult--lookup-cdr
     :prompt "Execute lsp lens:"))
    (message "%S" selected)
    (when selected-action (funcall-interactively selected-action))
    )))



(provide 'init-consult)
