;; -------------------------------------------------------------------

;; Code Lint and Spell Check
(use-package flycheck-pos-tip :ensure t)
(use-package flycheck
  :ensure t
  :commands global-flycheck-mode
  :init (global-flycheck-mode)
  :config (progn
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (setq flycheck-standard-error-navigation nil)
;; flycheck errors on a tooltip (doesnt work on console)
    (when (display-graphic-p (selected-frame))
      (eval-after-load 'flycheck
        '(custom-set-variables
        '(flycheck-display-errors-function
          #'flycheck-pos-tip-error-messages))))))

;; -------------------------------------------------------------------


;; Python like a pro
(use-package py-autopep8 :ensure t)
(use-package ein :ensure t)
(use-package elpy
  :ensure t
  :config
    (elpy-enable)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
    (add-hook 'elpy-mode-hook 'flycheck-mode)
    (elpy-use-ipython)
    )
;; Install python-tk python3-tk
(setq python-shell-prompt-detect-failure-warning nil)
(setq python-shell-interpreter "ipython3"
    python-shell-interpreter-args "--simple-prompt")

;; -------------------------------------------------------------------


;; Better bash
(add-hook 'sh-mode-hook (lambda ()
  (flycheck-select-checker 'sh-shellcheck)
))

;; -------------------------------------------------------------------


;; Magit
(use-package magit :ensure t)

;; -------------------------------------------------------------------

;; Yaml
(use-package yaml-mode :ensure t)

;; -------------------------------------------------------------------

;; Markdown
(use-package markdown-mode :ensure t)

;; -------------------------------------------------------------------


;; Web
(use-package web-mode :ensure t)

;; -------------------------------------------------------------------

;; Dockerfile
(use-package dockerfile-mode :ensure t)
(use-package docker :ensure t)
;(add-hook 'dockerfile-mode-hook (lambda ()
;  (define-auto-insert "Dockerfile" "Dockerfile")
;  (auto-insert)
;))

;; -------------------------------------------------------------------

;; Ansible
(use-package ansible :ensure t)
(use-package ansible-doc :ensure t)
(add-hook 'yaml-mode-hook #'ansible-doc-mode)
;; -------------------------------------------------------------------

;; JSON
(use-package json-mode :ensure t)

;; -------------------------------------------------------------------

;; Gherkin
(use-package gherkin-mode :ensure t)
(use-package feature-mode :ensure t
  :mode ("\\.feature$" . feature-mode)
  )

;; -------------------------------------------------------------------

;; Org Mode
(add-hook 'org-mode-hook (lambda ()
  (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)
  (setq org-support-shift-select 't)
  (use-package ox-reveal :ensure t)
  (use-package ox-impress-js :ensure t)
  (use-package org-magit :ensure t)
  (use-package org-present :ensure t)
  )
)

;; -------------------------------------------------------------------

;; Elixir
(use-package elixir-mode :ensure t)
(use-package elixir-mix :ensure t)
(use-package elixir-yasnippets :ensure t)
(use-package alchemist :ensure t)

;; -------------------------------------------------------------------
