;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to development: git, linting, etc
;;; Code:

(use-package magit
  :ensure t
  :custom
  (magit-auto-revert-mode 1))

(use-package git-modes
  :ensure t)

;; See todos in magit
(use-package magit-todos
  :ensure t
  :after magit
  :config
  (setq magit-todos-keywords '("TODO" "FIXME" "DEBUG" "HACK"))
  (magit-todos-mode 1))

;; Highlight TODO FIXME DEBUG HACK in comments
(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"  . "#FF0000")
          ("FIXME" . "#FF0000")
          ("DEBUG" . "#A020F0")
          ("HACK"  . "#E8B71A"))))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs (list (expand-file-name "snippets" user-emacs-directory)))
  (yas-global-mode 1))

;; js
(use-package prettier-js
  :ensure t
  :hook (js-ts-mode . prettier-js-mode)
  :config
  (setq prettier-js-args '("--tab-width" "2")))

;; I've tried different things, but this works for setting
;; js-ts-mode indent level...
(setq js-indent-level 2)

;; common-lisp
(use-package sly
  :ensure t
  :init
  (setq inferior-lisp-program "/usr/bin/sbcl")
  :hook
  (lisp-mode . sly-mode))

;; guile scheme
(use-package geiser-guile
  :ensure t)

(use-package geiser
  :ensure t
  :hook (scheme-mode . geiser-mode)
  :config
  (setq geiser-guile-binary "/usr/bin/guile")
  (setq geiser-scheme-implementation '(guile)))

(provide 'th-dev)
;;; th-dev.el ends here
