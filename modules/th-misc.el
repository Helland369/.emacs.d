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

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)
   ("C-c s" . mc/mark-all-like-this-dwim)))

(use-package ispell
  :ensure nil
  :config
  (setq-default ispell-program-name "aspell"))

(use-package flyspell
  :ensure nil
  :hook
  ((text-mode . flyspell-mode)
   (org-mode  . flyspell-mode))
  :custom
  (custom-set-faces
   '(flyspell-incorrect ((t (:underline (:style wave :color "red")))))))

(provide 'th-misc)
;;; th-misc.el ends here
