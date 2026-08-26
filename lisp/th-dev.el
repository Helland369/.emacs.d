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
  (global-flycheck-mode)
  :config
  (global-flycheck-annotate-mode t))

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

(defvar th/sbcl-path (getenv "SBCL_PATH")
  "Get path to sbcl, this makes it easier on Guix.")

(use-package sly
  :ensure t
  :init
  (setq inferior-lisp-program th/sbcl-path)
  :hook
  (lisp-mode . sly-mode))

;; guile scheme
(use-package geiser-guile
  :ensure t)

(use-package geiser
  :ensure t
  :hook (scheme-mode . geiser-mode)
  :custom
  (let guile-path (getenv "GUILE_BIN_PATH"))
  (setq geiser-guile-binary guile-path))

;; protobuf
(use-package protobuf-mode
  :ensure t)

;; csharp
(use-package csproj-mode
  :ensure t)

;; Avalonia axaml
(add-to-list 'auto-mode-alist '("\\.[aa]xaml\\'" . nxml-mode ))

(provide 'th-dev)
;;; th-dev.el ends here
