;; https://jiewawa.me/2025/11/tools-for-studying-chinese-with-emacs/

(use-package cc-cedict
  :straight t
  :init
  (setq cc-cedict-file "~/.emacs.d/cedict_ts.u8")
)

(use-package jieba
  :straight (:host github :repo "kisaragi-hiu/emacs-jieba" :branch "main")
  )

(provide 'init-chinese)
