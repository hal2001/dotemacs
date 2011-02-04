;;;
;;; Basic Editor customization
;;;
;;;-----------------------------------------------------------------

;; Regular fonts
(setq
 font-X11-no-antialias "-misc-fixed-medium-r-normal--18-*-*-*-*-*-iso10646-1"
 font-X11-antialias    "Monospace-10"
 ;; font-Mac-antialias    "Monaco-12"
 font-Mac-antialias    "-apple-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman"
 )

;; Bigger fonts
(when (and (boundp 'prefs-activate-bigfont) prefs-activate-bigfont)
  (setq
   font-X11-no-antialias "-misc-fixed-medium-r-normal--20-*-*-*-*-*-iso10646-1"
   font-X11-antialias    "Monospace-14"
   ;; font-Mac-antialias    "Monaco-14"
   font-Mac-antialias    "-apple-dejavu sans mono-medium-r-normal--20-0-0-0-m-0-mac-roman"
   ))

;; Meta usage in MacOSX requires some thought
(when running-NSCocoa-process
  (if (boundp 'ns-right-alternate-modifier)
      (progn
        (setq ns-alternate-modifier 'meta)
        (setq ns-right-alternate-modifier 'nil))
    (setq ns-alternate-modifier 'nil)
    )
)

;;; Visual preferences for Emacs 23 and above

;; Font aliases are supported
;; BUG: color-theme-zenburn must be loaded AFTER setting the fonts.

;; Try to set a load-path color-theme as a custom package.
(when running-MacOSX
  (setq MacUser-color-theme-path (concat MacUser-site-lisp "/color-theme"))
  (if (file-directory-p MacUser-color-theme-path)
      (setq load-path (cons MacUser-color-theme-path load-path)))
)

(unless running-GNUEmacs22  ;; Default font for Emacs >22.
  ;; Aquamacs main font
  (when-running-MacOSX
   (set-default-font font-Mac-antialias)
   (add-to-list 'default-frame-alist `(font . ,font-Mac-antialias))
   )
  ;; X11 main font
  (when-running-GNULinux
   (set-default-font font-X11-antialias)
   (add-to-list 'default-frame-alist `(font . ,font-X11-antialias))
   )
  ;; Color theme (not available on default Emacs22 for MacOSX)
  (when (require-maybe 'color-theme)
   (require-maybe 'zenburn)
   (when-available 'color-theme-zenburn (color-theme-zenburn)))
  )

;;; Visual preferences for Emacs 22

;; Font aliases are not supported. I have to use the horrible barbwire syntax
;; BUG: color-theme-zenburn must be loaded BEFORE setting the fonts.

;; Font for system with no anti-alias support (e.g. Emacs 22 on X11).
(when running-GNUEmacs22
  ;; Color theme (not available on default Emacs22 for MacOSX)
  (when (require-maybe 'color-theme)
   (require-maybe 'zenburn)
   (when-available 'color-theme-zenburn (color-theme-zenburn)))
  ;; Default fonts
  (when running-GNULinux (set-default-font font-X11-no-antialias))
  )



;; Calendar localization
(setq calendar-week-start-day 1
      calendar-day-name-array ["Domenica" "Lunedì" "Martedì" "Mercoledì"
                               "Giovedì" "Venerdì" "Sabato"]
      calendar-month-name-array ["Gennaio" "Febbraio" "Marzo" "Aprile" "Maggio"
                                 "Giugno" "Luglio" "Agosto" "Settembre"
                                 "Ottobre" "Novembre" "Dicembre"])

(when-available 'scroll-bar-mode (scroll-bar-mode -1)) ;; scroll-bar-mode undefined in terminal emacs!
(when-available 'tool-bar-mode   (tool-bar-mode -1)  ) ;;   tool-bar-mode undefined in terminal emacs!
(menu-bar-mode -1)
(when-available 'tabbar-mode     (tabbar-mode -1)    ) ;;     tabbar-mode defined only in Aquamacs


(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(blink-cursor-mode nil)
(setq visible-bell nil)

(setq search-highlight t)
(setq query-replace-highlight t)

(line-number-mode 1)
(column-number-mode 1)

(setq x-stretch-cursor t)
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

;; Canonical behaviour of modern interfaces. Not the default in Emacs22
;; Cut (C-x)  Copy(C-c) Paste(C-v) Undo(C-z)
;; S-<arrow> select, C-<Ret> rectangular mark, C-<SPC> mark
(transient-mark-mode t)
(delete-selection-mode t)
(cua-mode t)


(setq cua-keep-region-after-copy t)


;;(setq warning-minimum-level :error)
(setq frame-title-format '( " " "%[%b%]" " [%*] %p" "  <%@" invocation-name "@" (:eval (system-name)) ">"))


(provide 'init-preferences)
;; Local Variables:
;; mode: emacs-lisp
;; folded-file: t
;; End:
