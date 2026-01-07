;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to email
;;; Code:

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(use-package mu4e
  :ensure nil
  ;;  :commands (mu4e mu4e-compose-new)
  :bind (("C-c m m" . mu4e)
         ("C-c m c" . mu4e-compose-new)
         ("C-c m s" . mu4e-update-mail-and-index))
  :config
  (setq mu4e-change-filenames-when-moving t
        mu4e-update-interval (* 10 60)
        mu4e-compose-format-flowed t
        mu4e-get-mail-command "mbsync -a"
        mu4e-maildir "~/Mail/proton"

        ;; relative to mu4e-maildir
        mu4e-drafts-folder "/Drafts"
        mu4e-sent-folder "/Sent"
        mu4e-refile-folder "/All Mail"
        mu4e-trash-folder "/Trash"

        message-send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server "127.0.0.1"
        smtpmail-smtp-service 1025
        smtpmail-stream-type 'starttls
        smtpmail-debug-info t
        smtpmail-debug-verb t))

(setq user-full-name "Thomas Helland"
      user-mail-address "thomas_helland@pm.me")

(setq auth-sources '(".authinfo"))
(setq smtpmail-auth-supported '(plain login))

(use-package mu4e-alert
  :ensure t
  :after mu4e
  :config
  (mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display)
  (mu4e-alert-set-default-style 'notifications)
  (mu4e-alert-enable-mode-line-display))

(use-package org-msg
  :ensure t
  :after mu4e
  :config
  (setq mail-user-agent 'mu4e-user-agent
        org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
        org-msg-startup "hidestars indent inlineimages"
        org-msg-default-alternatives '((new . (text html))
                                       (reply-to-htlm . (text html))
                                       (reply-to-text . (text)))
        org-msg-convert-citation t)
  (org-msg-mode))

(provide 'th-mail)
;;; th-mail.el ends here
