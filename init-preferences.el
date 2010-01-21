;;;
;;; Basic Editor customization
;;;
(provide 'init-preferences)
;;;-----------------------------------------------------------------

(set-default-font "Monospace-10")
(add-to-list 'default-frame-alist '(font . "Monospace-10"))
(scroll-bar-mode nil)
(tool-bar-mode nil)
(menu-bar-mode nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(blink-cursor-mode nil)
(setq search-highlight t)
(setq query-replace-highlight t)
(setq visible-bell nil)
(line-number-mode 1)
(setq x-stretch-cursor t)
(column-number-mode 1)
(show-paren-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p) ; y/n instead of yes/no
(setq confirm-kill-emacs 'y-or-n-p)

;;  Tab expansion
(setq-default indent-tabs-mode nil) ;; Expand tabs as spaces
(setq default-tab-width 4)


;; Scroll preferences
(setq scroll-preserve-screen-position 1)
(setq scroll-margin 0)
(setq scroll-conservatively 1000)

;; Local Variables:
;; mode: emacs-lisp 
;; folded-file: t
;; End: 
