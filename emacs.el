; scroll
(setq evil-want-C-u-scroll t)

; evil plugin
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; esc map
(add-to-list 'load-path "~/.emacs.d/key-chord")
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk"  'evil-normal-state)

; php mode
(add-to-list 'load-path "~/.emacs.d/php-mode")
(require 'php-mode)

