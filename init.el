;(add-to-list 'default-frame-alist '(height . 40))
;(add-to-list 'default-frame-alist '(width . 120))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Important notes:
;; - X support in emacs is required for tabbar
;; - Required software: 
;;   common: color-theme, yasnippet, dropdown-list, session
;;   python: python-mode, pyflakes, ropemacs, ipython
;; - ropemode >= 1.0 rc should be installed 
;;   (easy_install ropemode 
;;     or 
;;    hg clone from http://bitbucket.org/agr/ropemode
;;   ) -- obsolete
;; - Use export TERM=xterm-256color !
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paths
(let (
      (eldir "~/.emacs.d") ; base path for loading elisp files
      (elsource "~/.emacs.d")  ; path to elisp sources
     )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Setup load paths
  (defun  add-to-path (dir)
    (add-to-list 'load-path
                 (format "%s/%s" eldir dir)))

  (add-to-path 'load) ; initialization
  (add-to-path 'packages) ; additional packages

  (let ((default-directory (format "%s/packages/" eldir)))
    (normal-top-level-add-subdirs-to-load-path))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'winsize)
(require 'fwr-backup)
(require 'fwr-visual)
(require 'fwr-tabbar)
(require 'fwr-hotkeys)
(require 'fwr-dired)
(require 'fwr-python-safe)

; Comment out unwanted
(require 'fwr-python)
(require 'fwr-flymake)
(require 'fwr-yas)
(require 'fwr-latex)
(require 'fwr-erlang)
(require 'init-company-mode)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;(desktop-save-mode 1) ; don't work with pymacs

;(require  'wcy-desktop)
;(wcy-desktop-init)

;(add-hook 'find-file-hook 'company-mode)
;(require 'auto-complete)
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/packages/autocomplete/ac-dict")

;(setq ac-dwim t)
;(setq ac-auto-start t)
;(setq ac-auto-show-menu t)
;(setq ac-quick-help-delay 0.2)
;(setq popup-use-optimized-column-computation nil)

;(ac-config-default)
;(global-auto-complete-mode t)

;(add-to-list 'load-path "/usr/share/emacs/site-lisp/company-mode")
;(autoload 'company-mode "company" nil t)

;(require 'ac-company)
; (ac-company-define-source ac-source-company-ropemacs company-ropemacs)
; (add-hook 'python-mode-hook
;        (lambda () 
;          (add-to-list 'ac-sources 'ac-source-company-ropemacs)))
;
;(require 'magit)
;(global-set-key "\C-xg" 'magit-status)

(require 'diminish)
(eval-after-load "flymake" '(diminish 'flymake-mode " FM"))
(eval-after-load "autopair" '(diminish 'autopair-mode " PM"))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode " HL"))
(eval-after-load "yasnippet" '(diminish 'yas/minor-mode " YS"))
(eval-after-load "pymacs" '(diminish 'ropemacs-mode " RM"))
(eval-after-load "company" '(diminish 'company-mode "CO"))
