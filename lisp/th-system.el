;;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Operating system packages
;;; Code:

;; application launcher
(use-package xdg-launcher
  :ensure t
  :vc (:url "https://github.com/emacs-exwm/xdg-launcher"
            :rev :newest))

;; get the GNU/Linux distribution name
(defun th/get-gnu-linux-distro ()
  "Gets the distribution name of a GNU/Linux system."
  (when (eq system-type 'gnu/linux)
      (with-temp-buffer
        (when (ignore-errors (insert-file-contents "/etc/os-release"))
          (goto-char (point-min)))
        (when (re-search-forward "^PRETTY_NAME=\"?\\([^\"]+\\)\"?" nil t)
            (match-string 1)))))

;: load guix.el if system is a guix system
(when (string-equal (th/get-gnu-linux-distro) "Guix System")
  (use-package guix
    :ensure t))

  ;; (require 'guix nil t))

(provide 'th-system)
;;; th-system.el ends here
