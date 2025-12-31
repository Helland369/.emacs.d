;;; Commentary:
;;; Code:

(set-face-attribute 'default nil
		    :family "Iosevka Nerd Font"
		    :height 120)

;; turn off anoying stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(global-visual-line-mode t)
(setq column-number-mode t)

;; auto pair symbols, like ", (, {, etc
(electric-pair-mode 1)

;; no backup file
(setq make-backup-files nil)

;; save cursor possition
(save-place-mode 1)

;; no default startup screen
(setq inhibit-startup-screen t)

;; update file in buffer when it changes on disc
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(setq auto-revert-use-notify t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq initial-buffer-choice "~/org/agenda/todo.org")

;; add the theme to a list so emacs can find it
(add-to-list 'custom-theme-load-path
	     (expand-file-name "themes" user-emacs-directory))

;; add the rest of the config to a list so that emacs can find it
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;; "import" the config files
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
