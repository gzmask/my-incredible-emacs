; theme
(load-theme 'manoj-dark t)

; marmalade melpa
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


; evil plugin
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; command map
(define-key evil-normal-state-map ";" 'evil-ex)

; chord plugin
(add-to-list 'load-path "~/.emacs.d/key-chord")
(require 'key-chord)
(key-chord-mode 1)

; php plugin
(add-to-list 'load-path "~/.emacs.d/php-mode")
(require 'php-mode)

; esc map
(key-chord-define evil-insert-state-map ",," 'evil-normal-state)
(key-chord-define evil-normal-state-map ",," (kbd "<escape>"))
(key-chord-define evil-visual-state-map ",," 'evil-normal-state)

; scroll
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)

; indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
