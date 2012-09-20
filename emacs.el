; evil plugin
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; chord plugin
(add-to-list 'load-path "~/.emacs.d/key-chord")
(require 'key-chord)
(key-chord-mode 1)

; php plugin
(add-to-list 'load-path "~/.emacs.d/php-mode")
(require 'php-mode)

; esc map
(key-chord-define-global "jk" 'evil-normal-state)

; scroll
(key-chord-define-global "lk" 'evil-scroll-up)
(key-chord-define-global "lj" 'evil-scroll-down)

; indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)