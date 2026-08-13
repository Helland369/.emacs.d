;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Key bindings that is not evil related.
;;; Code:

;; zoom in
(global-set-key ["C-+"] 'text-scale-increase)
;; zoom out
(global-set-key ["C--"] 'text-scale-decrease)

;; change buffer
(global-set-key ["C-x C-b"] 'ibuffer)

(global-set-key ["C-,"] 'duplicate-line)

;; move forward within symbols, eg; "", ()
;; the reverse would be backward-up-list bound to C-M-u
(global-set-key ["C-M-m"] 'up-list)

;; enable/disable tab bar
(global-set-key ["C-c t b"] 'tab-bar-mode)

(defun th/scroll-half-page-down ()
  "Scroll half page down and center cursor."
  (interactive)
  (let ((ln (line-number-at-pos (point)))
        (lmax (line-number-at-pos (point-max))))
    (cond ((= ln 1) (move-to-window-line nil))
          ((= ln lmax) (recenter (window-end)))
          (t (progn
               (move-to-window-line -1)
               (recenter))))))

(defun th/scroll-half-page-up ()
  "Scroll half page up and center cursor."
  (interactive)
  (let ((ln (line-number-at-pos (point)))
        (lmax (line-number-at-pos (point-max))))
    (cond ((= ln 1) nil)
          ((= ln lmax) (move-to-window-line nil))
          (t (progn
               (move-to-window-line 0)
               (recenter))))))

(global-set-key ["M-v"] 'th/scroll-half-page-down)
(global-set-key ["C-v"] 'th/scroll-half-page-up)

(provide 'th-keys)
