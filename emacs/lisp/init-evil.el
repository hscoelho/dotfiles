(defun search-config()
  "Find file in config folder"
  (interactive)
  (consult-fd "~/.emacs.d"))

;; (defun ek/lsp-describe-and-jump ()
;; "Show hover documentation and jump to *lsp-help* buffer."
;; (interactive)
;; (lsp-describe-thing-at-point)
;; (let ((help-buffer "*lsp-help*"))
;;     (when (get-buffer help-buffer)
;;     (switch-to-buffer-other-window help-buffer))))

;; (require 'jieba)
(defun zh-utils--chinese-word-at-point ()
  "Return the most likely Chinese word at point."
  (let* ((p (point))
	 (seg (jieba-tokenize (buffer-substring-no-properties (point-min) (point-max))))
	 (word (car (seq-find (lambda (w)
				(> (car (last w)) (1- p)))
			      seg))))
    word))


(defun open-and-focus-help (content)
  "Open a help buffer containing CONTENT and focus to it."
  (let ((buf (get-buffer-create "*cc-cedict*")))
    (with-current-buffer buf
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert content)
        (goto-char (point-min))
        (setq buffer-read-only t)))
    (pop-to-buffer buf)))

(defun cc-edict-at-point ()
  "Look up Chinese word at cursor in CC-CEDICT."
  (interactive)
  (let ((word (zh-utils--chinese-word-at-point)))
    (if word
      (with-help-window "*cc-cedict*" (princ (cc-cedict word)))
      (message "No word at point")
    )
  )
)


