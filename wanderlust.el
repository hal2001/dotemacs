; mode: -*- emacs-lisp-*-

;; My addresses
(setq
 wl-from                private-email
 wl-user-address-list   private-emails-list
)

;; wanderlust conf file
(setq
  
  wl-interactive-send t       ;; Ask before sending message
  wl-interactive-exit t       ;; Ask before quit
  wl-stay-folder-window nil   ;; Folder window disappears 
  wl-summary-always-sticky-folder-list nil

  wl-auto-select-first  nil   ;; Do not open first message
  wl-auto-select-next   nil   ;; Go to the next folder when exit from summary

  wl-draft-buffer-style        'full
  wl-draft-reply-buffer-style  'split

  wl-forward-subject-prefix "Fwd: " ;; default is 'Forward: '
  
  wl-folder-window-width 30     ;; toggle on/off with 'l'
  
  wl-demo-display-logo nil

  wl-insert-message-id nil
  
  wl-draft-always-delete-myself t

  wl-folder-check-async t
  elmo-imap4-use-modified-utf7 t
  
  wl-temporary-file-directory "~/queue/"

  wl-summary-width 120
 
  elmo-localdir-folder-path "~/personal/mail/"

;; number temporary-mark persistent-mark date branch [ (number-of-children) sender ] subject
  wl-summary-line-format "%n%T%P%Y/%M/%D(%W) %t%[%30(%c %f%) %] %s"

  ;;wl-summary-showto-folder-regexp "\\(.sent.*|Inviata\\)"

  wl-thread-insert-opened t
  wl-thread-open-reading-thread t

)

;; Set mail-icon to be shown universally in the modeline.
(setq global-mode-string
      (cons
       '(wl-modeline-biff-status
         wl-modeline-biff-state-on
         wl-modeline-biff-state-off)
       global-mode-string))

;; Remove it when exiting. 
(add-hook 'wl-exit-hook
          '(lambda () 
             (setq global-mode-string
                   (delete  '(wl-modeline-biff-status
                              wl-modeline-biff-state-on
                              wl-modeline-biff-state-off) global-mode-string )
                   )
             ))


