(setq inhibit-startup-screen t)

(defmacro append-to-list (target suffix)
  "Append SUFFIX to TARGET in place."
  `(setq ,target (append ,target ,suffix)))


(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'use-package)
(setq
 use-package-verbose t) ;; Package install logging. Packages break, it's nice to know why.

;; Any Customize-based settings should live in custom.el, not here.
(setq custom-file "~/.emacs.d/custom.el") ;; Without this emacs will dump generated custom settings in this file. No bueno.
(load custom-file 'noerror)

(defconst *is-a-linux* (eq system-type 'gnu/linux))

(when *is-a-linux*
  (setq x-super-keysym 'meta))

;; Fullscreen by default, as early as possible. This tiny window is not enough
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;(use-package kaolin-themes
;;  :config
;;  (load-theme 'kaolin-dark t)
;;  (kaolin-treemacs-theme))

(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'mocha)


;; Make M-x and other mini-buffers sortable, filterable
(use-package ivy
  :init
  (ivy-mode 1)
  (setq ivy-height 15
        ivy-use-virtual-buffers t
        ivy-use-selectable-prompt t))

(use-package company
  :init
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0) ;; instant popups
  :config
  (global-company-mode)
  ;; Use only LSP completion, not dabbrev
  (setq company-backends '(company-capf)))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :config
  (projectile-mode +1))

;; rust
(when (treesit-available-p)
  (add-to-list 'major-mode-remap-alist
	       '(rust-mode . rust-mode)))

(when (treesit-available-p)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))

;; nix
(use-package nix-ts-mode
  :mode "\\.nix\\'"
  :hook (nix-ts-mode . eglot-ensure)
  :config
  (setq treesit-font-lock-level 4))

(use-package tuareg
  :ensure t
  :mode (("\\.ml\\'" . tuareg-mode)
         ("\\.mli\\'" . tuareg-mode)
         ("\\.ocamlinit\\'" . tuareg-mode)))

(use-package eglot
  :commands eglot-ensure)

(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  ((tuareg-mode . ocaml-eglot)
   (ocaml-eglot . eglot-ensure)
   ;; Optional: auto-format on save
   (ocaml-eglot . (lambda ()
                    (add-hook 'before-save-hook 'eglot-format nil t))))
  :config
  (setq ocaml-eglot-syntax-checker 'flymake))

(use-package dune
  :ensure t)

(use-package direnv
             :config
             (direnv-mode)
             (advice-add 'rust-mode :before #'direnv-update-environment))

(use-package rust-mode
  :mode "\\.rs\\'"
  :hook (rust-mode . eglot-ensure))

(use-package go-mode
  :mode "\\.go\\'"
  :hook (go-mode . eglot-ensure))

(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

;; START dashboard
;; TODO: re-enable once nixpkgs is bumped to nixos-26.11 — dashboard 20260402
;; (shipped by nixos-26.05) crashes on every render with
;; "Wrong type argument: symbolp" from dashboard-cycle-section-forward.
;; (use-package dashboard
;;   :ensure t
;;   :custom
;;   (dashboard-projects-backend 'projectile)
;;   (dashboard-banner-logo-title "Welcome to Emacs")
;;   (dashboard-startup-banner 'logo) ;; logo
;;   (dashboard-center-content t)
;;   (dashboard-vertically-center-content t)
;;   :config
;;   (if (daemonp)
;;       (add-hook 'server-after-make-frame-hook #'dashboard-open)
;;     (dashboard-setup-startup-hook)))

;; END

;; START modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
;; ENC

;; (unless (daemonp)
;;   (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name))))

;; settings
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1) ;; showing line numbers

(auto-save-mode -1) ;; disable auto-save
(setq make-backup-files nil) ;; disable backup files

;; Disable mouse acceleration
(setq mouse-wheel-progressive-speed nil)

;; mouse scrolling
(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-follow-mouse t)

;; keyboard scrolling
(setq scroll-step 1)
(setq scroll-conservatively 101)
(setq scroll-margin 10)
(setq scroll-preserve-screen-position t)

(pixel-scroll-precision-mode 1)

;; whitespace
(require 'whitespace)

(setq whitespace-style
      '(face
        trailing
        tabs
        tab-mark
        missing-newline-at-eof
        indentation))  ;; ← only spaces used for indentation

(setq whitespace-display-mappings
      '((space-mark ?\u00A0 [?\u00B7] [?.])   ;; non-breaking space → ·
        (space-mark ?\u0020 [?\u00B7] [?.])   ;; normal space → ·
        (tab-mark   ?\t     [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

;; Tabs: width 4
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)

;; load files
(load (expand-file-name (concat user-emacs-directory "keybindings.el")))
