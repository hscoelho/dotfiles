;;; init.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; This config started as Emacs kick: https://github.com/LionyxML/emacs-kick
;;; and modified according to my personal taste
;;; Code:

;; This config is separated in multiple files. The other files are located in the lisp folder
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Performance Hacks
(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 4))

;; Bootstraps `straight.el'
(setq straight-check-for-modifications nil)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package '(project :type built-in))
(straight-use-package 'use-package)


(require 'init-evil)
(require 'init-org)
(require 'init-emacs)
(require 'init-window)

(require 'init-chinese)
(require 'init-agent)
(require 'init-centered-line)
(require 'init-clipboard)
(require 'init-orderless)
(require 'init-consult)
(require 'init-corfu)
(require 'init-delimiters)
(require 'init-dired)
(require 'init-dotenv)
(require 'init-epub)
(require 'init-eldoc)
(require 'init-embark)
(require 'init-folding)
(require 'init-formatting)
(require 'init-ghostel)
(require 'init-helpful)
(require 'init-indent)
(require 'init-jinx)
(require 'init-kitty)
(require 'init-lsp)
(require 'init-marginalia)
(require 'init-markdown)
(require 'init-modeline)
(require 'init-nerd-icons)
(require 'init-node-modules)
;; (require 'init-paw)
(require 'init-project)
(require 'init-pulsar)
;; (require 'init-reader)
(require 'init-theme)
(require 'init-todo)
(require 'init-undo)
(require 'init-vc)
(require 'init-vertico)
(require 'init-vterm)
(require 'init-wakatime)
(require 'init-which-key)

(use-package perspective
  :straight t)

(provide 'init)
;;; init.el ends here
