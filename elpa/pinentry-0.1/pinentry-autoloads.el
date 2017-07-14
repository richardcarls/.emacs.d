;;; pinentry-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "pinentry" "pinentry.el" (22888 12210 0 0))
;;; Generated autoloads from pinentry.el

(autoload 'pinentry-start "pinentry" "\
Start a Pinentry service.

Once the environment is properly set, subsequent invocations of
the gpg command will interact with Emacs for passphrase input.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pinentry-autoloads.el ends here
