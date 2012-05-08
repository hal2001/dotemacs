;;; init-cc-mode.el --- Setup for C/C++ programming modes

;; Copyright (C) 2012  Massimo Lauria

;; Author: Massimo Lauria <lauria.massimo@gmail.com>
;; Time-stamp: <2012-05-08, 14:37 (CEST) Massimo Lauria>

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

;; This is my setup for C/C++ code.

;; CC-mode
(add-hook 'c-mode-hook '(lambda ()
        (local-set-key (kbd "RET") 'newline-and-indent)
        (when (fboundp 'semantic-mode)
          (semantic-mode t)
          )))

(provide 'init-cc-mode)
;;; init-autotype.el ends here
