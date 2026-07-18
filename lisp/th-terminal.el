;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Configuration for terminals inside of Emacs.
;;; Code:

(defvar th/shell-path (getenv "SEHLL"))

(use-package vterm
  :ensure t
  :config
  (setq vterm-shell th/shell-path
        vterm-max-scrollback 10000
        vterm-always-compile-module t))

(use-package eat
  :ensure t
  :init
  (setq explicit-shell-file-name th/shell-path))

(use-package term
  :ensure nil
  :config
  (setq explicit-shell-file-name th/shell-path))

(defun th/term ()
  "Run term without promting for shell."
  (interactive)
  (term path-to-shell))

(use-package shell
  :ensure nil
  :config
  (setq explicit-shell-file-name th/shell-path))

(provide 'th-terminal)
;;; th-terminal.el ends here
