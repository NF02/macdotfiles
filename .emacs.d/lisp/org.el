;; org-mode 
(use-package org
  :config
  (unbind-key "S-<left>" org-mode-map)
  (unbind-key "S-<right>" org-mode-map)
  (unbind-key "S-<up>" org-mode-map)
  (unbind-key "S-<down>" org-mode-map)
  (unbind-key "C-S-<left>" org-mode-map)
  (unbind-key "C-S-<right>" org-mode-map)
  (unbind-key "C-S-<up>" org-mode-map)
  (unbind-key "C-S-<down>" org-mode-map)
  )

;;;; org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (R . t)
   (octave . t)
   (python . t)
   (C . t)
   (rust . t)))

;;;; org modern mode
(require 'org-modern)
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

;;;; org mode present
(require 'org-tree-slide)

(with-eval-after-load "org-tree-slide"
  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree)
  )
;;;; org roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Documents/org-notes"))
  (org-roam-complete-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)
	 ("C-c n u" . org-roam-ui-mode)
	 :map org-mode-map
	 ("C-M-i"          . completion-at-point))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))
