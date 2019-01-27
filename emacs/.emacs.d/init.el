; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

;; Package configs

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-numbers
  :after evil
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (define-key evil-visual-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
  (define-key evil-visual-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle))

(use-package volatile-highlights
  :ensure t
  :config (volatile-highlights-mode t))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package helm
  :ensure t
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 50))

(use-package nlinum-relative
  :after evil
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-relative-current-symbol "")
  (setq nlinum-relative-offset 0)
  (nlinum-relative-mode))

(use-package gruvbox-theme 
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

(use-package elpy
  :ensure t
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"))

(use-package flycheck
  :ensure t
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  :hook (elpy-mode . flycheck-mode))

(use-package py-autopep8
  :ensure t
  :hook
  (elpy-mode py-autopep8-enable-on-save))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e2fd81495089dc09d14a88f29dfdff7645f213e2c03650ac2dd275de52a513de" "2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "a622aaf6377fe1cd14e4298497b7b2cae2efc9e0ce362dade3a58c16c89e089c" default)))
 '(package-selected-packages
   (quote
    (nlinum-relative volatile-highlights neotree evil-paredit evil-collection gruvbox-theme flycheck py-autopep8 elpy better-defaults solarized-theme poet-theme linum-relative helm use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
