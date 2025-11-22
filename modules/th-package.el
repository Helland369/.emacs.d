;; -*- lexical-binding: t; -*-
;;; Commentary:
;;; Config related to use-package
;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(setq package-enable-at-startup nil)

(provide 'th-package)
;;; th-package.el ends here
