;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Misc config I dont know where else to place
;;; Code:

;; Show what key to press
(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

;; Better undo/redo
(use-package vundo
  :bind
  ("C-x u" . vundo))

;; Multiple cursors is fun
(use-package multiple-cursors
  :ensure t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)
   ("C-c s" . mc/mark-all-like-this-dwim)))

;; Use aspell for spell checking
(use-package ispell
  :ensure nil
  :config
  (setq-default ispell-program-name "aspell"))

;; Make sure you spell correctly
(use-package flyspell
  :ensure nil
  :hook
  ((text-mode . flyspell-mode)
   (org-mode  . flyspell-mode)
   (prog-mode . flyspell-prog-mode)))
  :custom
  (custom-set-faces
   '(flyspell-incorrect ((t (:underline (:style wave :color "red"))))))

;; Deal with trailing white space
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default show-trailing-whitespace t)

;; Use pandoc for preview in emacs. C-c C-c l for preview in emacs.
(use-package markdown-mode
  :ensure t)

(provide 'th-misc)
;;; th-misc.el ends here
