;;;
;;; Utilities for robust and safe emacs usage.
;;;
(provide 'init-org-mode)
;;;------------------------------------------------------------------

(setq org-directory "~/personal/agenda/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-default-journal-file (concat org-directory "journal.org"))

(when (not (boundp 'org-agenda-files))
  (setq org-agenda-files (list org-directory))
  )

;;;-------------------------------------------------------------------

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq 
 org-log-done t
 ;;org-CUA-compatible t
 ;;org-support-shift-select t
 org-cycle-emulate-tab nil
 org-cycle-global-at-bob t
 org-highlight-latex-fragments-and-specials t
)


;; Org-mode Keys
(setq org-replace-disputed-keys t)
(setq org-disputed-keys '(
                         ([(tab)]      . [(meta tab)]) 
                         ([(shift up)]      . [(control è)]) 
                         ([(shift down)]    . [(control à)]) 
                         ([(shift left)]    . [(control ò) ])
                         ([(shift right)]   . [(control ù) ]) 
                         ([(meta  up)]      . [(meta è) ]) 
                         ([(meta  down)]    . [(meta à) ]) 
                         ([(meta  left)]    . [(meta ò) ])
                         ([(meta  right)]   . [(meta ù) ])
                         ([(meta  shift up)]      . [(control meta è) ]) 
                         ([(meta  shift down)]    . [(control meta à) ]) 
                         ([(meta  shift left)]    . [(control meta ò) ])
                         ([(meta  shift right)]   . [(control meta ù) ])
                         ([(control shift right)] . [(meta shift +)]) 
                         ([(control shift left)] . [(meta shift -)])
                         ))


(defun org-mode-setup-local-keys()
  "Define/>Undefine of org-mode keys"
  (interactive)
  (local-unset-key "\t")                     ; Use Tab for more decent things (auto-complete or yasnippet)
  (local-unset-key [tab])
  (local-unset-key [(tab)])
 
  (local-set-key (kbd "M-<tab>")    'org-cycle)  ; Use M-Tab for
                                                 ; org-cycle, which
                                                 ; avoid to use the
                                                 ; overloaded TAB key
  
  (local-set-key (kbd "M-SPC")      'org-cycle)  ; Use M-Space for
                                                 ; org-cycle, which is
                                                 ; similar to what I
                                                 ; use for
                                                 ; folding-toggle-show-hide
 
  
  ;; Seems to work in X window
  (local-set-key (kbd "C-è") 'org-shiftup    ) 
  (local-set-key (kbd "C-à") 'org-shiftdown  ) 
  (local-set-key (kbd "C-ò") 'org-shiftleft  ) 
  (local-set-key (kbd "C-ù") 'org-shiftright ) 
  
  ;; Seems to work in my Xterm
  (local-set-key "\e[27;5;232~" 'org-shiftup)
  (local-set-key "\e[27;5;224~" 'org-shiftdown)
  (local-set-key "\e[27;5;242~" 'org-shiftleft)
  (local-set-key "\e[27;5;249~" 'org-shiftright)
 
  (local-set-key (kbd "M-è") 'org-metaup    ) 
  (local-set-key (kbd "M-à") 'org-metadown  ) 
  (local-set-key (kbd "M-ò") 'org-metaleft  ) 
  (local-set-key (kbd "M-ù") 'org-metaright ) 
 
  ;; Xterm apparently does not generate such sequences.
  (local-set-key (kbd "C-M-è") 'org-shiftmetaup    ) 
  (local-set-key (kbd "C-M-à") 'org-shiftmetadown  ) 
  (local-set-key (kbd "C-M-ò") 'org-shiftmetaleft  ) 
  (local-set-key (kbd "C-M-ù") 'org-shiftmetaright ) 
 
  )


(defun orgtbl-mode-setup-local-keys()
  "Define/>Undefine of orgtbl-mode keys"
  ;; Org Table movements
  (define-key orgtbl-mode-map (kbd "M-ò") 'org-table-move-column-left)
  (define-key orgtbl-mode-map (kbd "M-ù") 'org-table-move-column-right)
  (define-key orgtbl-mode-map (kbd "M-è") 'org-table-move-row-up)
  (define-key orgtbl-mode-map (kbd "M-à") 'org-table-move-row-down)

  (define-key orgtbl-mode-map (kbd "C-M-ò") 'org-table-delete-column)
  (define-key orgtbl-mode-map (kbd "C-M-ù") 'org-table-insert-column)
  (define-key orgtbl-mode-map (kbd "C-M-è") 'org-table-kill-row)
  (define-key orgtbl-mode-map (kbd "C-M-à") 'org-table-insert-row)
  )

(add-hook 'org-mode-hook 'org-mode-setup-local-keys)
;(add-hook 'org-mode-hook 'orgtbl-mode-setup-local-keys)
(add-hook 'orgtbl-mode-hook 'orgtbl-mode-setup-local-keys)

(org-remember-insinuate)

;; Normally my private (and translated) configuration is used.
(when (not (boundp 'org-remember-templates))
  (setq org-remember-templates
        '(
          ("journal"        ?j "* %? %t\n\n  %i\n  %a\n\n" "journal.org")
          ("note"           ?n "* %? %T\n\n  %i\n  %a\n\n" "notes.org")
          ("meeting"        ?m "* TODO ⌚ %? %T\n\n  %i\n\n\n" "notes.org")
          ("deadline"       ?d "* TODO ⌚ %? %U\n  DEADLINE: %t\n\n  %i\n\n" "notes.org")
          ("event"          ?e "* %? %t--%t\n\n  %i\n  %a\n\n" "notes.org")
          )
        )
  )


;; Local Variables:
;; mode: emacs-lisp 
;; folded-file: t
;; End: 

