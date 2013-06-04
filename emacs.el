; theme
(load-theme 'manoj-dark t)
(set-face-attribute 'default nil :height 150)
(setq inhibit-splash-screen t)
(set-frame-parameter (selected-frame) 'alpha '(75 80))

; marmalade melpa
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; mac cmd to ctl
(setq mac-command-modifier 'control)

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

; indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; auto-complete
(add-to-list 'load-path "~/.emacs.d/autocomplete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
(ac-config-default)

; easy buffer switch with c-x b
(setq ido-everywhere t)          
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)
(ido-mode 1)                     

; clojure mode
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

; nrepl
(define-key evil-normal-state-map (kbd ";") 'nrepl-eval-expression-at-point)
(key-chord-define evil-normal-state-map ",f" 'nrepl-eval-buffer)

; line number
(defvar my-linum-current-line-number 0)
(setq linum-format 'my-linum-relative-line-numbers)
(defun my-linum-relative-line-numbers (line-number)
    (let ((test2 (1+ (- line-number my-linum-current-line-number))))
        (propertize
            (number-to-string (cond ((<= test2 0) (1- test2))
                                    ((> test2 0) (- test2 1))))
                    'face 'linum)))
(defadvice linum-update (around my-linum-update)
    (let ((my-linum-current-line-number (line-number-at-pos)))
        ad-do-it))
(ad-activate 'linum-update)
(global-linum-mode t)

; no backup file
(setq make-backup-files nil)

;disable auto save
(setq auto-save-default nil)

; w3m 
(add-to-list 'load-path "~/.emacs.d/w3m")
(when (executable-find "w3m")
    (setq w3m-command (executable-find "w3m"))
    (require 'w3m)
    (require 'w3m-load)
    (require 'w3m-search)
    (require 'browse-url)
    (setq w3m-use-cookies t)
    ; change homepage
    (setq w3m-home-page "about:blank")
    ; tab create
    (define-key w3m-mode-map (read-kbd-macro "s-<return>") 'w3m-view-this-url-new-session)
    ; exit to vim mode
    (define-key w3m-mode-map (kbd "ESC") 'evil-normal-state)
    ; goto url
    (defun gzmask/w3m-browse-url (url prefix)
        "Ask emacs-w3m to browse URL."
        (interactive
            (progn
                (browse-url-interactive-arg "URL: ")))
            (when (stringp url)
                (w3m-goto-url (w3m-canonicalize-url url))))
    (defun gzmask/w3m-browse-url-new-session (url prefix)
        "Ask emacs-w3m to browse URL."
        (interactive
            (progn
                (browse-url-interactive-arg "URL: ")))
            (when (stringp url)
                (w3m-goto-url-new-session (w3m-canonicalize-url url))))
    (define-key w3m-mode-map (kbd "g") 'gzmask/w3m-browse-url)
    (define-key w3m-mode-map (kbd "G") 'gzmask/w3m-browse-url-new-session))


; evil key-binding
(eval-after-load "evil"
    '(progn
        ; command map
        ;(define-key evil-motion-state-map ";" 'evil-ex)
        ; auto complete
        (define-key ac-completing-map (kbd "ESC") 'evil-normal-state)
        (evil-make-intercept-map ac-completing-map)
        ; scroll
        (key-chord-define evil-normal-state-map ",," 'evil-scroll-down)
        (key-chord-define evil-normal-state-map ",m" 'evil-scroll-up)))
        ;(key-chord-define evil-normal-state-map ",," (kbd "12 C-e"))
        ;(key-chord-define evil-normal-state-map ",m" (kbd "12 C-y"))))
