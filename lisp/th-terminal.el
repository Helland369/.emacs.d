;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Configuration for terminals inside of Emacs.
;;; Code:

(defvar th/shell-path (getenv "SEHLL")
  "Get path to shell, this makes things easier on Guix.")

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
  (term (getenv "SHELL")))

(use-package shell
  :ensure nil
  :config
  (setq explicit-shell-file-name th/shell-path))

(provide 'th-terminal)
;;; th-terminal.el ends here
