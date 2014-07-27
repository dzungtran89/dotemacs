;;; wcx-web-mode.el -- Web-Mode setup
;;; Commentary:
;;; Code:

(when (locate-library "web-mode")
  (load-library "web-mode")

  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

  (setq web-mode-engines-alist
        '(("jinja2"    . "\\.html\\'")
          ))

  (when (locate-library "emmet-mode")
    (require 'emmet-mode)
    (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
    (add-hook 'html-mode-hook 'emmet-mode)
    (add-hook 'css-mode-hook 'emmet-mode)
    (add-hook 'web-mode-hook 'emmet-mode)))

(provide 'wcx-web-mode)
;;; wcx-web-mode.el ends here
