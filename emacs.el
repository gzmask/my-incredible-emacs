; scroll
(setq evil-want-C-u-scroll t)

; evil plugin
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; esc map
(define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)

; php mode
(add-to-list 'load-path "~/.emacs.d/php-mode")
(require 'php-mode)

