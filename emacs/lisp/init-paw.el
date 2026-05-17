(use-package paw
  :straight (:host github :repo "chenyanming/paw" :branch "main")
  :init (require 'paw-hsk)
  (require 'paw- paw-hsk-dir "~/Documents/Chinese/word_list")
  (paw-hsk-update-word-lists)
  :config
  (setq gptel--openai-models "")
  (setq paw-tts-program nil)
  :custom
  (paw-non-ascii-word-separator "⁣") ;; Invisible separator character
  (paw-non-ascii-language "zh")

  (paw-go-translate-langs '(en zh))

  (paw-offline-studylist '(("Chinese Studylist" ;; studylist name when choosing offline studylist
    		      (id . "1") ;; random id for internal use, but it could not be the same as any id in online study list defined in `paw-studylist'
    		      (language . "zh") ;; language of the studylist
    		      (name . "Chinese")) ;; name of the studylist
    		     ))

  (paw-search-function #'paw-chinese-search-function)
  (paw-chinese-sdcv-exact-match t)
  (paw-hsk-levels-to-highlight "hsk1 hsk3 hsk4 hsk5 hsk6 hsk7-to-9")
  )

(provide 'init-paw)
