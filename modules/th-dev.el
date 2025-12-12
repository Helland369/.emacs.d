;; -*- lexical-binfing: t; -*-
;;; Commentary:
;;; Config related to development: git, linting, etc
;;; Code:

(use-package magit
  :custom
  (magit-auto-revert-mode 1))

(use-package git-modes)

(use-package magit-todos
  :after magit)

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yasnippet
  :config
  (yas-global-mode))

;; js
(use-package prettier-js
  :ensure t
  :hook (js-ts-mode . prettier-js-mode)
  :config
  (setq prettier-js-args '("--tab-width" "2")))

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
