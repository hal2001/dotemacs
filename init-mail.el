;;;
;;; These setting only involves writing/sending mail. Mail reading is not done
;;; in Emacs.
;;;------------------------------------------------------------------


;;
;; Sending emails
;;

(setq smtpmail-smtp-server private-smtp-server)
(setq smtpmail-smtp-service  private-smtp-port)
(setq sendmail-program (executable-find "msmtp"))

(if sendmail-program
    (progn ;; msmtp
      (setq send-mail-function 'sendmail-send-it)
      (setq message-send-mail-function 'message-send-mail-with-sendmail))
  (progn ;; emacs smtpmail
    (setq send-mail-function 'smtpmail-send-it)
    (setq message-send-mail-function 'message-smtpmail-send-it)))



;;
;; Composing emails
;;

(define-key global-map "\C-cm" 'compose-mail)

(setq compose-mail-user-agent-warnings nil)
(setq mail-user-agent 'message-user-agent)
(setq message-default-mail-headers "Cc: \nBcc: \n")
(setq message-signature private-email-signature)
(setq message-auto-save-directory "~/personal/mail/drafts")
(setq message-kill-buffer-on-exit t)

(defun setup-message-mode ()
  "Setup editor for emails"
  (interactive)
  (require 'bbdb-com nil t)
  (auto-fill-mode 1)
  (set-fill-column 70)
  (define-key message-mode-map [f2] 'ispell-message))

(add-hook 'message-mode-hook 'setup-message-mode)


; setup emacs to edit for mutt.
(defun setup-post-mode ()
  "Setup editor for post-mode"
  (interactive)
  (require 'bbdb-com nil t)
  (set (make-local-variable 'mail-header-separator) "")
  (set-fill-column 70)
  (define-key post-mode-map [f2] 'ispell-message))

(use-package post
  :mode ("mutt-[a-z0-9]+-[0-9]+-[0-9]+.*\\'" . post-mode)
  :config
  (add-hook 'post-mode-hook 'setup-post-mode))



;;
;; BBDB
;;

(use-package bbdb
  :ensure t
  :pin gnu
  :commands (bbdb bbdb-complete-mail bbdb-complete-name)
  :config
  (bbdb-initialize))

;; Say NO! to auto collection
(setq bbdb/mail-auto-create-p nil)
(setq bbdb-north-american-phone-numbers-p nil)

;; automatically add mailing list fields
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
(setq bbdb-auto-notes-alist '(("X-ML-Name" (".*$" ML 0))))

(setq

    bbdb-file "~/personal/agenda/contacts.bbdb"

    bbdb-offer-save 1                        ;; 1 means save-without-asking

    bbdb-use-pop-up nil                      ;; allow popups for addresses
    bbdb-electric-p t                        ;; be disposable with SPC
    bbdb-popup-target-lines  1               ;; very small

    bbdb-dwim-net-address-allow-redundancy t ;; always use full name
    bbdb-quiet-about-name-mismatches t       ;; show name-mismatches 2 secs

    bbdb-always-add-address t                ;; add new addresses to existing...
                                             ;; ...contacts automatically
    bbdb-canonicalize-redundant-nets-p nil   ;; x@foo.bar.cx => x@bar.cx

    bbdb-completion-type nil                 ;; complete on anything

    bbdb-complete-name-allow-cycling t       ;; cycle through matches
                                             ;; this only works partially

    bbbd-message-caching-enabled t           ;; be fast
    bbdb-use-alternate-names t               ;; use AKA

    bbdb-elided-display t                    ;; single-line addresses

    bbdb-send-mail-style 'message
)


(provide 'init-mail)
;; Local Variables:
;; mode: emacs-lisp
;; End:
