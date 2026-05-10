;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; treesit/treesitter related config.  Requiers tresitter installed on your computer.
;;; Code:

(require 'treesit)

;; Run M-x treesit-install-language-gramnar
;; to install the colors for treesit
(setq treesit-language-source-alist
      '((cmake "https://github.com/uyha/tree-sitter-cmake")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        ;; (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        ;; (c "https://github.com/tree-sitter/tree-sitter-c")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
        (c-sharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
        (bash "https://github.com/tree-sitter/tree-sitter-bash/")))

;; (use-package treesit-auto
;;   :ensure t)

;;; maximum colours
(setq treesit-font-lock-level 4)

;;; remap the major modes to ts modes
(setq major-mode-remap-alist
      '((html-mode    . html-ts-mode)
        (css-mode     . css-ts-mode)
        (js-mode      . js-ts-mode)
        (js-json-mode . json-ts-mode)))

;; these ts modes are broken after emacs 30.2
;; (c++-mode     . c++-ts-mode)
;; (c-mode       . c-ts-mode)

;;; Configure the ts modes
;;; if ensure nil, the mode is allready included in Emacs 30+

(use-package cmake-ts-mode
  :ensure nil
  :mode (("\\CMakeLists.txt\\'" . cmake-ts-mode)
         ("\\.cmake\\'"         . cmake-ts-mode)))

(use-package json-ts-mode
  :ensure nil
  :mode (("\\.json\\'" . json-ts-mode)
         ("\\.jsonc\\'" . json-ts-mode)
         ("\\.jsonl\\'" . json-ts-mode)))

(use-package go-ts-mode
  :ensure nil
  :mode ("\\.go\\'" . go-ts-mode)
  :config
  (setq go-ts-mode-indent-offset 2))

(use-package html-ts-mode
  :ensure nil
  :mode ("\\.html\\'" . html-ts-mode))

(use-package css-ts-mode
  :ensure nil
  :mode ("\\.css\\'" . css-ts-mode))

(use-package js-ts-mode
  :ensure nil
  :mode (("\\.js\\'"  . js-ts-mode)
         ("\\.jsx\\'" . js-ts-mode)))

;; c and c++ ts mode broke in emacs 30.2
;; (use-package c-ts-mode
;;   :ensure nil
;;   :mode (("\\.c\\'" . c-ts-mode)
;;          ("\\.h\\'" . c-ts-mode)))

;; (use-package c++-ts-mode
;;   :ensure nil
;;   :mode (("\\.cpp\\'" . c++-ts-mode)
;;          ("\\.hpp\\'" . c++-ts-mode)))

(use-package csharp-ts-mode
  :ensure nil
  :mode ("\\.cs\\'" . csharp-ts-mode))

;; Use bash-ts-mode if the file is bash, else use sh-mode
(use-package sh-script
  :ensure nil
  :config
  (when (treesit-available-p)
    (setq major-mode-remap-alist
          (append '((sh-mode . bash-ts-mode))
                  major-mode-remap-alist))))

(provide 'th-treesit)
;;; th-treesit.el ends here
