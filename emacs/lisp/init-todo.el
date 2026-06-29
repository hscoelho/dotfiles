;;; -*- lexical-binding: t -*-
;; TODO: Add consult-todo?
;; ERROR: 
(use-package hl-todo
  :straight t
  :custom
  (hl-todo-keyword-faces
   '(("TODO"   . "#0000FF")
     ("ERROR"  . "#FF0000")
     ("FIXME"  . "#FF0000")
     ("DEBUG"  . "#A020F0")
     ("GOTCHA" . "#FF4500")
     ("STUB"   . "#1E90FF")))
  )


(provide 'init-todo)
