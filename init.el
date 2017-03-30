;;; Init.el --- Emacs as a beautiful and useful editor. Why not?
;; -------------------------------------------------------------------
;;; Commentary:
;;
;; Hi! Welcome to my Emacs configuration file.
;; Dude, I have some serious problems related to appearence,
;; ergonomics and automatization.  I tried to make this
;; Emacs config to have an editor better than an IDE,
;; nicer than Textmate and Sublime, useful as Atom and
;; good at command line like Vim.
;; It is not going to be easy, but we will try :)
;;
;;; Code:
;;
;; -------------------------------------------------------------------


;; Here we set the name and e-mail of the user
(setq user-full-name "Wesley R. da Silva"
      user-mail-address "wesley.it@gmail.com")

;; -------------------------------------------------------------------


;; In this section we configure the external repositories
;; and the `use-package` basic configuration
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("org" . "http://orgmode.org/elpa/")
	("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(package-initialize)

;; -------------------------------------------------------------------


;; Custom.el Section: emacs will use this section to insert some
;; custom settings.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode web-mode use-package smart-mode-line-powerline-theme rainbow-mode py-autopep8 projectile project-explorer popwin ox-reveal ox-impress-js org-present org-magit neotree multiple-cursors markdown-mode icicles helm gruvbox-theme gherkin-mode flycheck-pos-tip feature-mode elpy elixir-yasnippets elixir-mix ein dockerfile-mode docker cyberpunk-theme csv-nav csv-mode color-theme-solarized auto-org-md auto-complete ansible-doc ansible all-the-icons alchemist))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -------------------------------------------------------------------


;; Emacs behavior: In this section we set a lot of little behaviors
;; to make the user experience better. These behaviors are
;; automatic backup, automatic saving, session management,
;; splash screen, scratch buffer, and many others.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq backup-inhibited t)
(setq auto-save-default nil)
(desktop-save-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq sml/no-confirm-load-theme t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(use-package org :ensure t)
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "* Anotações\n\n")
(use-package popwin :ensure t :config (popwin-mode 1))
(setq display-buffer-function 'popwin:display-buffer)
(use-package multiple-cursors :ensure t :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click))

;; -------------------------------------------------------------------


;; Some tweaks and facilities :)
(global-set-key (kbd "s-e") (lambda() ;; Edit emacs configuration file
  (interactive)(find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "s-t") 'eshell) ;; Open an e-shell

;; -------------------------------------------------------------------


;; There are some local modules that I think they should
;; be on every buffer. In this section I declare them as global
(use-package rainbow-mode :ensure t)
(use-package projectile :ensure t :config (projectile-mode))
(define-globalized-minor-mode g-rainbow-mode rainbow-mode rainbow-mode)
(define-globalized-minor-mode g-electric-pair-mode electric-pair-mode electric-pair-mode)
(define-globalized-minor-mode g-show-paren-mode show-paren-mode show-paren-mode)
(define-globalized-minor-mode g-which-function-mode which-function-mode which-function-mode)
(define-globalized-minor-mode g-delete-selection-mode delete-selection-mode delete-selection-mode)
(define-globalized-minor-mode g-hl-line-mode hl-line-mode hl-line-mode)

;; And here I start them along with Emacs.
(g-rainbow-mode t) ;; colored named colors
(g-electric-pair-mode t) ;; autoclose quotes, braces, etc.
(g-show-paren-mode t) ;; highlight pairs of parenthesis
(g-which-function-mode t) ;; show in which function the cursor is in
(g-delete-selection-mode t) ;; delete or replace selected text
(g-hl-line-mode t) ;; highlight the current line

;; -------------------------------------------------------------------


;; Extras: some amazing plugins and configurations to make emacs
;; even better!

;; Helm
(load-file "~/.emacs.d/ws-conf.d/ws-helm.el")
;; Autocomplete
(load-file "~/.emacs.d/ws-conf.d/ws-autocomplete.el")
;; Neotree
(load-file "~/.emacs.d/ws-conf.d/ws-neotree.el")
;; LooknFeel
(load-file "~/.emacs.d/ws-conf.d/ws-looknfeel.el")
;; Development
(load-file "~/.emacs.d/ws-conf.d/ws-development.el")

;; -------------------------------------------------------------------


(provide 'init)
;;; init.el ends here
