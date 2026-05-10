;;; Commentary:
;;; Code:

(set-face-attribute 'default nil
		    :family "Iosevka Nerd Font"
		    :height 120)

;; Turn off anoying stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Indentation
(setq-default indent-tabs-mode nil
              tab-width 2)

;; Line numbers
(use-package display-line-numbers
  :ensure nil
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)
  (global-visual-line-mode t))

;; Column numbers
(column-number-mode t)

;; Auto pair symbols, like ", (, {, etc
(electric-pair-mode 1)

;; Save cursor possition
(save-place-mode 1)

;; Save minibuffer history
(savehist-mode 1)

;; Enable mouse in terminal emacs
(xterm-mouse-mode 1)

;; No default startup screen
(setq inhibit-startup-screen t)

;; No backup file
(setq make-backup-files nil)

;; Update file in buffer when it changes on disc
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(setq auto-revert-use-notify t)

;; Move custom-file out of init.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Set startup buffer
(setq initial-buffer-choice "~/org/agenda/todo.org")

;; Make upcase work (C-x C-u)
(put 'upcase-region 'disabled nil)

;; Make downcase work (C-x C-l)
(put 'downcase-region 'disabled nil)

;; Add the theme to a list so emacs can find it
(add-to-list 'custom-theme-load-path
	     (expand-file-name "themes" user-emacs-directory))

;; Add the rest of the config to a list so that emacs can find it
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'th-package)
(require 'th-keys)
(require 'th-files)
(require 'th-completion)
(require 'th-ui)
(require 'th-dev)
(require 'th-misc)
(require 'th-treesit)
(require 'th-org)
(require 'th-lsp)
(require 'th-terminal)
(require 'th-mail)

;;; init.el ends here
