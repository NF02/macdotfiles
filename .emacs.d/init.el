;; mac config

;; Mac keyboard layout
(set-keyboard-coding-system 'mac-roman)
;;; set right option
(setq mac-right-option-modifier nil)
;;; Mac Os X macros
(global-set-key (kbd "M-c") 'kill-ring-save) ; ⌘-c = Copy
(global-set-key (kbd "M-x") 'kill-region) ; ⌘-x = Cut
(global-set-key (kbd "M-v") 'yank) ; ⌘-v = Paste
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; ⌘-a = Select all
(global-set-key (kbd "M-z") 'undo) ; ⌘-z = Undo

;; Repos
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
			  ("org" . "https://orgmode.org/elpa/")
))

(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; determine the load path dirs
;; as relative to the location of tris file
(defvar dotfiles-dir "~/.emacs.d/"
  "The root Emacs Lisp source folder")

;; lang check tool
(defun flyspell-italian ()
  (interactive)
  (ispell-change-dictionary "default")
  (flyspell-buffer))

(global-set-key [f6] 'flyspell-mode)


;; design settings
(load "~/.emacs.d/lisp/gui.el")

;; LaTeX settings
(load "~/.emacs.d/lisp/latex.el")

;; org mode settings
(load "~/.emacs.d/lisp/org.el")

;; programming settings
(load "~/.emacs.d/lisp/progs.el")
