;;; -*- lexical-binfing: t; -*-
;;; Commentary:
;;; Config related to org-mode
;;; Code:

(use-package org
  :ensure nil
  :config
  ;; set org directory
  (setq org-directory "~/org"))

(use-package org-agenda
  :ensure nil
  :custom
  ;; path to todo file
  (setq ord-agenda-files "~/org/agenda/todo.org"))

;;; make org-mode look good.
(use-package org-modern
  :ensure t
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

  (with-eval-after-load 'org
    (global-org-modern-mode))

;;; make the calendar start on monday
(setq calendar-week-start-day 1)

(with-eval-after-load 'org
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2)))

(provide 'th-org)
;;; th-org.el ends here
