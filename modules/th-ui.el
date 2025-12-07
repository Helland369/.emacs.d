;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to ui elemente: theme, font-symbls, etc
;;; Code:

(use-package autothemer
  :ensure t)

(load-theme 'kanagawa t)

(defun th/setup-prettify-symbols ()
  (interactive)
  "Set the symbols to pretify."
  (setq prettify-symbols-alist
        '(("!=" . ?≠)
          ("==" . ?≡)
          ("=>" . ?󰘧)
          ("<=" . ?≤)
          (">=" . ?≥)
          ("lambda" . ?󰘧)))
  (prettify-symbols-mode 1))

(add-hook 'prog-mode-hook #'th/setup-prettify-symbols)


(provide 'th-ui)
;;; th-ui.el ends here
