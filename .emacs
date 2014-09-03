(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

; start auto-complete with emacs
(require 'auto-complete)

; do default config for auto-complete
(require 'auto-complete-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)
(define-key global-map (kbd "C-c g") 'helm-google-suggest)

(elpy-enable)

(ac-config-default)
(global-linum-mode 1)
(transient-mark-mode 1)
