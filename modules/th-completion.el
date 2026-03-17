;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config That is related to vertico: M-x menu, find file, search buffer, etc
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
  (completion-category-overrides
   '((file (styles partial-completion))
     (lsp-capf (styles basic orderless)))))

(setq completion-ignore-case t)

(use-package consult
  :ensure t
  :custom
  (consult-preview-key nil)
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)
   ("C-c k" . consult-kmacro)
   ("C-c m a" . consult-man)
   ("C-x p b" . consult-project-buffer)
   ("C-x 4 b" . consult-buffer-other-window)
   ("C-x 5 b" . consult-buffer-other-frame)
   ("C-c M-x" . consult-mode-command)
   ("M-s g" . consult-grep)
   ("M-s r" . consult-ripgrep)
   ("M-g i" . consult-imenu)
   ("M-g I" . consult-imenu-multi)
   ("M-g m" . consult-mark)
   ("M-g k" . consult-global-mark)
   ("M-g g" . consult-goto-line)))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package embark
  :after vertico
  :ensure t
  :bind
  (("C-." . embark-act)
   ("M-." . embark-dwim)))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package corfu
  :ensure t
  :config
  (global-corfu-mode 1)
  :custom
  (completion-cycle-threshold nil)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.2)
  (corfu-min-width 80)
  (corfu-max-width corfu-min-width)
  (corfu-cycle t)
  (corfu-auto t))

(use-package corfu-terminal
  :ensure t
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode 1)))

;; completion for regular text e.g org-mode
(use-package cape
  :ensure t
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-dict)
  (add-hook 'completion-at-point-functions #'cape-file)
  :config
  (setq cape-dict-file "/usr/share/dict"))

(setq dabbrev-ignore-case t
      dabbrev-check-other-buffers t
      dabbrev-upcase-means-case-search t)

(provide 'th-completion)
;;; th-vertico.el ends here