(use-package evil
  :ensure t
  :straight t
  :defer
  :hook
  (after-init . evil-mode)
  :init
  (setq evil-want-integration t)      ;; Integrate `evil' with other Emacs features (optional as it's true by default).
  (setq evil-want-keybinding nil)     ;; Disable default keybinding to set custom ones.
  (setq evil-want-C-u-scroll t)       ;; Makes C-u scroll
  (setq evil-want-C-u-delete t)       ;; Makes C-u delete on insert mode
  :config
  (evil-set-undo-system 'undo-tree)   ;; Uses the undo-tree package as the default undo system

  ;; Set the leader key to space for easier access to custom commands. (setq evil-want-leader t)
  (setq evil-leader/in-all-states t)  ;; Make the leader key available in all states.
  (setq evil-want-fine-undo t)        ;; Evil uses finer grain undoing steps

  ;; Define the leader key as Space
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))

  (evil-define-key 'normal 'global (kbd "<leader> c") 'cc-edict-at-point)

  ;; Keybindings for searching and finding files.
  ;; Replace space f f with something like project-find-file but in command-line-default-directory
  (evil-define-key 'normal 'global (kbd "<leader> f f")
    (lambda () (interactive) (consult-fd command-line-default-directory)))
  (evil-define-key 'normal 'global (kbd "<leader> f d") 'find-file)
  (evil-define-key 'normal 'global (kbd "<leader> f g") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<leader> f G") 'consult-grep)
  (evil-define-key 'normal 'global (kbd "<leader> f h") 'consult-info)
  (evil-define-key 'normal 'global (kbd "<leader> f c") 'search-config)
  (evil-define-key 'normal 'global (kbd "<leader> /") 'consult-line)

  (evil-define-key 'normal 'global (kbd "<leader> j b") 'evil-jump-backward)
  (evil-define-key 'normal 'global (kbd "<leader> j f") 'evil-jump-forward)

  ;; Flymake navigation
  (evil-define-key 'normal 'global (kbd "<leader> x x") 'consult-flycheck);; Gives you something like `trouble.nvim'
  (evil-define-key 'normal 'global (kbd "] d") 'flymake-goto-next-error) ;; Go to next Flymake error
  (evil-define-key 'normal 'global (kbd "[ d") 'flymake-goto-prev-error) ;; Go to previous Flymake error

  ;; Dired commands for file management
  (evil-define-key 'normal 'global (kbd "<leader> e e") (lambda () (interactive) (dired command-line-default-directory)))
  (evil-define-key 'normal 'global (kbd "<leader> e j") 'dired-jump)
  (evil-define-key 'normal 'global (kbd "<leader> e f") 'find-file)
  (evil-define-key 'normal dired-mode-map "f" 'find-file)

  ;; Diff-HL navigation for version control
  (evil-define-key 'normal 'global (kbd "] c") 'diff-hl-next-hunk) ;; Next diff hunk
  (evil-define-key 'normal 'global (kbd "[ c") 'diff-hl-previous-hunk) ;; Previous diff hunk

  ;; Magit keybindings for Git integration
  (evil-define-key 'normal 'global (kbd "<leader> g g") 'magit-status)      ;; Open Magit status
  (evil-define-key 'normal 'global (kbd "<leader> g l") 'magit-log-current) ;; Show current log
  (evil-define-key 'normal 'global (kbd "<leader> g d") 'magit-diff-buffer-file) ;; Show diff for the current file
  (evil-define-key 'normal 'global (kbd "<leader> g D") 'diff-hl-show-hunk) ;; Show diff for a hunk
  (evil-define-key 'normal 'global (kbd "<leader> g b") 'vc-annotate)       ;; Annotate buffer with version control info

  ;; Buffer management keybindings
  (evil-define-key 'normal 'global (kbd "] b") 'switch-to-next-buffer) ;; Switch to next buffer
  (evil-define-key 'normal 'global (kbd "[ b") 'switch-to-prev-buffer) ;; Switch to previous buffer
  (evil-define-key 'normal 'global (kbd "<leader> b i") 'consult-buffer) ;; Open consult buffer list
  (evil-define-key 'normal 'global (kbd "<leader> b b") 'ibuffer) ;; Open Ibuffer
  (evil-define-key 'normal 'global (kbd "<leader> b d") 'kill-current-buffer) ;; Kill current buffer
  (evil-define-key 'normal 'global (kbd "<leader> b k") 'kill-current-buffer) ;; Kill current buffer
  (evil-define-key 'normal 'global (kbd "<leader> b x") 'kill-current-buffer) ;; Kill current buffer
  (evil-define-key 'normal 'global (kbd "<leader> b s") 'save-buffer) ;; Save buffer
  (evil-define-key 'normal 'global (kbd "<leader> b l") 'consult-buffer) ;; Consult buffer
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'consult-buffer) ;; Consult buffer
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'consult-buffer) ;; Consult buffer
  (evil-define-key 'normal 'global (kbd "C-n") 'consult-buffer) ;; Consult buffer

  ;; Project management keybindings
  (evil-define-key 'normal 'global (kbd "<leader> p b") 'consult-project-buffer) ;; Consult project buffer
  (evil-define-key 'normal 'global (kbd "<leader> p p") 'project-switch-project) ;; Switch project
  (evil-define-key 'normal 'global (kbd "<leader> p f") 'project-find-file) ;; Find file in project
  (evil-define-key 'normal 'global (kbd "<leader> p g") 'project-find-regexp) ;; Find regexp in project
  (evil-define-key 'normal 'global (kbd "<leader> p k") 'project-kill-buffers) ;; Kill project buffers
  (evil-define-key 'normal 'global (kbd "<leader> p D") 'project-dired) ;; Dired for project

  ;; Yank from kill ring
  ;; (evil-define-key 'normal 'global (kbd "P") 'consult-yank-from-kill-ring)
  (evil-define-key 'normal 'global (kbd "<leader> P") 'consult-yank-from-kill-ring)

  ;; Embark actions for contextual commands
  (evil-define-key 'normal 'global (kbd "<leader> .") 'embark-act)

  ;; Undo tree visualization
  (evil-define-key 'normal 'global (kbd "<leader> u") 'undo-tree-visualize)

  ;; Help keybindings
  (evil-define-key 'normal 'global (kbd "<leader> h m") 'describe-mode) ;; Describe current mode
  (evil-define-key 'normal 'global (kbd "<leader> h f") 'describe-function) ;; Describe function
  (evil-define-key 'normal 'global (kbd "<leader> h v") 'describe-variable) ;; Describe variable
  (evil-define-key 'normal 'global (kbd "<leader> h k") 'describe-key) ;; Describe key

  ;; Tab navigation
  (evil-define-key 'normal 'global (kbd "] t") 'tab-next) ;; Go to next tab
  (evil-define-key 'normal 'global (kbd "[ t") 'tab-previous) ;; Go to previous tab


  ;; Custom example. Formatting with prettier tool.
  (evil-define-key 'normal 'global (kbd "<leader> m p")
                   (lambda ()
                     (interactive)
                     (shell-command (concat "prettier --write " (shell-quote-argument (buffer-file-name))))
                     (revert-buffer t t t)))

  ;; LSP commands keybindings
  (evil-define-key 'normal lsp-mode-map
                   ;; (kbd "gd") 'lsp-find-definition                ;; evil-collection already provides gd
                   (kbd "grr") 'lsp-find-references                   ;; Finds LSP references
                   (kbd "<leader> c a") 'lsp-execute-code-action     ;; Execute code actions
                   (kbd "<leader> c r") 'lsp-rename                  ;; Rename symbol
                   (kbd "gI") 'lsp-find-implementation               ;; Find implementation
                   (kbd "<leader> l f") 'lsp-format-buffer)          ;; Format buffer via lsp

  (defun ek/lsp-describe-and-jump ()
    "Show hover documentation and jump to *lsp-help* buffer."
    (interactive)
    (lsp-describe-thing-at-point)
    (let ((help-buffer "*lsp-help*"))
      (when (get-buffer help-buffer)
        (switch-to-buffer-other-window help-buffer))))

  ;; Emacs 31 finaly brings us support for 'floating windows' (a.k.a. "child frames")
  ;; to terminal Emacs. If you're still using 30, docs will be shown in a buffer at the
  ;; inferior part of your frame.
  (evil-define-key 'normal 'global (kbd "K")
    (if (>= emacs-major-version 31)
        #'eldoc-box-help-at-point
        #'ek/lsp-describe-and-jump))

  ;; Commenting functionality for single and multiple lines
  (evil-define-key 'normal 'global (kbd "gcc")
                   (lambda ()
                     (interactive)
                     (if (not (use-region-p))
                         (comment-or-uncomment-region (line-beginning-position) (line-end-position)))))

  (evil-define-key 'visual 'global (kbd "gc")
                   (lambda ()
                     (interactive)
                     (if (use-region-p)
                         (comment-or-uncomment-region (region-beginning) (region-end)))))

  ;; Enable evil mode
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :straight t
  :after evil
  :config
  (setq evil-escape-key-sequence "jj")
  (setq evil-escape-delay 0.2)
  (push 'visual evil-escape-excluded-states)
  (evil-escape-mode 1))

;; EVIL COLLECTION
;; The `evil-collection' package enhances the integration of
;; `evil-mode' with various built-in and third-party packages. It
;; provides a better modal experience by remapping keybindings and
;; commands to fit the `evil' style.
(use-package evil-collection
  :defer t
  :straight t
  :ensure t
  :custom
  (evil-collection-want-find-usages-bindings t)
  ;; Hook to initialize `evil-collection' when `evil-mode' is activated.
  :hook
  (evil-mode . evil-collection-init))

;; EVIL SURROUND
;; The `evil-surround' package provides text object surround
;; functionality for `evil-mode'. This allows for easily adding,
;; changing, or deleting surrounding characters such as parentheses,
;; quotes, and more.
;;
;; With this you can change 'hello there' with ci'" to have
;; "hello there" and cs"<p> to get <p>hello there</p>.
;; More examples here:
;; - https://github.com/emacs-evil/evil-surround?tab=readme-ov-file#examples
(use-package evil-surround
  :ensure t
  :straight t
  :after evil-collection
  :config
  (global-evil-surround-mode 1))


;; EVIL MATCHIT
;; The `evil-matchit' package extends `evil-mode' by enabling
;; text object matching for structures such as parentheses, HTML
;; tags, and other paired delimiters. This makes it easier to
;; navigate and manipulate code blocks.
;; Just use % for jumping between matching structures to check it out.
(use-package evil-matchit
  :ensure t
  :straight t
  :after evil-collection
  :config
  (global-evil-matchit-mode 1))

(provide 'init-evil)
