;; Neotree
(setq neo-theme (if (display-graphic-p) 'nerd 'ascii))
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (global-set-key (kbd "C-x /") 'neotree-toggle)
  (global-set-key (kbd "s-/") 'neotree-toggle))
(setq neo-window-width 20)
(setq neo-window-fixed-size nil)
