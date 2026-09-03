;;; -*- lexical-binding: t -*-

(use-package gptel
  :straight t
  :config
  (gptel-make-gemini "Gemini" :stream t :key gptel-api-key )
  (gptel-make-deepseek "DeepSeek" :stream t :key gptel-api-key)
  )

(provide 'init-gpt)
