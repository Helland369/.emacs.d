;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; lsp-mode plists
(setenv "LSP_USE_PLISTS" "true")

;; temporarily set massive GC for faster startup
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; lower GC and set it to 100MB for better LSP performance
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 100 1024 1024) ;; 100MB
                  gc-cons-percentage 0.1)))

;; Increase process output pipes
(setq read-process-output-max (* 1024 1024)) ;; 1MB

;; set font and font size
(set-face-attribute 'default nil
		    :family "Iosevka"
		    :height 120)

;; Turn off ui elements
(setq default-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (vertical-scroll-bars . nil)))

;; set theme
(load-theme 'modus-vivendi-deuteranopia t)

(provide 'early-init)
;;; early-init.el ends here
