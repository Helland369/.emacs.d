;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c--mode      . lsp-mode)
  (c++-mode     . lsp-mode)
  (csharp-mode  . lsp-mode)
  (js-ts-mode   . lsp-mode)
  (html-ts-mode . lsp-mode)
  (css-ts-mode  . lsp-mode)
  (go-ts-mode   . lsp-mode)
  (nxml-mode    . lsp-mode)
  :commands lsp
  :config
  (setq lsp-inlay-hint-enable t
        lsp-eldoc-enable-hover nil
        lsp-eldoc-render-all nil
        eldoc-echo-area-use-multiline-p nil
        lsp-lens-enable t
        lsp-modeline-diagnostics-enable t
        lsp-signature-auto-activate t
        lsp-signature-render-documentation t
        lsp-restart 'auto-restart
        lsp-enable-file-watchers t
        lsp-enable-symbol-highlighting t
        lsp-use-plists t)
  :custom
  ;; (setq lsp-csharp-omnisharp-roslyn-binary-path "/usr/bin/omnisharp")
  (setq lsp-completion-provider :none
        lsp-auto-import t
        lsp-completion-show-detail t
        lsp-completion-show-kind t))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-update-mode 'line
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-diagnostic-max-lines 3
        lsp-ui-sideline-diagnostic-max-line-length 60
        lsp-ui-doc-enable nil
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-doc-side 'right
        lsp-ui-doc-position 'at-point)
  :custom
    (with-eval-after-load 'lsp-ui
    (define-key lsp-ui-mode-map [remap xref-find-defenitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))
    (setq lsp-ui-sideline-margin 0)
  :bind
  (("C-c l D" . lsp-ui-doc-show)
   ("C-c l I" . lsp-ui-imenu)
   ("C-c l d" . lsp-ui-peek-find-defenition)))

;; python
(use-package lsp-pyright
  :ensure t
  :init
  (setq lsp-pyright-langserver-command "basedpyright")
  :config
  (setq lsp-pyright-type-checking-mode "standard"
        lsp-pyright-basedpyright-inlay-hints-variable-types t
        lsp-pyright-basedpyright-inlay-hints-call-argument-names t
        lsp-pyright-basedpyright-inlay-hints-function-return-types t)
  :hook
  (python-ts-mode . (lambda ()
                      (require 'lsp-pyright)
                      (lsp-deferred))))


(provide 'th-lsp)
;;; th-lsp.el ends here
