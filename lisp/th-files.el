;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to files: Dired, ediff, etc
;;; Code:

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind ("C-x C-j" . dired-jump))

(provide 'th-files)
;;; th-files.el ends here
