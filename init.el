;;; init.el --- rick

;;; Commentary:
;; Dev config

;;; Code:

;; load-path
(add-to-list 'load-path
             (expand-file-name
              (concat user-emacs-directory "lisp")))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Turn off bell
(setq ring-bell-function 'ignore)

;;set all coding systems to utf-8
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Packages
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Manual package

;; Auto modes
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;; Keybindings
(global-set-key (kbd "C-c =") 'er/expand-region)
(global-set-key (kbd "C-c -") 'er/contract-region)


;; Customization
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(before-save-hook (quote (whitespace-cleanup)))
 '(blink-cursor-mode t)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(flycheck-disabled-checkers nil)
 '(flycheck-eslintrc ".eslintrc*")
 '(flycheck-global-modes t)
 '(global-auto-complete-mode t)
 '(global-flycheck-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote projectile-global-mode))
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-include-node-externs t)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (flycheck expand-region color-theme-modern color-theme-approximate scss-mode dockerfile-mode php-mode ac-php json-reformat web-mode solarized-theme tern tern-auto-complete jinja2-mode js2-mode markdown-mode mustache-mode multi-web-mode flycheck-tip autumn-light-theme color-theme hydandata-light-theme frame-restore multi-term syslog-mode flx-ido itail yaml-mode pastelmac-theme neotree magit projectile jsx-mode json-mode js-doc flyparens flymake-yaml flymake-sass flymake-json flymake-jslint flymake-jshint flymake-css ac-js2 ac-html)))
 '(web-mode-auto-close-style 1)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-indentation t)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-auto-quoting t)
 '(web-mode-enable-block-face t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 0)
 '(web-mode-style-padding 0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
