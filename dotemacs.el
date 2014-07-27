;;; dotemacs.el --- Madness starts here

;;; Commentary:
;; WaRCHieFX's .emacs file, use at you own risk
;; --------------------------------------------

;;; Code:
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(blink-cursor-mode 0)

(setq load-prefer-newer t)

;; ----- Standard Loadpath
(setq site-lisp-path "~/.emacs.d/site-lisp/")
(setq site-wcx-path "~/.emacs.d/site-wcx/")
(add-to-list 'load-path site-lisp-path)
(add-to-list 'load-path site-wcx-path)

;; Move custom definitions to another place.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

; Use the system clipboard
(setq x-select-enable-clipboard t)

(setq emacs-load-start-time (current-time))

;; Custom stuff
;; (require 'wcx-evil)
(require 'wcx-package)
(require 'wcx-requirements)
(require 'wcx-generic)
(require 'wcx-utils)
(require 'wcx-keybindings)
(require 'wcx-icicles)
;; (require 'wcx-iswitchb)
(require 'wcx-ido)
(require 'wcx-color-theme)
(require 'wcx-modeline)
(require 'wcx-helm)
(require 'wcx-encryption)

;; Tools
(require 'wcx-org)
;; (require 'wcx-w3m)
(require 'wcx-gnus)
;;(require 'wcx-gnus-nnrss)
;;(require 'wcx-bbdb)
(require 'wcx-tramp)
;;(require 'wcx-svn)
(require 'wcx-git)
(require 'wcx-mercurial)
(require 'wcx-templates)
(require 'wcx-cedet)
;;(require 'wcx-elib)
;;(require 'wcx-ecb)
;;(require 'wcx-jabber)
;;(require 'wcx-companymode)
;;(require 'wcx-minimap)
(require 'wcx-flycheck)
(require 'wcx-projects)

;; Programming Modes
;;(require 'wcx-java)
(require 'wcx-malabar)
(require 'wcx-xml)
;;(require 'wcx-nxhtml)
(require 'wcx-web-mode)
(require 'wcx-python)
;;(require 'wcx-slime)
(require 'wcx-lua)
;;(require 'wcx-go)
(require 'wcx-javascript)
;;(require 'wcx-scala)
(require 'wcx-auto-complete)
(require 'wcx-jinja2)

;; Games
;; (require 'wcx-nethack)

;; ----- Make this file be recompiled after it's saved
(defun byte-compile-user-init-file ()
  "Byte-compile the user init file."
  (let ((byte-compile-warnings '(unresolved)))
    ;; in case compilation fails, don't leave the old .elc around:
    (if (file-exists-p (concat user-init-file ".elc"))
	(delete-file (concat user-init-file ".elc")))
    (byte-compile-file user-init-file)
    (message "%s compiled" user-init-file)
    ))
(defun my-emacs-lisp-mode-hook ()
  "Compile .emacs after it's saved."
  (when (equal buffer-file-name user-init-file)
    (add-hook 'after-save-hook 'byte-compile-user-init-file t t)))
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

;; Start emacs-server, for emacsclient usage.
(server-start)

(prefer-coding-system 'utf-8)

(message "Emacs startup time: %d seconds."
         (time-to-seconds (time-since emacs-load-start-time)))

(put 'upcase-region 'disabled nil)

(defmacro diminish-afterload (package-name mode)
  "After loading PACKAGE-NAME, diminish MODE."
  `(eval-after-load ,package-name
     '(diminish ,mode)))

(when (locate-library "diminish")
  (require 'diminish)
  
  (diminish-afterload "magit" 'magit-auto-revert-mode)
  (diminish-afterload "guide-key" 'guide-key-mode)
  (diminish-afterload "whitespace-cleanup-mode" 'whitespace-cleanup-mode)
  (diminish-afterload "emmet-mode" 'emmet-mode))

(provide '.emacs)
;;; .emacs ends here
