;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; ── UI ────────────────────────────────────────────────────────────────────
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 0)
(window-divider-mode 0)
(blink-cursor-mode 0)
(set-frame-font "IBM Plex Mono 10" nil t)

;; ── Theme ─────────────────────────────────────────────────────────────────
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'cool-slate t)

;; ── Sane editing defaults ─────────────────────────────────────────────────
(setq scroll-conservatively 101)        ; scroll line-by-line, no half-page jumps
(setq use-short-answers t)             ; y/n instead of yes/no prompts
(electric-pair-mode 1)                  ; auto-close () [] {} ""
(save-place-mode 1)                     ; remember cursor position across sessions
(global-auto-revert-mode 1)

;; Line numbers — disable in non-editing buffers
(global-display-line-numbers-mode 1)
(dolist (hook '(special-mode-hook
                help-mode-hook
                compilation-mode-hook))
  (add-hook hook (lambda () (display-line-numbers-mode 0))))

;; ── Buffer naming ─────────────────────────────────────────────────────────
;; Show path/to/file.py instead of file.py<2> when names clash
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq backup-directory-alist '(("." . "~/.emacs.d/.cache/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/.cache/autosaves/" t)))
(setq lock-file-name-transforms '((".*" "~/.emacs.d/.cache/lock-files/" t)))

;; ── Session / history ─────────────────────────────────────────────────────
(setq desktop-path '("~/.emacs.d/.cache/"))
;; (desktop-save-mode 1)   ; handles desktop-read via after-init-hook automatically
(recentf-mode 1)	

;; ── Keybindings ───────────────────────────────────────────────────────────
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ── Packages ──────────────────────────────────────────────────────────────

;; Vertical minibuffer completion
(use-package vertico
  :ensure t
  :init (vertico-mode))

;; Flexible space-separated matching (e.g. "py mo" matches python-mode)
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  ;; Keep basic style for file paths so /path/to/ still works predictably
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Rich annotations in completion margins (docs, file info, keybindings)
(use-package marginalia
  :ensure t
  :init (marginalia-mode))

;; In-buffer popup completion
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)   ; brief pause before popup (was 0 — too aggressive)
  (corfu-auto-prefix 2)    ; wait for 2 chars (was 1)
  :init (global-corfu-mode))

;; Keybinding hints
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; LSP via eglot
(use-package eglot
  :ensure t
  :hook ((python-mode . eglot-ensure)
         (c-mode      . eglot-ensure)
         (c++-mode    . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '(python-mode . ("pylsp"))))

;; Common Lisp
(use-package sly
  :ensure t)

;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c g" . magit-file-dispatch)))

;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner "/home/at/Pictures/emacs_logo/neko.xpm")
  (dashboard-setup-startup-hook))

;; ── Custom (managed by Emacs — do not edit by hand) ───────────────────────
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f41051344be1caea8b13e81f14281d3186c46e88022929baa99530f91c0ed5cf"
     "bfe727eccc80e1e30bec8f6494957e11819b61ae491e2aec0272e3eaf903ee7e"
     "ecea50a457c324fa64fbe129c1e00735d492d533987fc1219973241f901c8afa"
     "be6d165c328b5f1eac0cd22e39f305ffea5e462757452dc790673172394f4c0a"
     "64535bdc5ab9edbb77d4be9a28b30916d11b973df0ec5c6e078575dac38b5ae4"
     "821a4b07c8b00dfb2eaaac08c9775dc245bded9f66affc5dabdb1aa7c6e5e8c5"
     "85a5a4159b3c0c57b784575c46bc56407be7c39b8c9ab540e08453391edd3f6b"
     "5ca05e1d2e908777c96ae47c824e76516044d135b50d54b08b1e045b70c151c4"
     "4120e7b1042f39265492ed1d3b03d5b6e1d5456e23ff85a2708105807a30cdbc"
     "2e89821c489ea5859ba6f5a65dd188bf9355fc177c45450580deb78fde96d307"
     "c1b9d0989011f694600697894cadf69df2d625e7420eba7909a1189ee12812e3"
     "c774c57e2cc1a62ff27822e696ae3ad97f042b87a8bdfa3ff93153e0e00cdcc0"
     "444975d6e5c74686847e8de2418ecb2ac4cd90b57dd916b3aee67c972fc36ff0"
     default))
 '(package-selected-packages
   '(corfu dashboard eglot magit marginalia orderless sly vertico
	   which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
