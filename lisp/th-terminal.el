;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Configuration for terminals inside of Emacs.
;;; Code:

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell "zsh"
        vterm-max-scrollback 10000
        vterm-always-compile-module t))

(use-package eat
  :ensure t)

(use-package term
  :ensure nil
  :config
  (setq explicit-shell-file-name "/bin/zsh"))

(defun th/term ()
  "Run term without promting for shell."
  (interactive)
  (term "/bin/zsh"))

(use-package shell
  :ensure nil
  :config
  (setq explicit-shell-file-name "/bin/zsh"))

(provide 'th-terminal)
;;; th-terminal.el ends here
