;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to evil mode
;;; Code:

(use-package evil
  :init
  (setq evil-respect-visual-line-mode t
	evil-want-integration t
	evil-want-keybinding nil
	evil-vsplit-window-right t
	evil-split-window-below t
	evil-disable-insert-state-bindings t)
  :config
  (evil-set-undo-system 'undo-redo)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(define-prefix-command 'th-leader-map)

(keymap-set evil-motion-state-map "SPC" 'th-leader-map)
(keymap-set evil-normal-state-map "SPC" 'th-leader-map)

(evil-define-key nil th-leader-map
  "bb" 'consult-bookmark
  "bi" 'ibuffer
  "ca" 'calc
  "dd" 'dired
  "df" 'ediff-files
  "dF" 'ediff-files3
  "es" 'eshell
  "ev" 'eval-buffer
  "gg" 'magit-status
  "ha" 'hs-show-all
  "hb" 'hs-hide-block
  "hm" 'hs-minor-mode-menu
  "ho" 'hs-show-block
  "hs" 'hs-minor-mode
  "ib" 'switch-to-buffer
  "lc" 'lsp-execute-code-action
  "lD" 'lsp-ui-doc-show
  "lf" 'lsp-format-region
  "lF" 'lsp-format-buffer
  "ii" 'consult-imenu
  "lI" 'lsp-ui-imenu
  "ld" 'lsp-ui-peek-find-definitions
  "li" 'lsp-ui-peek-find-implementation
  "lr" 'lsp-ui-peek-find-references
  "lR" 'lsp-rename
  "oa" 'org-agenda
  "oh" 'org-html-export-to-html
  "om" 'org-md-export-to-markdown
  "ot" 'org-set-tags-command
  "ss" 'shell
  "w=" 'count-words
  "xd" 'xref-find-defenitions)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; TODO does this shit work ?????
(defun th/recenter-after-scroll (&rest _)
 "Recenter screen after scrolling"
 (evil-scroll-line-to-center nil))

(advice-add 'evil-scroll-up :after #'th/recenter-after-scroll)
(advice-add 'evil-scroll-down :after #'th/recenter-after-scroll)
(advice-add 'evil-scroll-page-up :after #'th/recenter-after-scroll)
(advice-add 'evil-scroll-page-down :after #'th/recenter-after-scroll)

(provide 'th-evil)
;;; th-evil.el ends here
