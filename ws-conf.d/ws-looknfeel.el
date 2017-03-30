;; We need line numbers with a line and some space
(global-linum-mode t)
(setq linum-format "%4d ")
(set-face-attribute 'fringe nil
		    :background "#242424"
		    :foreground "#242424")
(set-face-attribute 'linum nil
		    :foreground "#555555")


;; Lets install powerline and make a better statusbar
(use-package smart-mode-line-powerline-theme
  :ensure t)
(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup))
(column-number-mode 1)
(display-time)

;; Select a nice theme
(use-package dash :ensure t)
(if (display-graphic-p)
  (load-theme 'wombat t)
  (load-theme 'smart-mode-line-powerline t)
  (unless (display-graphic-p)
  (load-theme 'wombat t)
  (load-theme 'smart-mode-line-powerline t)
  (setq linum-format "%4d \u2502 ")
  ))

;; Highlight the line without underline
(set-face-underline-p 'highlight nil)
(set-face-attribute 'region nil :background "#666600")

;; This font is awesome!
(set-face-attribute 'default nil
  :family "Source Code Pro for Powerline"
  :height 160)

;; Some properties applied to a client instance
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; No bars, no menus, no scrolls
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)



;; Change the window's size
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Cycle windows with C-x Up, C-x Down
(global-set-key (kbd "C-x <up>") 'other-window)
(global-set-key (kbd "C-x <down>") 'other-window)
(global-set-key (kbd "C-x C-<up>") 'other-window)
(global-set-key (kbd "C-x C-<down>") 'other-window)
