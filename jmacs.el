(setq org-agenda-files (quote ("~/Dropbox/agendas/school.org")))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package undo-tree
:ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package imenu-list
:ensure t
:config
(setq-default imenu-list-position "left"))
;(imenu-list-minor-mode t)

(use-package which-key
:ensure t
:config
(which-key-mode 1))

(use-package magit
:ensure t)

(use-package all-the-icons
:ensure t)

(use-package projectile
:ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package general
:ensure t)

(use-package unfill
:ensure t)

(use-package yasnippet
:ensure t
:config
(yas-global-mode t))
(use-package yasnippet-snippets
:ensure t)

(use-package restart-emacs
:ensure t)

(use-package csv-mode
:ensure t)
(add-to-list 'auto-mode-alist '("\\.csv\\'" . csv-mode))

(use-package doom-themes
:ensure t)

(use-package solarized-theme
:ensure t)

(use-package doom-modeline
:ensure t)

(use-package wc-mode
:ensure t
:config
(setq-default wc-modeline-format "%tw"))

(use-package writegood-mode
:ensure t)

(use-package writeroom-mode
:ensure t)

(use-package wordsmith-mode
:ensure t)

(use-package decide
:ensure t)

(use-package ivy
:ensure t
:config
(ivy-mode 1))

;(use-package counsel-projectile)
(use-package counsel
:ensure t)

(use-package swiper
  :commands (swiper swiper-all))

(use-package company
:ensure t
:config
(add-hook 'after-init-hook 'global-company-mode))

(use-package elpy
:ensure t)

(use-package bbcode-mode
:ensure t)

(use-package js2-mode
    :ensure t)
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    ;; Better imenu
    (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
    (use-package js2-refactor
    :ensure t)
    (use-package xref-js2
    :ensure t)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(use-package flycheck
:ensure t
:config
(add-hook 'prog-mode-hook 'flycheck-mode))

(use-package lorem-ipsum
:ensure t)

(use-package org-bullets
:after org
:ensure t)

(use-package toc-org
  :after org
  :init (add-hook 'org-mode-hook #'toc-org-enable))

(use-package org-super-agenda
:ensure t
:config
(add-hook 'org-mode-hook 'org-super-agenda-mode)
:after
(let ((org-super-agenda-groups
     '((:auto-category t))))
(org-agenda-list)))

(use-package ox-mediawiki
:ensure t)

(defun edit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/jmacs.org"))

(defalias 'yes-or-no-p 'y-or-n-p)

(defun wordCount (&optional begin end)
  "count words between BEGIN and END (region); if no region defined, count words in buffer"
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
      (e (if mark-active end (point-max))))
    (message "%s words" (how-many "\\w+" b e))))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(defun simple-mode-line-render (left right)
  "Return a string of `window-width' length containing LEFT, and RIGHT
 aligned respectively."
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))

(defun simple-header-line-render (left right)
  "Return a string of `window-width' length containing LEFT, and RIGHT
 aligned respectively."
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))

(setq org-image-actual-width (/ (display-pixel-width) 4))

(setq-default indent-tabs-mode nil)

(setq-default initial-major-mode 'org-mode)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.nvl\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.chrs\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.cmp\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.chr\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.aar\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.otl\\'" . org-mode))

(add-hook 'org-mode-hook 'visual-line-mode)

(setq-default org-bullets-mode 1)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'org-super-agenda-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'toc-org-mode)
(setq-default org-list-allow-alphabetical t)

(add-hook 'org-mode-hook 'wc-mode)
(add-hook 'org-mode-hook 'decide-mode)

(setq-default global-company-mode 1)
(setq-default yas-minor-mode 1)

(setq-default doom-modeline-mode t)

(display-battery-mode t)

(electric-pair-mode t)

(add-hook 'python-mode 'elpy-mode)
(add-to-list 'auto-mode-alist '("\\.bbc\\'" . bbcode-mode))

