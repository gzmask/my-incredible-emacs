; theme
(load-theme 'manoj-dark t)
(setq inhibit-splash-screen t)

; marmalade melpa
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

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
(iswitchb-mode t)
(defun iswitchb-local-keys ()
    (mapc (lambda (K) 
    (let* ((key (car K)) (fun (cdr K)))
        (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
        '(("<right>" . iswitchb-next-match)
          ("<left>" . iswitchb-prev-match)
          ("<up>"    . ignore             )
          ("<down>"  . ignore             ))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)


; clojure mode
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

; nrepl
(key-chord-define evil-normal-state-map ",e" 'nrepl-eval-expression-at-point)

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
    (setq w3m-home-page "hckrnews.com")
    ; tab create
    (define-key w3m-mode-map (read-kbd-macro "s-<return>") 'w3m-view-this-url-new-session)
    ; exit to vim mode
    (key-chord-define w3m-mode-map ",," 'evil-normal-state)
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
        (key-chord-define evil-insert-state-map ";;" 'evil-ex)
        (key-chord-define evil-normal-state-map ";;" 'evil-ex)
        (key-chord-define evil-visual-state-map ";;" 'evil-ex)
        (define-key evil-motion-state-map ";" 'evil-ex)
        ; esc map
        (key-chord-define evil-insert-state-map ",," (kbd "<escape>"))
        (key-chord-define evil-normal-state-map ",," (kbd "<escape>"))
        (key-chord-define evil-visual-state-map ",," (kbd "<escape>"))
        (key-chord-define evil-motion-state-map ",," (kbd "<escape>"))
        (key-chord-define evil-emacs-state-map ",," (kbd "<escape>"))
        ; auto complete
        ;(define-key ac-completing-map (kbd "C-n") 'ac-next)
        ;(define-key ac-completing-map (kbd "C-p") 'ac-previous)
        ;(define-key ac-completing-map (kbd "C-g") 'ac-stop)
        (define-key ac-completing-map (kbd "ESC") 'evil-normal-state)
        (key-chord-define ac-completing-map ",," 'evil-normal-state)
        (evil-make-intercept-map ac-completing-map)
        ; scroll
        (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
        (define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)
        ))
