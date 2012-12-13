;;; init-server.el --- setup Emacs as a server.

;; Copyright (C) 2012  Massimo Lauria

;; Author: Massimo Lauria <lauria.massimo@gmail.com>
;; Keywords:

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

;; Contains the code for starting server. Both for emacs client and
;; for Google Chrome "Edit with emacs"

;;; Code:

;; Launch server in MacOSX (on Linux I use Xsession)
(require 'server nil t)
(when (fboundp 'server-running-p) ; not defined in emacs 22
  (if (and running-MacOSX
           (not (server-running-p)))
      (server-start)))


;; Edit text area on Google Chrome
(when (and (fboundp 'server-running-p)
           (server-running-p)
           (locate-library "edit-server"))
  (require 'edit-server)
  (edit-server-start))


(provide 'init-server)
;;; init-clipboard.el ends here