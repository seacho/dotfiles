(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Sync/orgfiles")
 '(org-export-html-postamble nil)
 '(org-export-with-toc nil)
 '(org-hide-leading-stars t)
 '(org-src-fontify-natively t)
 '(org-startup-folded 'overview)
 '(org-startup-indented t)
 '(package-selected-packages
   '(auto-complete avy benchmark-init cargo company-irony counsel elfeed
		   flycheck-rust forge ggtags git-gutter-fringe
		   git-timemachine gruber-darker-theme ht lv
		   org-bullets org-msg ox-hugo ox-reveal racer spinner
		   which-key yasnippet)))


(defun set-background-color ()
  (let ((os (if *is-a-mac* 'dark 'light)))
    (setq frame-background-mode os)))

(add-hook 'after-make-frame-functions 'set-background-color)


;;set frme position and size
;;(set-frame-position (selected-frame) 0 0)
(set-frame-size (selected-frame) 80 50)

;;(add-to-list 'default-frame-alist '(height . 40))
;;(add-to-list 'default-frame-alist '(width . 80))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
