;;; -*- lexical-binding: t -*-

(use-package gptel
  :straight t
  :config
  ;; the keys should be set in the ~/.authinfo
  (gptel-make-gemini "Gemini" :stream t :key gptel-api-key )
  (setq gptel-model   'deepseek-v4-flash
        gptel-backend (gptel-make-deepseek "DeepSeek" :stream t :key gptel-api-key))
  )

(provide 'init-gpt)
