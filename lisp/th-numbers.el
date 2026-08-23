;;; -*- lexical-binding: t -*-
;; Commentary:
;; This file currently contains one function for
;; converting hex and/or binary numbers to western Arabic numerals.
;; Code:

(defun th/hex-or-bin-at-point-to-decimal ()
  "Show the decimal value of the 0x/0b literal under point."
  (interactive)
  (let* ((bounds (bounds-of-thing-at-point 'symbol))
         (str (and bounds (buffer-substring-no-properties (car bounds) (cdr bounds)))))
    (unless (and str (string-match "\\`0[xXbB][0-9a-fA-F]+\\'" str))
      (user-error "No hex or binary literal at point"))
    (message "%s = %d (decimal)" str
              (string-to-number (substring str 2)
                                (if (memq (downcase (aref str 1)) '(?x)) 16 2)))))

(global-set-key ["C-c h"] 'th/hex-or-bin-at-point-to-decimal)

(provide 'th-numbers)
;;; th-numbers.el ends here
