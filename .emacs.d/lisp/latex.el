;; pdf tools
(require 'pdf-tools)
(use-package pdf-tools
  :pin manual
  :config
  (setenv "PKG_CONFIG_PATH" "/opt/homebrew/opt/poppler/lib/pkgconfig/:/opt/homebrew/opt/libpng/lib/pkgconfig")
  ;(pdf-tools-install)
  (custom-set-variables
    '(pdf-tools-handle-upgrades t))
   (setq-default pdf-view-display-size 'fit-width)
   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
   :custom
   (pdf-annot-activate-created-annotations t "automatically annotate highlights"))

;; AUCtex
(use-package auctex
  :ensure t
  :defer t)

;;; math preview
(use-package latex-math-preview)

;; cdlatex
(require 'cdlatex)
(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook #'turn-on-cdlatex)   ; with Emacs latex mode

;;;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;;;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
