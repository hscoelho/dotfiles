;; -*- lexical-binding: t; -*-

(use-package consult
  :straight t
  :init
  ;; Enhance register preview with thin lines and no mode line.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult for xref locations with a preview feature.
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref
        consult-async-min-input 1))



(provide 'init-consult)
