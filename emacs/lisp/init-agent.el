;;; -*- lexical-binding: t -*-
(use-package agent-shell
    :straight t
    :after evil
    :config
    (evil-define-key 'insert agent-shell-mode-map (kbd "RET") #'newline)
    (evil-define-key 'normal agent-shell-mode-map (kbd "RET") #'comint-send-input)
    )

(provide 'init-agent)
;;; init-agent.el ends here