;; In case of a small screen we fix the previous settings.
(when (boundp 'ask-smallscreen)
(setq
 wl-stay-folder-window nil     ;; Folder window disappear 
 wl-summary-width 75
 wl-summary-line-format "%T%P%Y/%M/%D(%W)%t%[%20(%c %f%)%] %s"
 wl-draft-buffer-style        'full
 wl-draft-reply-buffer-style  'full
))

;; Keybindings
(define-key wl-summary-mode-map "w" 'wl-summary-write)
(define-key wl-summary-mode-map "a" 'wl-summary-reply-with-citation)
(define-key wl-summary-mode-map "A" 'wl-summary-reply-all-with-citation)
(define-key wl-summary-mode-map "f" 'wl-summary-forward)

(define-key wl-summary-mode-map "\M- " 'wl-thread-open-close)
(define-key wl-summary-mode-map "."    'wl-summary-redisplay)

(define-key wl-summary-mode-map "H"    nil)
(define-key wl-summary-mode-map "h"    'wl-summary-toggle-all-header)

(define-key wl-summary-mode-map "m"    'wl-summary-toggle-mime)


(define-key wl-summary-mode-map "c" nil) ;;remove previous "mark all as read"
(define-key wl-summary-mode-map "r" 'wl-summary-mark-as-read)
(define-key wl-summary-mode-map "R" 'wl-summary-mark-as-read-all)
(define-key wl-summary-mode-map "$" 'wl-summary-mark-as-important)

(define-key wl-summary-mode-map "u" 'wl-summary-unmark)
(define-key wl-summary-mode-map "U" 'wl-summary-unmark-all)

(define-key wl-summary-mode-map "d" 'wl-summary-dispose)
(define-key wl-summary-mode-map "D" 'wl-summary-delete)
(define-key wl-summary-mode-map "o" 'wl-summary-refile)

;; MIME-View keybindings for usage into the  
(add-hook 'mime-view-mode-hook 
          (lambda () 
            (local-unset-key "a" )
            (local-unset-key "f" )
            (local-unset-key "l" )
            (local-set-key "/" 'browse-url)
            (local-set-key "w" 'wl-summary-write)
 ;;           (local-set-key "A" 'wl-summary-reply-all-with-citation)
 ;;           (local-set-key "h"  'wl-summary-toggle-all-header)
            )
          )

;; Mail Viewing
(setq
  wl-message-ignored-field-list '("^.*:") ;; Ignored fields 
  wl-message-visible-field-list           ;; Visible list
  '("^\\(To\\|Cc\\):"

    "^Subject:"
    "^\\(From\\|Reply-To\\):"
    ;;"^Organization:"
    ;;"^Message-Id:"
    "^\\(Posted\\|Date\\):"
    )
  wl-message-sort-field-list
  '("^From"
    "^Organization:"
    "^X-Attribution:"
     "^Subject"
     "^Date"
     "^To"
     "^Cc")
)


;; Invert behaviour of with and without argument replies.
;; replay to the author
(setq wl-draft-reply-without-argument-list
  '(("Reply-To" ("Reply-To") nil nil)
     ("Mail-Reply-To" ("Mail-Reply-To") nil nil)
     ("From" ("From") nil nil)))

;; replay all
(setq wl-draft-reply-with-argument-list
  '(("Followup-To" nil nil ("Followup-To"))
     ("Mail-Followup-To" ("Mail-Followup-To") nil ("Newsgroups"))
     ("Reply-To" ("Reply-To") ("To" "Cc" "From") ("Newsgroups"))
     ("From" ("From") ("To" "Cc") ("Newsgroups"))))

;; Reply to all function...
(defun wl-summary-reply-all-with-citation (&optional arg)
  (interactive "P")
  (wl-summary-reply-with-citation t)
)


(defun djcb-wl-draft-subject-check ()
  "check whether the message has a subject before sending"
  (if (and (< (length (std11-field-body "Subject")) 1)
           (null (y-or-n-p "No subject! Send current draft?")))
      (error "Abort.")))
;; note, this check could cause some false positives; anyway, better
;; safe than sorry...
(defun djcb-wl-draft-attachment-check ()
  "if attachment is mention but none included, warn the the user"
  (save-excursion
    (goto-char 0)
    (unless ;; don't we have an attachment?
        
        (re-search-forward "^Content-Disposition: attachment" nil t)
      (when ;; no attachment; did we mention an attachment?
          (re-search-forward "attach\\|alleg\\|Attach\\|Alleg" nil t)
        (unless (y-or-n-p "Possibly missing an attachment. Send current draft?")
          (error "Abort."))))))

;; Check some misbehaviour before sending mails 
(add-hook 'wl-mail-send-pre-hook 'djcb-wl-draft-subject-check)
(add-hook 'wl-mail-send-pre-hook 'djcb-wl-draft-attachment-check)


;; (Insidious) Big Brother DataBase integration with WL
(require 'bbdb-wl)
(bbdb-wl-setup)

;; Fix some annoying behaviour with BBDB buffers.
;; (add-hook 'wl-summary-toggle-disp-folder-message-resumed-hook 'bbdb-wl-hide-bbdb-buffer)
(remove-hook 'wl-summary-toggle-disp-folder-message-resumed-hook 'bbdb-wl-show-bbdb-buffer)
(add-hook 'wl-message-redisplay-hook 'bbdb-wl-hide-bbdb-buffer)



;; exceptional folders against auto collection
(setq bbdb-wl-ignore-folder-regexp "^@")
;; shows the name of bbdb in the summary :-)

;; The following does not work with  wl-summary-showto-folder-regexp
;;(setq wl-summary-from-function 'bbdb-wl-from-func)
(setq wl-summary-from-function 'wl-summary-default-from)


(setq wl-summary-get-petname-function 'bbdb-wl-get-petname)

(define-key wl-draft-mode-map (kbd "<C-tab>") 'bbdb-complete-name)



;; IMAP settings (incoming mail)
(setq elmo-imap4-default-user   private-imap4-login ) 
(setq elmo-imap4-default-server private-imap4-server)
(setq elmo-imap4-default-port   private-imap4-port  )
(setq elmo-imap4-default-authenticate-type 'clear) 
(setq elmo-imap4-default-stream-type 'ssl)
(setq elmo-imap4-use-modified-utf7 t) 

;; SMTP settings (outgoing mail)
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user   private-smtp-login)
(setq wl-smtp-posting-server private-smtp-server)
(setq wl-smtp-posting-port   private-smtp-port  )
(setq wl-local-domain        private-smtp-domain)


;; Folder settings
(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-fcc "+sent")            ;; Local folders for saving sent messages
(setq wl-fcc-force-as-read t)    ;; Mails FCCed are set as read. 
(setq wl-draft-folder "+drafts") ;; IMAP folder is too slow for autosaves.
(setq wl-trash-folder private-imap4-trash) ;; Trash folder is online.

  ;; check this folder periodically, and update modeline
(setq 
 wl-biff-check-folder-list '("%inbox") ;; check every 180 seconds
 wl-biff-check-interval    180
)

;; Add reverse ordering 
(defun wl-summary-overview-entity-compare-by-rdate (x y)
  (wl-summary-overview-entity-compare-by-date y x)
  )
(defun wl-summary-overview-entity-compare-by-rnumber (x y)
  (wl-summary-overview-entity-compare-by-number y x)
  )
(add-to-list 'wl-summary-sort-specs 'rnumber)
(add-to-list 'wl-summary-sort-specs 'rdate)


;; Put cursor at the beginning if reverse sorted
;;(defadvice wl-summary-rescan (after wl-summary-rescan-move-cursor activate)
;;  (if (string-match "^r" (ad-get-arg 0))
;;      (wl-summary-display-top)
;;    )  
;;)
