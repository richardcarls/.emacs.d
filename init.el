;;; init.el --- emacs 24.5.1

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

;; Disable splash/startup buffer
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Disable dialogs in GUI
(setq use-dialog-box nil)

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
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.socket\\'" . systemd-mode))

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
 '(custom-enabled-themes nil)
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd dockerfile-hadolint elixir-dogma emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-standard javascript-eslint javascript-jshint javascript-gjslint javascript-jscs json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing protobuf-protoc pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust scala scala-scalastyle scheme-chicken scss-lint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
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
    (dracula-theme flycheck expand-region color-theme-modern color-theme-approximate scss-mode dockerfile-mode php-mode ac-php json-reformat web-mode solarized-theme tern tern-auto-complete jinja2-mode js2-mode markdown-mode mustache-mode multi-web-mode flycheck-tip autumn-light-theme color-theme hydandata-light-theme frame-restore multi-term syslog-mode flx-ido itail yaml-mode pastelmac-theme neotree magit projectile jsx-mode json-mode js-doc flyparens flymake-yaml flymake-sass flymake-json flymake-jslint flymake-jshint flymake-css ac-js2 ac-html)))
 '(standard-indent 2)
 '(term-default-bg-color nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-very-old-color nil)
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
 '(web-mode-script-padding 2)
 '(web-mode-style-padding 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term ((t (:inherit default :background "black" :foreground "#839496"))))
 '(web-mode-html-tag-bracket-face ((t nil))))

(provide 'init)
;;; init.el ends here
