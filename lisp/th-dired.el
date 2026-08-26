;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to files: Dired, ediff, etc
;;; Code:

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind ("C-x C-j" . dired-jump)
  :config
  (setq dired-kill-when-opening-new-dired-buffer t
        dired-listing-switches "-agho --group-directories-first"))

(use-package diredfl
  :ensure t
  :config
  (diredfl-global-mode 1))

(use-package dired-preview
  :ensure t
  :config
  (dired-preview-global-mode t)
  (setq dired-preview-max-size 1000
        dired-preview-delay 0.2
        dired-preview-ignored-extensions-regexp
        (concat "\\."
                "\\(gz\\|"
                "zst\\|"
                "tar\\|"
                "xz\\|"
                "rar\\|"
                "zip\\|"
                "iso\\|"
                "epub"
                "\\)")))

(provide 'th-dired)
;;; th-dired.el ends here
