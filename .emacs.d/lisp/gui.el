;; Disable tool bar
(tool-bar-mode -1)

;; disable scrollbar
(scroll-bar-mode -1)

;; line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; start page
(setq inhibit-startup-screen t)

;; auto-dark
(setq auto-dark-allow-osascript t)
(require 'auto-dark)
(auto-dark-mode)

;; ido mode
(ido-mode t)

;; which key
(require 'which-key)
(which-key-mode)
(which-key-setup-minibuffer)

;; powerline
(require 'powerline)
(powerline-default-theme)
