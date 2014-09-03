;;; javaimp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (javaimp-reset javaimp-forget-all-visited-modules
;;;;;;  javaimp-invalidate-jar-classes-cache javaimp-organize-imports
;;;;;;  javaimp-add-import javaimp-maven-visit-root) "javaimp" "javaimp.el"
;;;;;;  (21481 16429 0 0))
;;; Generated autoloads from javaimp.el

(autoload 'javaimp-maven-visit-root "javaimp" "\


\(fn PATH)" t nil)

(autoload 'javaimp-add-import "javaimp" "\
Imports CLASSNAME in the current file.  Interactively,
performs class name completion based on the current module's
dependencies, JDK jars and top-level classes in the current
module.

\(fn CLASSNAME)" t nil)

(autoload 'javaimp-organize-imports "javaimp" "\
Groups and orders import statements in the current buffer.  Groups are
formed and ordered according to `javaimp-import-group-alist'.  Classes within a
single group are ordered in a lexicographic order. Optional NEW-CLASSES
argument is a list of additional classes to import.

\(fn &rest NEW-CLASSES)" t nil)

(autoload 'javaimp-invalidate-jar-classes-cache "javaimp" "\


\(fn)" t nil)

(autoload 'javaimp-forget-all-visited-modules "javaimp" "\


\(fn)" t nil)

(autoload 'javaimp-reset "javaimp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("javaimp-pkg.el") (21481 16429 623037
;;;;;;  0))

;;;***

(provide 'javaimp-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; javaimp-autoloads.el ends here
