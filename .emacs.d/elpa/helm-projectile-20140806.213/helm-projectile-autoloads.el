;;; helm-projectile-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (helm-projectile) "helm-projectile" "helm-projectile.el"
;;;;;;  (21481 42909 0 0))
;;; Generated autoloads from helm-projectile.el

(autoload 'helm-projectile "helm-projectile" "\
Use projectile with Helm instead of ido.

With a prefix ARG invalidates the cache first.

\(fn &optional ARG)" t nil)

(eval-after-load 'projectile '(define-key projectile-command-map (kbd "h") 'helm-projectile))

;;;***

;;;### (autoloads nil nil ("helm-projectile-pkg.el") (21481 42909
;;;;;;  542691 0))

;;;***

(provide 'helm-projectile-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; helm-projectile-autoloads.el ends here
