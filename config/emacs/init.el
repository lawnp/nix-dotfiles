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

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-dark t)
  (kaolin-treemacs-theme))

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

(when (treesit-available-p)
  (add-to-list 'major-mode-remap-alist
	       '(rust-mode . rust-mode)))

(when (treesit-available-p)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))

(use-package direnv
             :config
             (direnv-mode)
             (advice-add 'rust-mode :before #'direnv-update-environment))

;; Package for interacting with language servers
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-code-actions t))

(use-package rust-mode
  :mode "\\.rs\\'"
  :hook (rust-mode . lsp))

(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode t))

;; settings
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1) ;; showing line numbers

(auto-save-mode -1) ;; disable auto-save
(setq make-backup-files nil) ;; disable backup files

;; load files
(load (expand-file-name (concat user-emacs-directory "keybindings.el")))
