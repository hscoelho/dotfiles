(use-package orderless
  :straight t
  :defer t                                    ;; Load Orderless on demand.
  :after vertico                              ;; Ensure Vertico is loaded before Orderless.
  :init
  (setq completion-styles '(orderless basic)  ;; Set the completion styles.
        completion-category-defaults nil      ;; Clear default category settings.
        orderless-matching-styles '(orderless-literal orderless-regexp orderless-flex)
        )
  )

(provide 'init-orderless)
