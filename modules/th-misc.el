;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Misc config I dont know where else to place
;;; Code:

(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package vundo
  :bind
  ("C-x u" . vundo))

(provide 'th-misc)
;;; th-misc.el ends here
