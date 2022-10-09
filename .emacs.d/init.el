;; ░█▀▀░█▄█░█▀█░█▀▀░█▀▀░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░░░█▀▀░█▀█░█▀▄░░░█▄█░█▀█░█▀▀
;; ░█▀▀░█░█░█▀█░█░░░▀▀█░░░█░░░█░█░█░█░█▀▀░░█░░█░█░░░█▀▀░█░█░█▀▄░░░█░█░█▀█░█░░
;; ░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░░▀░░░▀▀▀░▀░▀░░░▀░▀░▀░▀░▀▀▀

;; Rimozione degli elementi grafici
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

(global-set-key (kbd "TAB") 'self-insert-command)

;; evidenzia riga
;;(global-hl-line-mode 1)

;; numero per riga
(global-linum-mode t)

;; il repo esterno
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; evil
(use-package evil
  :ensure t
  :init
  (evil-mode 1))

;; which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

;; beacon
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

;; ido mode "modalità interattiva"
(require 'ido)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'alway)
(ido-mode 1)
;; show choices vertically
(setf (nth 2 ido-decorations) "\n")
;; show any name that has the chars you typed
(setq ido-enable-flex-matching t)
;; use current pane for newly opened file
(setq ido-default-file-method 'selected-window)
;; use current pane for newly switched buffer
(setq ido-default-buffer-method 'selected-window)
(fido-vertical-mode 1)

;; auctex
(use-package auctex
  :ensure t
  :defer t)

;; org mode
(use-package ox-reveal)
(use-package org-contrib)

;; pdf view
(setq TeX-PDF-mode t)
(use-package pdf-tools
   :pin manual
   :config
   (pdf-tools-install)
   (setq-default pdf-view-display-size 'fit-width)
   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
   :custom
   (pdf-annot-activate-created-annotations t "automatically annotate highlights"))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

;; powerline
(require 'powerline)
(powerline-default-theme)

;; trasparenza
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))

(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(90 . 90) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; latex
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq org-latex-listings 't)

(load-theme 'wheatgrass t)

(setq ispell-dictionary "italiano")
(setq flyspell-use-meta-tab nil)

(use-package go-mode)
(use-package markdown-mode)

;; popwin multitab manager
(require 'popwin)
(popwin-mode 1)

;; | Key    | Command                               |
;; |--------+---------------------------------------|
;; | b      | popwin:popup-buffer                   |
;; | l      | popwin:popup-last-buffer              |
;; | o      | popwin:display-buffer                 |
;; | C-b    | popwin:switch-to-last-buffer          |
;; | C-p    | popwin:original-pop-to-last-buffer    |
;; | C-o    | popwin:original-display-last-buffer   |
;; | SPC    | popwin:select-popup-window            |
;; | s      | popwin:stick-popup-window             |
;; | 0      | popwin:close-popup-window             |
;; | f, C-f | popwin:find-file                      |
;; | e      | popwin:messages                       |
;; | C-u    | popwin:universal-display              |
;; | 1      | popwin:one-window                     |
(global-set-key (kbd "C-z") popwin:keymap)

;; direx direct's tree
(require 'direx)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
     popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)


;; mac keymap
(set-keyboard-coding-system 'mac-roman)
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)


;; define macros
(global-set-key (kbd "C-c s") (kbd "C-x 2 M-X shell"))
(global-set-key (kbd "C-c g") (kbd "M-x linum-mode"))
