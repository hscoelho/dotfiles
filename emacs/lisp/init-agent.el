;;; -*- lexical-binding: t -*-
(use-package agent-shell
    :straight t
    :after evil
    :config
    (evil-define-key 'insert agent-shell-mode-map (kbd "RET") #'newline)
    (evil-define-key 'normal agent-shell-mode-map (kbd "RET") #'comint-send-input)

    ;; C-n in agent-shell normal mode conflicts with my keybindings (it call the next input)
    ;; BTW, if this happens in another package, maybe using the following would be better:
    ;;(evil-define-key 'normal comint-mode-map (kbd "C-n") nil)
    ;; for now, let's fix it in agent-shell only
    (evil-define-key 'normal agent-shell-mode-map (kbd "C-n") nil)
    )

(provide 'init-agent)
;;; init-agent.el ends here
