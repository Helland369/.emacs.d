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

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (global-company-mode 1)
  (setq company-format-margin-function #'company-vscode-dark-icons-margin))

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

(provide 'th-dev)
;;; th-dev.el ends here
