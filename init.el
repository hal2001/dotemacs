(provide 'init)

;;  Start time.
(setq emacs-load-start-time (current-time))


;;; Load emacs code and personal data. -------------------------------------------------------------------------
(setq default-elisp-path "~/config/emacs")
(setq default-elisp-3rdparties "~/config/emacs/3rdparties")

(setq load-path (cons 	default-elisp-path load-path ))
(setq load-path (cons 	default-elisp-3rdparties load-path ))
 
                       
(load-file "~/personal/emacs-data.el")

;;; Module(s) initialization -----------------------------------------------------------------------------------

;;{{{ *** Key binding rules ***
;;
;; FIXME Two of them do not work at all!
;; FIXME Some of them do not work in xterm
;; FIXME Many of them do not work in console
;;
;;
;;  One modifier for  intra-buffer operations (i.e. selection)
;;  Two modifiers for inter-buffer operations (i.e. navigation)
;;  Function keys for buffer processing (compile,check,...)
;;
;;  M-C-<arrow> for moving between windows 
;;  M-S-<arrow> for moving between buffers/screens
;;  CUA-selection on (C-<SPC) mark, C-<RET> rect.,C-z C-x C-c C-v)
;;  F2   for local  spell check  
;;  S-F2 for global spell check             
;;  M-Space for folding
;;  Tab for indent/auto-complete
;;  M-Tab for correct w.r.t. spellcheck (on Flyspell)
;;  

;; Moving in text
(global-set-key [C-left] 'backward-word) 
(global-set-key [C-right] 'forward-word)
(global-set-key [C-up]   'backward-sentence) 
(global-set-key [C-down] 'forward-sentence)

;; Moving in structes
(global-set-key [M-left] 'backward-sexp) 
(global-set-key [M-right] 'forward-sexp)
(global-set-key [M-up] 'backward-paragraph) 
(global-set-key [M-down] 'forward-paragraph)

;;; Possible keybinding for moving in text. Notice that 
;;; such kybindings are made for not leaving the homerow. 
;;; For me is quite premature to apply such bindings.

;; (local-set-key [(control j)] 'backward-char)
;; (local-set-key [(control l)]  'forward-char)
;; (local-set-key [(control i)] 'previous-line)
;; (local-set-key [(control k)]  'next-line)
;;  
;;  
;; (local-set-key [(meta j)]  'backward-word)
;; (local-set-key [(meta l)]   'forward-word)
;; (local-set-key [(meta i)] 'backward-sentence)
;; (local-set-key [(meta k)]  'forward-sentence)
;;  
;;  
;; (local-set-key [(control meta j)]  'backward-sexp)
;; (local-set-key [(control meta l)]   'forward-sexp)
;; (local-set-key [(control meta i)] 'backward-paragraph)
;; (local-set-key [(control meta k)]  'forward-paragraph)



;; Moving between buffers (M-S)
(global-set-key [M-S-up] 'previous-user-buffer) 
(global-set-key [M-S-down] 'next-user-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Managing windows [C-M]
; Moving
(global-set-key [M-C-right] 'windmove-right)
(global-set-key [M-C-left] 'windmove-left)
(global-set-key [M-C-up] 'windmove-up)
(global-set-key [M-C-down] 'windmove-down)
; Scrolling "other window"
(global-set-key [M-C-prior] 'scroll-other-window-down)
(global-set-key [M-C-next] 'scroll-other-window)
; Create and destroy windows
(global-set-key (kbd "M-C--") 'split-window-vertically)
(global-set-key (kbd "M-C-.") 'split-window-horizontally)
(global-set-key (kbd "M-C-<backspace>") 'delete-window)
(global-set-key (kbd "M-C-<return>") 'delete-other-windows)


;; Next/Prev error for Quickfix
(global-set-key [M-prior] 'previous-error) ; Does not work with LaTeX!
(global-set-key [M-next] 'next-error)

;; Spellcheck
(global-set-key (kbd "M-s") 'my-spell-correct-word)
(global-set-key [f2] 'ispell-buffer) 

;; Folding on/off (M-Space) 
(global-set-key "\M-\ " 'folding-toggle-show-hide) 

;; Tab is actually a "Smart tab"
;; (global-set-key [(tab)] 'smart-tab)

;; Remember notes.
(global-set-key [f5] 'org-remember)

;; Tweet your tweets
(global-set-key [f6] 'twit-post)
;;}}}


; Editor customization 
(require 'init-functions)    ;; Utility functions for configuration
(require 'init-preferences)  ;; Basic editor preferences
(require 'init-elscreen)     ;; ElScreen preferences
(require 'init-backup)       ;; Autosaves and backups behaviour
;; (require 'init-unstable)  ;; Features that are not yet stable

; Editor Utilities.
(require 'init-auto-complete)

; Programming Languages
(require 'init-python)

; Math packages
(when (boundp 'ask-latex )   (require 'init-latex))        ;; AucTeX
(when (boundp 'ask-maxima)   (require 'init-imaxima))      ;; Imaxima and Imath
(when (boundp 'ask-sage  )   (require 'init-sage))         ;; Sagemath 
(when (boundp 'ask-singular) (require 'init-singular))     ;; Singular 

; Applications
(when (boundp 'ask-mail  )   (require 'init-mail-wl))    ;; Wanderlust MUA + bbdb
(when (boundp 'ask-org-mode) (require 'init-org-mode))   ;; The famous ORG-Mode! Yaiii!!
(require 'init-editserver-chrome) ;; Edit text area on Google Chrome

(autoload 'twit-post "twit" "Frontend for twitter" t)   ;; Twitter Support
(when (boundp 'ask-twitter) (require 'twit))            ;; Explicit


;;; Things below here are still a little mess---------------------------------------------------------------------

;; Auto-mode for renamed config files
(setq auto-mode-alist (cons '("bashrc" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("zshrc" . sh-mode) auto-mode-alist))



;;{{{ *** Primary-Clipboard selection Panic! ***
;; Cut (C-x)  Copy(C-c) Paste(C-v) Undo(C-z)
;; S-<arrow> select, C-<Ret> rectangular mark, C-<SPC> mark
(transient-mark-mode t)
(delete-selection-mode t)
(cua-mode t)
(setq cua-keep-region-after-copy t)
(setq mouse-drag-copy-region nil)   ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)	; stops killing/yanking interacting with primary X11 selection 
(setq x-select-enable-clipboard t)	; makes killing/yanking interact with clipboard X11 selection
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
;; (when (string= (window-system) "x") 
(setq select-active-regions t)                 ; active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary) ; middle-click only pastes from primary X11 selection.
(setq yank-pop-change-selection t)             ; makes rotating the kill ring change the X11 clipboard.	
;;)                                 
;; shift + click select region
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore) ; turn off font dialog
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)
(put 'mouse-set-point 'CUA 'move)
;; XTerm support
(xterm-mouse-mode t)
(global-set-key [mouse-4] 'scroll-down)
(global-set-key [mouse-5] 'scroll-up)
;;}}}


;;{{{ *** Advanced editing customization ***
;;
;; Text mode by default, with auto-fill
(setq default-major-mode 'text-mode)
(setq text-mode-hook
      '(lambda nil
         (if (boundp 'ask-smallscreen)
             (setq fill-column 70)
           (setq fill-column 80)
           )
         (auto-fill-mode 1)
         ;;(orgtbl-mode 1)
         (flyspell-mode 1)  ; annoying spell checking 
         )
      )


;; Make buffer names unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator ":"
)

;; Ediff customization 
; (no external control frame) 
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
; (use vertical split if there is enough room)
(setq ediff-split-window-function 
      (lambda (&optional arg)
        (if (> (frame-width) 150)
            (split-window-horizontally arg)
          (split-window-vertically arg)
          )))



;; Save histories across sessions. Not buffers
(savehist-mode 1)


;; fixme highlight
(require 'fixme)

;; IDO mode for selection of file and buffers. VERY GOOD
(require 'ido)
(ido-mode t) 
(setq ido-enable-flex-matching t ; fuzzy matching is a must have
      ido-max-prospects 5        ; minibuffer is not saturated
      ido-ignore-buffers ;; ignore these guys
       '("\\` " "^\*Mess" "^\*Back" "^\*scratch" ".*Completion" "^\*Ido") 
      ido-everywhere t            ; use for many file dialogs
      ido-case-fold  t            ; be case-insensitive
      ido-auto-merge-werk-directories-length nil) ; all failed, no more digging


;; Moving between windows with (M-C-<arrow>)
(require 'windmove)               ; to load the package
(setq windmove-wrap-around t)

;; Folding
(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)
;;}}}


;;{{{ *** ELPA Managing: Emacs Lisp Package Archive ***
(when (require-maybe 'package)
  (package-initialize))
;;}}}


;;{{{ *** Spell Checking + Language Guessing ***
(setq ispell-process-directory (expand-file-name "~/"))

(defvar guess-language-rules                                            
  '(                    
    ("english" . "\\<\\(of\\|the\\|and\\|or\\|how\\)\\>")
    ("italiano" . "\\<\\(un\\|uno\\|una\\|il\\|lo\\|la\\|gli\\|le|\\|per\\|in\\)\\>")           
)                   
  "Alist of rules to determine the language of some text.               
Each rule has the form (CODE . REGEXP) where CODE is a string to        
identify the language (probably according to ISO 639), and REGEXP is a  
regexp that matches some very common words particular to that language. 
The default language should be listed first.  That will be the language 
returned when no REGEXP matches, as would happen for an empty           
document.")                                                             
                                                                         
(defun guess-buffer-language ()                                         
  "Guess language in the current buffer."                               
  (save-excursion 
        (goto-char (point-min))
        (let ((count (map 'list (lambda (x)
                                  (cons (count-matches (cdr x)) (car x)))
                          guess-language-rules)))
          (cdr (assoc (car (sort (map 'list 'car count) '>)) 
                      count)))))

(defun guess-language ()
  "Guess language in the current buffer."                               
  (interactive)                                                         
  (message (guess-buffer-language)))


    
(defun set-guessed-dictionary ()
   "It tries to guess the language and to set it as dictionary for ispell"
   (interactive)
   (let ( (language (guess-buffer-language)) )
     (if (null language)
         (message "Language unknown, ispell dictionary unchanged")
       (message "Guessing language: %s" language)
       (ispell-change-dictionary language))))

(add-hook 'find-file-hook  'set-guessed-dictionary)

;;}}}


;;{{{ *** Auto completion with SMART TAB *** 
;;
;; If a region is selected, indent.
;; If at the end of a symbol, complete
;; 

(defvar smart-tab-using-hippie-expand t
  "turn this on if you want to use hippie-expand completion.")

(setq hippie-expand-try-functions-list '(
                                         ;;yas/hippie-try-expand
                                         try-expand-dabbrev 
                                         try-complete-file-name-partially 
                                         try-expand-dabbrev-all-buffers 
                                         try-expand-dabbrev-from-kill 
                                         try-complete-file-name
                                         ;;try-expand-all-abbrevs
                                         try-expand-list 
                                         ;;try-expand-line 
                                         try-complete-lisp-symbol-partially 
                                         try-complete-lisp-symbol)
      )
 

(defun smart-tab (prefix)
  "Needs `transient-mark-mode' to be on. This smart tab is
minibuffer compliant: it acts as usual in the minibuffer.

In all other buffers: if PREFIX is \\[universal-argument], calls
`smart-indent'. Else if point is at the end of a symbol,
expands it. Else calls `smart-indent'."
  (interactive "P")
  (if (minibufferp)
      (minibuffer-complete)
    (if (smart-tab-must-expand prefix)
        (if smart-tab-using-hippie-expand
            (hippie-expand nil)
          (dabbrev-expand nil))
      (smart-indent))))


(defun smart-indent ()
  "Indents region if mark is active, or current line otherwise."
  (interactive)
  (if mark-active
      (indent-region (region-beginning)
                     (region-end))
    (indent-for-tab-command)))

(defun smart-tab-must-expand (&optional prefix)
  "If PREFIX is \\[universal-argument], answers no.
Otherwise, analyses point position and answers."
  (unless (or (consp prefix)
              mark-active)
   (looking-at "\\_>")))
;;}}}    


;;{{{ *** Color Schemes (ZenBurn or tty-dark) ***
;;
(require 'color-theme)
(require 'zenburn)
(color-theme-zenburn)   ;; High color theme (xterm-256color and X11)

;; Multi-TTY support
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-variable 'color-theme-is-global nil)
            (select-frame frame)
            (if (> (display-color-cells) 255)
                (color-theme-zenburn) ;; High color theme (xterm-256color and X11)
              (color-theme-tty-dark)) ;; Low color theme (xterm or linux console)
))

;;}}}



;;; Customization variables (in a separate file)----------------------------------------------------------------
(setq custom-file "~/config/emacs/custom.el")
(load custom-file 'noerror)

;; Loading time 
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds." (time-to-seconds (time-since emacs-load-start-time))))

;; Local Variables:
;; mode: emacs-lisp 
;; folded-file: t
;; End: 

