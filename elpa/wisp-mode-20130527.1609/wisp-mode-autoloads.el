;;; wisp-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (wisp-mode/compile wisp-mode) "wisp-mode" "wisp-mode.el"
;;;;;;  (20913 28383 0 0))
;;; Generated autoloads from wisp-mode.el

(autoload 'wisp-mode "wisp-mode" "\
Major mode for Wisp

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.wisp\\'" 'wisp-mode))

(autoload 'wisp-mode/compile "wisp-mode" "\
Invoke the Wisp compiler for the current buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("wisp-mode-pkg.el") (20913 28383 760004
;;;;;;  0))

;;;***

(provide 'wisp-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; wisp-mode-autoloads.el ends here
