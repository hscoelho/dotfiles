;;; -*- lexical-binding: t -*-
;; for eaf to work, the following command needs to be run:
;; git clone https://github.com/emacs-eaf/emacs-application-framework at ~/.emacs.d/site-lisp
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"

  ;; :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  ;; (eaf-browser-continue-where-left-off t)
  ;; (eaf-browser-enable-adblocker t)
  ;; (browse-url-browser-function 'eaf-open-browser)
  :config
  ;; (defalias 'browse-web #'eaf-open-browser)
  ;; (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  ;; (eaf-bind-key nil "M-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki
  (require 'eaf-browser)
  (require 'eaf-pdf-viewer)
  (eaf-bind-key nil "C-w" eaf-browser-keybinding) ;; unbind, see more in the Wiki
  (eaf-bind-key nil "C-w C-w" eaf-browser-keybinding) ;; unbind, see more in the Wiki
  (eaf-bind-key nil "C-w C-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki
  )



(provide 'init-eaf)
