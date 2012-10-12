;;; wcx-generic.el --- Generic customizations.
;;
;; Filename: wcx-generic.el
;; Description:
;; Author: Ricardo Restituyo
;; Created: Wed Oct 22 11:18:50 2008
;;
;; Last-Updated: Thu May 19 12:18:40 2011 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(which-func-mode t)
(menu-bar-mode 0)
(setq frame-title-format "emacs [%b]"
      icon-title-format "emacs [%b]"
      scroll-conservatively 1)
(windmove-default-keybindings 'meta)

;; ----- FontRelated Stuff
(setq emacs-font "Envy Code R-11")
;; (setq emacs-font "PragmataPro-11")
;;(setq emacs-font "Mensch-10.5")
;; (set-frame-font emacs-font)
(set-face-attribute 'default nil :font emacs-font)

;;; It is always better to know current line and column number
(column-number-mode t)
(line-number-mode t)

;;; Overwrite selection
(delete-selection-mode t)

;;; Make all yes-or-no questions as y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;; Change cursor into a bar instead of a block
(setq-default cursor-type 'bar)

;; Highlight parentheses according to nesting level
(when (locate-library "highlight-parentheses")
  (require 'highlight-parentheses)
  (add-hook 'find-file-hooks 'highlight-parentheses-mode))

(put 'narrow-to-region 'disabled nil)

                                        ;(global-hl-line-mode 1)
                                        ;(set-face-background 'hl-line "#111")

(add-hook 'conf-javaprop-mode-hook
          '(lambda () (conf-quote-normal nil)))

(winner-mode 1)

;; Some hooks
;; (add-hook 'term-mode-hook '(lambda () (yas/minor-mode nil)))
(add-hook 'python-mode-hook '(lambda () (yas/minor-mode 1)))

(mouse-avoidance-mode 'cat-and-mouse)

;; Buffer naming strategy
(require 'uniquify)

(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))


(when (locate-library "yascroll")
  (load-library "yascroll")
  (global-yascroll-bar-mode 1))

;; (when (locate-library "smooth-scroll")
;;   (load-library "smooth-scroll")
;;   (smooth-scroll-mode))

(when (locate-library "json")
  (load-library "json"))

(when (locate-library "ido-ubiquitous")
  (load-library "ido-ubiquitous"))

(when (locate-library "rfringe")
  (load-library "rfringe"))

(when (locate-library "adaptive-wrap")
  (load-library "adaptive-wrap"))

(when (locate-library "smart-mode-line")
  (load-library "smart-mode-line")
  (sml/setup))

(when (locate-library "dpaste")
  (load-library "dpaste"))

(when (locate-library "emacsd-tile")
  (load-library "emacsd-tile"))

(when (locate-library "frame-tag")
  (load-library "frame-tag")
  (frame-tag-mode 1))

(when (locate-library "git-commit")
  (load-library "git-commit"))

(when (locate-library "hideshowvis")
  (load-library "hideshowvis")
  (hideshowvis-minor-mode 1))

(when (locate-library "loccur")
  (load-library "loccur")

  ;; defines shortcut for loccur of the current word
  (define-key global-map [(control o)] 'loccur-current)
  ;; defines shortcut for the interactive loccur command
  (define-key global-map [(control meta o)] 'loccur)
  ;; defines shortcut for the loccur of the previously found word
  (define-key global-map [(control shift o)] 'loccur-previous-match))

(when (locate-library "dropdown-list")
  (load-library "dropdown-list"))

(when (locate-library "multiple-cursors")
  (load-library "multiple-cursors")
  (global-set-key (kbd "C-#") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(provide 'wcx-generic)
