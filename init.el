;;; init.el --- rick's config
;;; Commentary:
;;; Code:
(set-language-environment 'utf-8)

;; editor
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1) ;; giant gui toolbar
(setq gc-cons-threshold 50000000) ;; 50MB

(line-number-mode t)
(column-number-mode t)
(blink-cursor-mode -1)

(when (>= emacs-major-version 24) (electric-pair-mode 1))
(show-paren-mode 1)


(setq-default tab-width 4)
(setq-default indent-line-function 4)
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)

(setq require-final-newline t)

;; backup / auto-save
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; package archives
(require 'package)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; global modes
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs empty trailing lines-tail))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

(require 'yasnippet)
(add-hook 'after-init-hook 'yas-global-mode)

(require 'eldoc)
(add-hook 'after-init-hook 'global-eldoc-mode)

;; lsp
(require 'lsp-mode)
(setq lsp-prefer-flymake nil)
(setq-default company-lsp-filter-candidates t)
(setq-default company-lsp-match-candidate-predicate 'company-lsp-match-candidate-prefix)

;; misc
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; javascript
(add-hook 'js2-mode-hook 'lsp)

;; rust
(add-hook 'rust-mode-hook 'lsp)
;;(add-hook 'rust-mode-hook #'racer-mode)
;;(add-hook 'racer-mode-hook #'eldoc-mode)

;; c++
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(setq-default c-basic-offset 4)
(setq-default c-offsets-alist '((arglist-intro    . +)
                                (arglist-close    . 0)
                                (brace-list-intro . +)
                                (statement-case-intro . 0)
                                (case-label       . +)
                                (inlambda         . 0)
                                (innamespace      . 0)))

(require 'cquery)
(setq cquery-executable "/usr/bin/cquery")

;; customizations
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zerodark)))
 '(custom-safe-themes
   (quote
    ("1068ae7acf99967cc322831589497fee6fb430490147ca12ca7dd3e38d9b552a" "e39ff005e524c331b08d613109bff0b55fc21c64914c4a243faa70f330015389" "08ef1356470a9d3bf363ffab0705d90f8a492796e9db489936de4bde6a4fdb19" default)))
 '(package-selected-packages
   (quote
    (js2-mode shell-pop expand-region dap-mode lsp-treemacs flymake flycheck-clang-analyzer flycheck-clang-tidy flycheck-clangcheck yasnippet helm-lsp lsp-ui cmake-mode company-lsp cquery lsp-mode flycheck company-c-headers cargo projectile zerodark-theme company-glsl company-racer company racer rust-mode)))
 '(shell-pop-autocd-to-working-dir nil)
 '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
 '(shell-pop-universal-key "C-`")
 '(shell-pop-window-position "bottom"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;;; init.el ends here
