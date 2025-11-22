;;; -*- lexical-binfing: t; -*-
;;; Commentary:
;;; Config related to org-mode
;;; Code:

(setq org-directory "~/org")

;;; make org-mode look good.
(use-package org-modern
  :ensure t
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

  (with-eval-after-load 'org
    (global-org-modern-mode))

;;; make the calendar normal
(setq calendar-week-start-day 1)

;;; todo file
(setq ord-agenda-files "~/org/agenda/todo.org")

(setq org-tag-alist '(
                      ("home" . ?H)
                      ("school" . ?S)
                      ("programming" . ?P)))

(with-eval-after-load 'org
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2)))

(provide 'th-org)
;;; th-org.el ends here
