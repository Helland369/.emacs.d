;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config that is related to vertico: M-x meny, find file, search buffer, etc
;;; Code:

(use-package vertico
  :ensure t
  :bind (:map vertico-map
	      ("C-b" . vertico-directory-up))
  :config
  (require 'vertico-directory)
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-override
   '((file (styles partial-completion))))
 (orderless-matching-styles '(orderless-flex orderless-literal)))

(use-package consult
  :ensure t
  :custom
  (consult-preview-key nil)
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package embark
  :after vertico
  :ensure t
  :bind
  (("C-." . embark-act)
   ("M-." . embark-dwin)))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package corfu
  :ensure t
  :hook
  (prog-mode . corfu-mode)
  :config
  (global-corfu-mode 1)
  :custom
  (completion-cycle-threshold nil)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.2)
  (corfu-min-width 80)
  (corfu-max-width corfu-min-width)
  (corfu-cycle nil)
  (corfu-auto t))

(use-package corfu-terminal
  :ensure t
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode 1)))

(provide 'th-completion)
;;; th-vertico.el ends here

