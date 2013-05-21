
;; File containing M-x customize data

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-item-indent 0)
 '(ac-auto-show-menu 0.3)
 '(ac-delay 0.1)
 '(ac-disable-on-comment nil)
 '(ac-quick-help-delay 0.5)
 '(ac-quick-help-prefer-pos-tip nil)
 '(ac-sources (quote (ac-source-yasnippet ac-source-imenu ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-filename)) t)
 '(ac-stop-flymake-on-completing t)
 '(ansi-color-names-vector [solarized-bg red green yellow blue magenta cyan solarized-fg])
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-autoface-mode nil)
 '(aquamacs-customization-version-id 215 t)
 '(aquamacs-save-options-on-quit t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(backup-by-copying t)
 '(backup-by-copying-when-linked t)
 '(before-save-hook (quote (copyright-update time-stamp)))
 '(bibtex-BibTeX-entry-alist (quote (("Article" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication")) (("volume" "Volume of the journal") ("number" "Number of the journal (only allowed if entry contains volume)") ("pages" "Pages in the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)")) (("pages" "Pages in the journal") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication") ("volume" "Volume of the journal") ("number" "Number of the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Book" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book")) (("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Booklet" ((("title" "Title of the booklet (BibTeX converts it to lowercase)")) (("author" "Author1 [and Author2 ...] [and others]") ("howpublished" "The way in which the booklet was published") ("address" "Address of the publisher") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Conference" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)") ("booktitle" "Name of the conference proceedings") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("pages" "Pages in the conference proceedings") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)")) (("booktitle" "Name of the conference proceedings") ("pages" "Pages in the conference proceedings") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InBook" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("pages" "Pages in the book") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InCollection" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("pages" "Pages in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InProceedings" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)") ("booktitle" "Name of the conference proceedings") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("pages" "Pages in the conference proceedings") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)")) (("booktitle" "Name of the conference proceedings") ("pages" "Pages in the conference proceedings") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Manual" ((("title" "Title of the manual")) (("author" "Author1 [and Author2 ...] [and others]") ("organization" "Publishing organization of the manual") ("address" "Address of the organization") ("edition" "Edition of the manual as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("MastersThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the master's thesis (BibTeX converts it to lowercase)") ("school" "School where the master's thesis was written") ("year" "Year of publication")) (("type" "Type of the master's thesis (if other than \"Master's thesis\")") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Misc" (nil (("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the work (BibTeX converts it to lowercase)") ("howpublished" "The way in which the work was published") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("PhdThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the PhD. thesis") ("school" "School where the PhD. thesis was written") ("year" "Year of publication")) (("type" "Type of the PhD. thesis") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Proceedings" ((("title" "Title of the conference proceedings") ("year" "Year of publication")) (("booktitle" "Title of the proceedings for cross references") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("TechReport" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the technical report (BibTeX converts it to lowercase)") ("institution" "Sponsoring institution of the report") ("year" "Year of publication")) (("type" "Type of the report (if other than \"technical report\")") ("number" "Number of the technical report") ("address" "Address of the institution (if not part of field \"institution\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Unpublished" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the unpublished work (BibTeX converts it to lowercase)") ("note" "Remarks to be put at the end of the \\bibitem")) (("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication")))))))
 '(bibtex-entry-field-alist (quote (("Article" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication")) (("volume" "Volume of the journal") ("number" "Number of the journal (only allowed if entry contains volume)") ("pages" "Pages in the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)")) (("pages" "Pages in the journal") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication") ("volume" "Volume of the journal") ("number" "Number of the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Book" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book")) (("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Booklet" ((("title" "Title of the booklet (BibTeX converts it to lowercase)")) (("author" "Author1 [and Author2 ...] [and others]") ("howpublished" "The way in which the booklet was published") ("address" "Address of the publisher") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Conference" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)") ("booktitle" "Name of the conference proceedings") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("pages" "Pages in the conference proceedings") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)")) (("booktitle" "Name of the conference proceedings") ("pages" "Pages in the conference proceedings") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InBook" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("pages" "Pages in the book") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InCollection" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("pages" "Pages in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InProceedings" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)") ("booktitle" "Name of the conference proceedings") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("pages" "Pages in the conference proceedings") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)")) (("booktitle" "Name of the conference proceedings") ("pages" "Pages in the conference proceedings") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Manual" ((("title" "Title of the manual")) (("author" "Author1 [and Author2 ...] [and others]") ("organization" "Publishing organization of the manual") ("address" "Address of the organization") ("edition" "Edition of the manual as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("MastersThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the master's thesis (BibTeX converts it to lowercase)") ("school" "School where the master's thesis was written") ("year" "Year of publication")) (("type" "Type of the master's thesis (if other than \"Master's thesis\")") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Misc" (nil (("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the work (BibTeX converts it to lowercase)") ("howpublished" "The way in which the work was published") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("PhdThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the PhD. thesis") ("school" "School where the PhD. thesis was written") ("year" "Year of publication")) (("type" "Type of the PhD. thesis") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Proceedings" ((("title" "Title of the conference proceedings") ("year" "Year of publication")) (("booktitle" "Title of the proceedings for cross references") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("TechReport" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the technical report (BibTeX converts it to lowercase)") ("institution" "Sponsoring institution of the report") ("year" "Year of publication")) (("type" "Type of the report (if other than \"technical report\")") ("number" "Number of the technical report") ("address" "Address of the institution (if not part of field \"institution\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Unpublished" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the unpublished work (BibTeX converts it to lowercase)") ("note" "Remarks to be put at the end of the \\bibitem")) (("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication")))))))
 '(blink-cursor-mode nil)
 '(colon-double-space t)
 '(comint-input-ignoredups t)
 '(comint-move-point-for-output (quote this))
 '(comint-prompt-read-only nil)
 '(comint-scroll-to-bottom-on-input (quote this))
 '(compilation-scroll-output (quote first-error))
 '(copyright-query nil)
 '(cua-enable-cua-keys t)
 '(cua-enable-cursor-indications t)
 '(cua-enable-modeline-indications t)
 '(cua-normal-cursor-color (quote bar))
 '(cua-overwrite-cursor-color (quote hollow))
 '(cua-read-only-cursor-color (quote hbar))
 '(custom-safe-themes (quote ("d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(default-input-method "TeX")
 '(default-justification (quote left))
 '(delete-old-versions t)
 '(display-hourglass t)
 '(display-time-day-and-date t)
 '(ebib-index-display-fields (quote (year author title)))
 '(ebib-print-multiline t)
 '(ebib-sort-order (quote ((year) (author editor) (title))))
 '(edit-server-new-frame t)
 '(fci-rule-color "#073642")
 '(flycheck-g++-standard "c++0x")
 '(flycheck-gcc-standard "c99")
 '(flycheck-highlighting-mode (quote columns))
 '(flymake-gui-warnings-enabled t)
 '(flymake-max-parallel-syntax-checks 1)
 '(flymake-number-of-errors-to-display nil)
 '(flymake-run-in-place t)
 '(flyspell-auto-correct-binding "\363")
 '(flyspell-highlight-flag t)
 '(flyspell-issue-message-flag nil)
 '(flyspell-mode-line-string " Fly")
 '(flyspell-persistent-highlight nil)
 '(flyspell-use-meta-tab nil)
 '(fringe-mode 0 nil (fringe))
 '(google-translate-default-source-language "auto")
 '(google-translate-default-target-language "en")
 '(google-translate-enable-ido-completion t)
 '(initial-major-mode (quote lisp-interaction-mode))
 '(jedi:complete-on-dot t)
 '(jit-lock-defer-time nil)
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-files t)
 '(massimo-keyboard-comint-modes (quote (shell-mode comint-mode inferior-octave-mode inferior-emacs-lisp-mode)))
 '(massimo-keyboard-eshell-active t)
 '(massimo-keyboard-folding-meta-g-override-p t)
 '(massimo-keyboard-global-mode t)
 '(ns-right-alternate-modifier nil)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(org-agenda-current-time-string #("——————————————⌚⌚⌚—————————————" 0 30 (org-heading t)))
 '(org-agenda-search-headline-for-time nil)
 '(org-agenda-time-grid (quote ((daily today) "" (800 1000 1200 1400 1600 1800 2000))))
 '(org-hide-leading-stars t)
 '(org-highlight-latex-fragments-and-specials t)
 '(org-latex-to-pdf-process (quote ("pdflatex -interaction nonstopmode -output-directory %o %f" "bibtex %b" "pdflatex -interaction nonstopmode -output-directory %o %f" "pdflatex -interaction nonstopmode -output-directory %o %f")))
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-mac-protocol)))
 '(reb-re-syntax (quote string))
 '(require-final-newline (quote t))
 '(safe-local-variable-values (quote ((do-delete-whitespace) (eval quote (auto-fill-mode 1)) (eval quote (visual-line-mode -1)) (eval quote (auto-fill-mode -1)) (collaborations-turn-on-auto-fill . t) (collaborations-delete-whitespace) (default-justification . full) (TeX-source-correlate-method-active . source-specials) (ispell-default-dictionary . american) (TeX-PDF-mode . t))))
 '(save-place t nil (saveplace))
 '(save-place-file "~/.emacs.d/places")
 '(show-smartparens-global-mode t)
 '(smartparens-global-mode t)
 '(sp-autoinsert-if-followed-by-same 3)
 '(sp-highlight-pair-overlay nil)
 '(sp-wrap-repeat-last 2)
 '(time-stamp-format "%:y-%02m-%02d, %02H:%02M (%Z) %U")
 '(toe-max-length 10)
 '(toe-starting-time-per-word 5)
 '(toe-treat-words (quote downcase))
 '(toe-words-per-level 8)
 '(vc-annotate-background nil)
 '(version-control t)
 '(visual-line-mode nil t)
 '(winner-boring-buffers (quote ("*Completions*")))
 '(winner-dont-bind-my-keys t)
 '(winner-mode t nil (winner))
 '(yas-global-mode t nil (yasnippet))
 '(yas-prompt-functions (quote (yas-ido-prompt yas-completing-prompt))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error-face ((t (:underline "DodgerBlue1"))))
 '(flycheck-warning-face ((t (:underline "green"))))
 '(flymake-errline ((((class color)) (:underline "red"))) t)
 '(flymake-warnline ((((class color)) (:underline "yellow"))) t)
 '(flyspell-duplicate ((t (:strike-through "red"))))
 '(flyspell-incorrect ((t (:underline "red"))))
 '(font-lock-fixme-face ((((class color) (background dark)) (:background "Yellow" :foreground "Red" :underline nil))) t)
 '(powerline-active2 ((t (:inherit mode-line :background "grey30"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "gray22"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "gray22"))))
 '(writegood-duplicates-face ((t nil)))
 '(writegood-passive-voice-face ((t (:underline "red"))))
 '(writegood-weasels-face ((t (:strike-through "red")))))
