(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p
'use-package)
(package-refresh-contents)
(package-install 'use-package)
(require 'use-package))

(use-package general
  :ensure t
  :config
(general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

    ;; simple command
    "'"   '(iterm-focus :which-key "iterm")
    "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
    "/"   'counsel-ag
    "TAB" '(switch-to-other-buffer :which-key "prev buffer")
    "SPC" '(avy-goto-word-or-subword-1  :which-key "go to char")

    ;; Applications
    "a" '(:ignore t :which-key "Applications")
    "ar" 'ranger
    "ad" 'dired)
    ;; Windows
    "w-" '(:which-key "split-window-right"))

(use-package which-key
  :config (which-key-mode 1))

(use-package dashboard
:ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package helm
:ensure t
)

(use-package imenu-list
:ensure t
:config
(setq imenu-list-focus-after-activation t)
(setq imenu-list-position left))
