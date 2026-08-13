;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Configuration for terminals inside of Emacs.
;;; Code:

(defvar th/shell-path (getenv "SEHLL")
  "Get path to shell, this makes things easier on Guix.")

(use-package eat
  :ensure t
  :bind ("C-c t e" . eat)
  :init
  (setq explicit-shell-file-name th/shell-path))

(use-package term
  :ensure nil
  :config
  (setq explicit-shell-file-name th/shell-path))

(defun th/term ()
  "Run term without promting for shell."
  (interactive)
  (term (getenv "SHELL")))

(global-set-key ["C-c t t"] 'th/term)

(use-package shell
  :ensure nil
  :bind ("C-c t s" . shell)
  :config
  (setq explicit-shell-file-name th/shell-path))

(use-package eshell
  :ensure nil
  :bind ("C-c t E" . eshell))

(provide 'th-terminal)
;;; th-terminal.el ends here
