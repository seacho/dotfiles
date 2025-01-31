
;;lsp-mode
;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (c-mode . lsp)
;;          (c++-mode . lsp)
;;          (python-mode . lsp)
;; 	 (objc-mode . lsp)
;;          ;; If you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp
;;   :ensure t
;;   )


;; Auto completion
;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;   (ac-config-default)
;;   (global-auto-complete-mode t)))

;; bring up help for key bindings
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; on the fly syntax checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; snippets and snippet expansion
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))


;; tags for code navigation
(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
  (lambda ()
  (when (derived-mode-p 'c-mode 'c++-mode 'python-mode)
  (ggtags-mode 1))))
)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  ;;(setq company-minimum-prefix-length 3)
  (global-company-mode t)
  )

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
