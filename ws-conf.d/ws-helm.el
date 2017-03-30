;; We are using HELM to M-x
(use-package helm
    :ensure t
    :config
    (require 'helm-config)
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))
    (global-set-key (kbd "C-c M-x")     'execute-extended-command) ; old M-x
    (global-set-key (kbd "C-x C-d")     'helm-browse-project)
    (global-set-key (kbd "C-h C-f")     'helm-apropos)
    (global-set-key (kbd "C-h r")       'helm-info-emacs)
    (global-set-key (kbd "C-h i")       'helm-info-at-point)
    (global-set-key (kbd "C-:")         'helm-eval-expression-with-eldoc)
    (global-set-key (kbd "C-,")         'helm-calcul-expression)
    (global-set-key (kbd "C-x C-b")     'helm-buffers-list)
    (global-set-key (kbd "C-c f")       'helm-recentf)
    (global-set-key (kbd "C-x C-f")     'helm-find-files)
    (global-set-key (kbd "M-x")         'helm-M-x)
    (global-set-key (kbd "M-y")         'helm-show-kill-ring)
    (global-set-key (kbd "C-c i")       'helm-imenu)
    (global-set-key (kbd "C-x b")       'helm-mini)
    (global-set-key (kbd "C-x C-f")     'helm-find-files)
    (global-set-key (kbd "C-c h o")     'helm-occur)
    (define-key global-map [remap jump-to-register]      'helm-register)
    (define-key global-map [remap list-buffers]          'helm-buffers-list)
    (define-key global-map [remap dabbrev-expand]        'helm-dabbrev)
    (define-key global-map [remap find-tag]              'helm-etags-select)
    (define-key global-map [remap xref-find-definitions] 'helm-etags-select)
    (helm-adaptive-mode t)
    (helm-mode 1))
(setq helm-ff-skip-boring-files t)
(setq helm-boring-file-regexp-list '("\\.$" "\\.\\.$"))
(setq helm-boring-buffer-regexp-list
        '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*tramp" "\\*Minibuf" "\\*epc"))

;; Cicle through opened buffers
(global-set-key (kbd "C-x <left>") 'bs-cycle-previous)
(global-set-key (kbd "C-x <right>") 'bs-cycle-next)


