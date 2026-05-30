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

;; Disable JIT native compilation during normal usage.
;; All native compilation is handled upfront during installation
;; (e.g., via `ek-reinstall.sh' or `ek/first-install').
;; This prevents Emacs from compiling packages in the background
;; while you're working, which can cause occasional stutters.
(setq native-comp-jit-compilation t)

;; Emacs comes with a built-in package manager (`package.el'), and we'll use it
;; when it makes sense. However, `straight.el' is a bit more user-friendly and
;; reproducible, especially for newcomers and shareable configs like emacs-kick.
;; So we bootstrap it here.
(setq package-enable-at-startup nil) ;; Disables the default package manager.

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

(require 'package)

;; Add MELPA (Milkypostman's Emacs Lisp Package Archive) to the list of package archives.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'init-emacs)


(require 'init-jieba)
(require 'init-cc-cedict)
(require 'init-centered-line)
(require 'init-clipboard)
(require 'init-consult)
(require 'init-corfu)
(require 'init-delimiters)
(require 'init-dired)
(require 'init-dotenv)
(require 'init-epub)
(require 'init-eldoc)
(require 'init-embark)
(require 'init-evil)
(require 'init-folding)
(require 'init-indent)
(require 'init-lsp)
(require 'init-marginalia)
(require 'init-markdown)
(require 'init-modeline)
(require 'init-nerd-icons)
(require 'init-node-modules)
(require 'init-orderless)
(require 'init-org)
;; (require 'init-paw)
(require 'init-pulsar)
(require 'init-theme)
(require 'init-treesitter)
(require 'init-undo)
(require 'init-vc)
(require 'init-vertico)
(require 'init-wakatime)
(require 'init-which-key)
(require 'init-window)

;;; UTILITARY FUNCTION TO INSTALL EMACS-KICK
(defun ek/first-install ()
  "Install tree-sitter grammars and compile packages on first run..."
  (interactive)                                      ;; Allow this function to be called interactively.
  (switch-to-buffer "*Messages*")                    ;; Switch to the *Messages* buffer to display installation messages.
  (message ">>> All required packages installed.")
  (message ">>> Configuring Emacs-Kick...")
  (message ">>> Configuring Tree Sitter parsers...")
  (require 'treesit-auto)
  (treesit-auto-install-all)                         ;; Install all available Tree Sitter grammars.
  (message ">>> Configuring Nerd Fonts...")
  (require 'nerd-icons)
  (nerd-icons-install-fonts)                         ;; Install all available nerd-fonts
  (message ">>> Emacs-Kick installed! Press any key to close the installer and open Emacs normally. First boot will compile some extra stuff :)")
  (read-key)                                         ;; Wait for the user to press any key.
  (kill-emacs))                                      ;; Close Emacs after installation is complete.


(provide 'init)
;;; init.el ends here
