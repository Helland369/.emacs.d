;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Key bindings that is not evil related.
;;; Code:

;; zoom in
(global-set-key ["C-+"] 'text-scale-increase)
;; zoom out
(global-set-key ["C--"] 'text-scale-decrease)

(global-set-key ["C-x C-b"] 'ibuffer)

(provide 'th-keys)
;;; th-keys.el ends here
