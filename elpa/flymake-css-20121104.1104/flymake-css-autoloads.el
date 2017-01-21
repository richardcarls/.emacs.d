;;; flymake-css-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (flymake-css-load flymake-css-lint-command) "flymake-css"
;;;;;;  "flymake-css.el" (22261 50305 88989 999000))
;;; Generated autoloads from flymake-css.el

(defvar flymake-css-lint-command "csslint" "\
Name (and optionally full path) of csslint executable.")

(custom-autoload 'flymake-css-lint-command "flymake-css" t)

(autoload 'flymake-css-load "flymake-css" "\
Configure flymake mode to check the current buffer's css syntax.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("flymake-css-pkg.el") (22261 50305 95818
;;;;;;  303000))

;;;***

(provide 'flymake-css-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flymake-css-autoloads.el ends here