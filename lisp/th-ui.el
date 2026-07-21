;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to ui elements: font-symbls, etc
;;; Code:

(defun th/setup-prettify-symbols ()
  "Set the symbols to pretify."
  (interactive)
  (setq prettify-symbols-alist
        '(("!=" . ?≠)
          ("=>" . ?󰘧)
          ("<=" . ?≤)
          (">=" . ?≥)
          ("lambda" . ?󰘧)))
  (prettify-symbols-mode 1))

(add-hook 'prog-mode-hook #'th/setup-prettify-symbols)

(use-package popper
  :ensure t
  :bind (("C-c p o" . popper-toggle)
         ("C-c p p" . popper-toggle-type)
         ("C-c p n" . popper-cycle))
  :init
  (setq popper-reference-buffers
        '(eat-mode
          term-mode
          eshell-mode
          grep-mode
          geiser-repl-mode
          sly-mrepl-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

(provide 'th-ui)
;;; th-ui.el ends here
