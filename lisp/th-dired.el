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


(provide 'th-dired)
;;; th-dired.el ends here
