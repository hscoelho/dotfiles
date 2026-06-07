;; -*- lexical-binding: t; -*-

(defun consult--orderless-regexp-compiler (input type &rest _config)
  (setq input (cdr (orderless-compile input)))
  (cons
   (mapcar (lambda (r) (consult--convert-regexp r type)) input)
   (lambda (str) (orderless--highlight input t str))))

(defun consult--with-orderless (&rest args)
  (let ((consult--regexp-compiler #'consult--orderless-regexp-compiler))
    (apply args)))
(use-package consult
  :straight t
  :init
  ;; Enhance register preview with thin lines and no mode line.
  (advice-add #'register-preview :override #'consult-register-window)



  ;; OPTION 1: Activate globally for all consult-grep/ripgrep/find/...
  ;; (setq consult--regexp-compiler #'consult--orderless-regexp-compiler)

  ;; OPTION 2: Activate only for some commands, e.g., consult-ripgrep!
  (advice-add #'consult-fd :around #'consult--with-orderless)
  ;; not sure I want this, but in case I change my mind:
  ;; (advice-add #'consult-ripgrep :around #'consult--with-orderless)
  
  ;; Use Consult for xref locations with a preview feature.
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref
        consult-async-min-input 1))



(provide 'init-consult)
