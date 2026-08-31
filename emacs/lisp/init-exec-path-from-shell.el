;;; -*- lexical-binding: t -*-
(use-package exec-path-from-shell
    :straight t
    :config
    (when (daemonp)
      (exec-path-from-shell-initialize))
    )

(provide 'init-exec-path-from-shell)
;;; init-exec-path-from-shell.el ends here
