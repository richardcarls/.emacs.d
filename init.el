;;; init.el --- rick's config
;;; Commentary:
;;; Code:
(set-language-environment 'utf-8)

;; editor
(setq inhibit-splash-screen 1)
(setq inhibit-startup-message 1)
(setq ring-bell-function 'ignore)
;;(tool-bar-mode -1) ;; giant gui toolbar
(setq gc-cons-threshold 50000000) ;; 50MB

(line-number-mode 1)
(column-number-mode 1)
(blink-cursor-mode -1)
(tab-bar-mode 1)

(when (>= emacs-major-version 24) (electric-pair-mode 1))
(show-paren-mode 1)

(when (>= emacs-major-version 26) (global-display-line-numbers-mode 1))

(setq-default tab-width 4)
(setq-default indent-line-function 4)
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)

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
(projectile-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq ido-enable-flex-matching 1)
(setq ido-everywhere 1)
(ido-mode 1)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'yasnippet)
(yas-global-mode)

(require 'eshell-toggle)
(setq eshell-toggle-size-fraction 4)
(setq eshell-toggle-run-command nil)
(global-set-key (kbd "C-`") 'eshell-toggle)

(require 'lsp)
(setq lsp-prefer-flymake nil)
(setq-default company-lsp-filter-candidates t)
(setq-default company-lsp-match-candidate-predicate 'company-lsp-match-candidate-prefix)

(require 'magit)
(global-set-key (kbd "C-g") 'magit-status)

;; web
;(setq-default lsp-html-server-command-args (list (substring (shell-command-to-string "which html-languageserver") 0 -1)))
                                        ;(setq-default lsp-html-server-command-args "html-languageserver")
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))
(add-hook 'html-mode-hook 'lsp)
(add-hook 'html-mode-hook #'(lambda nil (setq-default sgml-xml-mode 1)))
(add-hook 'javascript-mode 'lsp)

(require 'typescript-mode)
(add-hook 'typescript-mode-hook 'lsp)

;; rust
(require 'rust-mode)
(add-hook 'rust-mode-hook 'lsp)
(setq lsp-rust-analyzer-server-display-inlay-hints 1)
(setq lsp-rust-rls-server-command (list (substring (shell-command-to-string "rustup which rust-analyzer") 0 -1)))
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
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "86704574d397606ee1433af037c46611fb0a2787e8b6fd1d6c96361575be72d2" default))
 '(js-indent-level 2)
 '(lsp-rust-analyzer-server-display-inlay-hints t)
 '(package-selected-packages
   '(company lsp-mode rust-mode typescript-mode yasnippet xresources-theme web-mode projectile magit lsp-ui json-mode handlebars-sgml-mode flycheck-rust eshell-toggle cquery company-lsp company-emoji color-theme-sanityinc-tomorrow cargo)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;;; init.el ends here
