;;; init-buffer-navigation --- Automatic test insertion configuration

;; Copyright (C) 2012  Massimo Lauria

;; Author: Massimo Lauria <lauria.massimo@gmail.com>
;; Time-stamp: <2012-03-05, 12:59 (CET) Massimo Lauria>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is the part of my init files devoted to buffer navigation
;; there are several types of buffer navigation:
;; `pattern-exp', `hasfile', `majormode', `emacs', `default'

;, Based on code and ideas of Xaa Lee (http://ergoemacs.org/)
;; and Jakub Jankiewicz (http://jcubic.wordpress.com/2012/01/26/switching-between-buffers-with-the-same-major-mode-in-emacs/)



;; Configuration variables -------------------------------------------------------

(defvar buffer-navigation-method-list '(pattern-exp emacs hasfile majormode default)
  "All possible values for `buffer-navigation-method'")

(defvar buffer-navigation-method 'pattern-exp
  "Functions `next-buffer-smart' and `previous-buffer-smart'
  decide the next buffer to move to according to the choosen
  method.

  `pattern-exp' -- uses a whitelist/blacklist approach. See variables `user-buffer-whitelist'/`user-buffer-blacklist'.

  `emacs' -- buffer not matched by `user-buffer-whitelist'/`user-buffer-blacklist'. Probably buffer created by Emacs.

  `hasfile' -- moves to buffers corresponding to files on the filesystem.

  `majormode' -- moves to buffers with the same major-mode.

  `default' -- uses the default emacs `next-buffer'/`previous-buffer' pair.
")

(defvar user-buffer-whitelist '(or "^*scratch*" "^*Remember*" "^*shell*" "^*Python*" "^*mail*" "^*draft*" "^*info" rcirc-mode)
  "Determines the whitelist pattern for `next-buffer-smart' in
case `buffer-navigation-method' is `pattern-exp'. Such pattern is
a boolean expression: the leaves are either modes or regexp, and
the internal nodes are arbitrary functions. Leafs are matched if
the buffer has the specified mode or if the name matches the
rexexp.

A buffer which is matched by the expression is always considered a buffer of the user.
")

(defvar user-buffer-blacklist '(or "^*" "\.pdfsync" (and "\\.log" latex-mode) "contacts.bbdb")
  "Determines the whitelist pattern for `next-buffer-smart' in
case `buffer-navigation-method' is `pattern-exp'. Such pattern is
a boolean expression: the leaves are either modes or regexp, and
the internal nodes are arbitrary functions. Leafs are matched if
the buffer has the specified mode or if the name matches the
rexexp.

A buffer which is matched by the expression is never considered a buffer of the user.
")



;; Useful functions -------------------------------------------------------

(defun decorate-formula (F sexp-arg)
  "Given an S-exp, it descend in all subtrees to apply function F
to the leaves of a formula (i.e.\ tokens).

The resulting formula is a similar S-exp in which each tokens t is substituted by
the result of (F t)
"
  (cond
   ( (listp sexp-arg)
     (cons (car sexp-arg) (mapcar '(lambda (l) (decorate-formula F l)) (cdr sexp-arg)))
     )
   ( 't (funcall F sexp-arg))
   )
  )


;; string-match-p does not exists before Emacs 23
(unless (fboundp 'string-match-p)
(defun string-match-p (pattern text)
  "It is a substitution of the noe in Emacs 23 and above.
This function is equivalent to `string-match' but preserves match
data"
  (save-match-data
    (string-match pattern text) ) )
)

(defun user-buffer-match-p (rule buffer-name-arg)
  "Decide if the buffer matches a rule in a list like
`user-buffer-whitelist' or `user-buffer-blacklist'. If the rule
is a string then it has to match the name, if it is a mode, it
has to match the mode, if it is a function which accept one arg,
then the function is evaluated"
  (cond
   ( (stringp   rule)  (string-match-p rule buffer-name-arg))   ; Test the buffer name.
   ( (and (symbolp   rule)
          (string-match-p "-mode$" (symbol-name rule))
          ) (eq (get-buffer-major-mode buffer-name-arg) rule)) ; Test if mode matches.
   ( (functionp rule)  (funcall rule buffer-name-arg))          ; Eval an arbitrary test function
   )
  )


(defun user-buffer-p (buffer-name-arg)
  "Test whether the buffer is actually a \"user buffer\", meaning
it not one of the ugly buffers generated by AucTeX or Emacs.

variable \'user-buffer-blacklist\' and \'user-buffer-whitelist\' define a series of rules to decide.
"
  (or
   (eval (decorate-formula '(lambda (x) (list 'user-buffer-match-p  `(quote ,x) buffer-name-arg)) user-buffer-whitelist ))
   (not
    (eval (decorate-formula '(lambda (x) (list 'user-buffer-match-p `(quote ,x) buffer-name-arg)) user-buffer-blacklist ))
    )
   )
  )



;; Commands ---------------------------------------------------------------------------

(defun next-buffer-pattern-exp ()
  "Switch to the next user buffer. User buffers are decided with
`user-buffer-p' predicate, and in particular by
`user-buffer-blacklist' and `user-buffer-whitelist'.
"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (user-buffer-p (buffer-name))) (< i 50) )
      (setq i (1+ i)) (next-buffer) )))

(defun previous-buffer-pattern-exp ()
  "Switch to the previous user buffer. User buffers are decided with
`user-buffer-p' predicate, and in particular by
`user-buffer-blacklist' and `user-buffer-whitelist'.
"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (user-buffer-p (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))


(defun next-buffer-emacs ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (user-buffer-p (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))


(defun previous-buffer-emacs ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (user-buffer-p (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))


(defun next-buffer-emacs ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (user-buffer-p (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))


(defun previous-buffer-emacs ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (user-buffer-p (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun move-buffer-majormode (change-buffer-fun)
  (let ((current-mode major-mode)
        (next-mode nil))
    (while (not (eq next-mode current-mode))
      (funcall change-buffer-fun)
      (setq next-mode major-mode))))

(defun previous-buffer-majormode ()
  "Switch to the previous buffer with the same major mode."
  (interactive)
  (move-buffer-majormode #'previous-buffer))

(defun next-buffer-majormode ()
  "Switch to the next buffer with the same major mode."
  (interactive)
  (move-buffer-majormode #'next-buffer))

(defun move-buffer-hasfile (change-buffer-fun)
  (interactive)
  (funcall change-buffer-fun)
  (let ((i 0))
    (while (and (not (buffer-file-name)) (< i 50))
      (setq i (1+ i)) (funcall change-buffer-fun) )))

(defun previous-buffer-hasfile ()
  "Switch to the previous buffer with the same major mode."
  (interactive)
  (move-buffer-hasfile #'previous-buffer))

(defun next-buffer-hasfile ()
  "Switch to the next buffer with the same major mode."
  (interactive)
  (move-buffer-hasfile #'next-buffer))


(defun previous-buffer-smart ()
  (interactive)
  (cond ((eq buffer-navigation-method 'pattern-exp) (previous-buffer-pattern-exp))
        ((eq buffer-navigation-method 'emacs) (previous-buffer-emacs))
        ((eq buffer-navigation-method 'hasfile) (previous-buffer-hasfile))
        ((eq buffer-navigation-method 'majormode) (previous-buffer-majormode))
        ((eq buffer-navigation-method 'default) (previous-buffer))
        (t previous-buffer)))

(defun next-buffer-smart ()
  (interactive)
  (cond  ((eq buffer-navigation-method 'pattern-exp) (next-buffer-pattern-exp))
         ((eq buffer-navigation-method 'emacs) (next-buffer-emacs))
         ((eq buffer-navigation-method 'hasfile) (next-buffer-hasfile))
         ((eq buffer-navigation-method 'majormode) (next-buffer-majormode))
         ((eq buffer-navigation-method 'default) (next-buffer))
         (t next-buffer)))


(defun next-buffer-navigation-method ()
  "Switch to the next method of buffer navigation."
  (interactive)
  (when buffer-navigation-method-list
    (let ((first (car buffer-navigation-method-list)))
      (setq buffer-navigation-method-list
            (cdr buffer-navigation-method-list))
      (add-to-list 'buffer-navigation-method-list first t)
      (setq buffer-navigation-method (car buffer-navigation-method-list))
      (message (concat "Buffer navigation mode: " (symbol-name buffer-navigation-method)))
      )))

(defun previous-buffer-navigation-method ()
  "Switch to the previous method of buffer navigation."
  (interactive)
  (when buffer-navigation-method-list
    (let ((revl (reverse buffer-navigation-method-list)))
      (setq buffer-navigation-method (car revl))
      (setq buffer-navigation-method-list
            (cons buffer-navigation-method (reverse (cdr revl))))
      (message (concat "Buffer navigation mode: " (symbol-name buffer-navigation-method)))
      )))

(provide 'init-buffer-navigation)
;;; init-autotype.el ends here