(defun org-latex-yas ()
  "Activate org and LaTeX yas expansion in org-mode buffers."
  (yas-activate-extra-mode 'latex-mode))

(add-hook 'org-mode-hook #'org-latex-yas)

(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

   ;; Specific Keybinding Replacements
    "SPC" (general-simulate-key "M-x")
    "c"   (general-simulate-key "C-c")
    "h"   (general-simulate-key "C-h")
    "u"   (general-simulate-key "C-u")
    "x"   (general-simulate-key "C-x")
    ;; Auto Complete
    "TAB" 'company-complete
   ;; quit commands  
   "q" '(:ignore t :which-key "quit emacs")
   "qq"  'kill-emacs
   "qz"  'delete-frame
   "qr"  'restart-emacs
   ;; Buffer commands 
    "b"   '(:ignore t :which-key "buffers")
    "bb"  'mode-line-other-buffer
    "bd"  'kill-this-buffer
    "bn"  'next-buffer
    "bp"  'previous-buffer
    "bq"  'kill-buffer-and-window
    "bR"  'rename-file-and-buffer
    "br"  'revert-buffer
    "bw"  'wordCount
;; Window commands
   "w"  '(:ignore t :which-key "Windows")
   "wh" 'split-window-right
   "wv" 'split-window-below
   "wn" 'other-window
   "wd"  'delete-window
   "wD"  'delete-other-windows
   "wm" 'maximize-window

;; Files
   "f" '(:ignore t :which-key "Files")
   "fe" '(:ignore t :which-key "Edit file")
   "feD" 'edit-emacs-config
   "ff"  'counsel-find-file
   "fs"  'save-buffer
   "f" '(:ignore t :which-key "Files")
   "fe" '(:ignore t :which-key "Edit file")
   "feD" 'edit-emacs-config
   "fE" '(:ignore t :which-key "Eval file")
   "fEr" 'eval-region
   "fEb" 'eval-buffer
   "fEd" 'eval-defun
   "ff"  'counsel-find-file
   "fs"  'save-buffer

   ;; Packages
   "p" '(:ignore t :which-key "Packages")
   "pl" 'package-list-packages
   "pr" 'package-refresh-contents
   "pi" 'package-install
   "pI" 'package-initialize
   "pd" 'package-delete

   ;; Org-Mode
   "o" '(:ignore t :which-key "Org Menu")
   "os" 'org-schedule
   "oS" 'org-save-all-org-buffers
   "oa" 'org-agenda
   "oA" 'org-agenda-fortnight-view
   "on" 'org-shiftright
   "op" 'org-shiftleft
   "od" 'org-deadline
   "oc" '(:ignore t :which-key "cycle")
   "oca" 'org-cycle-agenda-files
   "ot" '(:ignore t :which-key "toggle")
   "oti" 'org-toggle-inline-images
   "otc" 'org-toggle-checkbox
   "oT" 'org-todo
   "oi" '(:ignore t :which-key "insert")
   "oit" 'toc-org-insert-toc
   "oiT" 'org-time-stamp
	 "oe" 'org-export-dispatch
   ;; Magit
   "g" '(:ignore t :which-key "Magit")
   "gs" 'magit-status
   "gS" 'magit-stage-file
   "gc" 'magit-commit
   "gp" 'magit-push
   "gP" 'magit-push-to-remote
   "gd" 'magit-diff 

;; IMenu-List toggle
   "m" '(:ignore t :which-key "Imenu-list") 
   "mt" 'imenu-list-smart-toggle
   "me" 'imenu-list-goto-entry
;; Writer Commands
   "r"  '(:ignore t :which-key "Writeroom Mode")
   "rt" 'writeroom-mode
   "rm" 'writeroom-toggle-mode-line
   "rw" 'wordsmith-mode
;; Toggles
   "t" '(:ignore t :which-key "Toggle")
   "tw" 'toggle-word-wrap
   "tf" 'unfill-toggle
   "tn" 'display-line-numbers-mode

;; General Mode Toggles
   "M" '(:ignore t :which-key "Mode Toggles")
   "Ma" 'auto-complete-mode
   "Mi" 'org-indent-mode
   "Mw" 'wc-mode
   "Md" 'decide-mode
   "My" 'yas-minor-mode 
   "MW" 'writegood-mode
   "Ms" 'flyspell-mode
   "MF" 'flycheck-mode
   "Mc" 'company-mode
   "Md" 'decide-mode
   "Mt" 'toc-org-mode
;; YaSnippet Shortcuts
"y" '(:ignore t :which-key "Yasnippet")
"yn" 'yas-new-snippet
"yi" 'yas-insert-snippet
"yy" 'yas-minor-mode

;; Spell-check
"s" '(:ignore t :which-key "Spell Check")
"sn" 'flyspell-goto-next-error
"sb" 'flyspell-buffer
"sc" 'flyspell-correct-word-before-point

;; Lorem Ipsum
"l" '(:ignore t :which-key "Lorem Ipsum")
"ll" 'lorem-ipsum-insert-lists
"ls" 'lorem-ipsum-insert-sentences
"lp" 'lorem-ipsum-insert-paragraphs
)

(general-define-key
:states 'normal
"TAB" 'evil-toggle-fold)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(general-define-key
:states  'insert
"TAB" 'company-complete)

(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

(setq-default org-hide-leading-stars t)
(setq-default org-ellipsis "⤵")
(setq org-src-fontify-natively t)  
(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


(setq-default org-bullets-bullet-list 
'("⚫" "○")) 

(setq-default tab-width 4)
(setq-default org-list-indent-offset 4)

(set-face-attribute 'default t :font "DejaVu Sans Mono-12")
; (setq solarized-use-variable-pitch nil)

 ;   (setq solarized-scale-org-headlines nil)

  ;  (setq solarized-height-minus-1 1)
   ; (setq solarized-height-plus-1 1)
    ;(setq solarized-height-plus-2 1)
    ;(setq solarized-height-plus-3 1)
    ;(setq solarized-height-plus-4 1)

;(load-theme 'solarized t)
;  (load-theme 'doom-solarized-dark t)
  ;(load-theme 'doom-solarized-light t)
  ;(load-theme 'doom-one t)
  ;(load-theme 'doom-gruvbox t)
  ;(load-theme 'doom-material t)
  ;(load-theme 'doom-nord t)
  ;(setq solarized-termcolors 256)

  ;; ;; Solarized Config
   (setq solarized-use-variable-pitch nil)

       (setq solarized-scale-org-headlines nil)

       (setq solarized-height-minus-1 1)
       (setq solarized-height-plus-1 1)
       (setq solarized-height-plus-2 1)
       (setq solarized-height-plus-3 1)
       (setq solarized-height-plus-4 1)
       (setq x-underline-at-descent-line t)
       
   (load-theme 'solarized-dark t)

(setq-default header-line-format
'(:eval (propertize (format-time-string " %d %b %I:%M %p ")
                                   'face 'font-lock-builtin-face))
)

;(setq rm-blacklist
 ;     (format "^ \\(%s\\)$"
  ;            (mapconcat #'identity
   ;                      '("Fly.*" "Projectile.*" "PgLn" "Undo-Tree" "yas" "WK" "Ivy" "Decide" "$")
    ;                     "\\|")))
;(defun prose-setup ()
;(setq mode-line-format
;'((:eval (simple-mode-line-render
                ;; left
;               (format-mode-line "%b [%*]"))))
                ;; right
 ;             (format-mode-line "%m  %M" )))
 ; (add-hook 'org-mode-hook 'prose-setup)

(doom-modeline-def-segment evil-state
  "The current evil state.  Requires `evil-mode' to be enabled."
  (when (bound-and-true-p evil-local-mode)
    (s-trim-right (evil-state-property evil-state :tag t))))

(use-package all-the-icons
:ensure t)
(defvar doom-modeline-icon (display-graphic-p) )
(setq doom-modeline-enable-word-count t)
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
(setq doom-modeline-icon t) 
(doom-modeline-def-modeline 'prose-modeline
'(bar word-count buffer-info-simple evil-state)
'(major-mode battery))

(defun set-prose-modeline ()
  (doom-modeline-set-modeline 'prose-modeline))
(add-hook 'org-mode-hook 'set-prose-modeline)

(defvar doom-modeline-icon (display-graphic-p) )
(setq doom-modeline-icon t)

(doom-modeline-def-modeline 'prog-modeline
'(bar buffer-info buffer-position evil-state)
'(major-mode battery checker))

(defun set-prog-modeline ()
    (doom-modeline-set-modeline 'prog-modeline))
(add-hook 'prog-mode-hook 'set-prog-modeline)
(add-hook 'text-mode-hook 'set-prog-modeline)

(setq-default frame-title-format '("" user-login-name " - " "%b"))
