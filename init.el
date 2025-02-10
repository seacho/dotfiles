
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(defvar my-debug t "Enable debug mode.")

(setq *is-a-mac* (eq system-type 'darwin))
(setq *win64* (eq system-type 'windows-nt))
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )

(load "~/.emacs.d/custom.el")
(setq custom-nw-file "~/.emacs.d/custom-nw.el")
(setq custom-gui-file "~/.emacs.d/custom-gui.el")
(if (display-graphic-p)
	(progn
	  (setq custom-file custom-gui-file))
        (progn
	  (setq custom-file custom-nw-file)
          ;; other settings
	  ))
(load custom-file)


(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http_proxy" . "http://127.0.0.1:12334")
     ("https_proxy" . "http://127.0.0.1:12334")
     ("all_proxy" . "socks5://127.0.0.1:12334")))

;; use-package
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
;;(print package-archives)
(package-initialize)
(eval-when-compile
  (require 'use-package))

;;benchmark 统计时间
(use-package benchmark-init
  :ensure t
  :init (benchmark-init/activate)
  :hook (after-init. benchmark-init/deactivate))


(load "~/.emacs.d/init-search.el")

(load "~/.emacs.d/init-org.el")


;;markdown
;; (use-package markdown-mode
;;   :ensure t
;;   :mode ("README\\.md\\'" . gfm-mode)
;;   :init (setq markdown-command "multimarkdown"))


(load "~/.emacs.d/init-editaux.el")

(load "~/.emacs.d/init-rust.el")

;; rss
(use-package elfeed
  :ensure t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;C-x C-b's action list-buffers is too useless
(defalias 'list-buffers 'ibuffer)
;; (defalias 'list-buffers 'ibuffer-other-window)

; If you like a tabbar 
;(use-package tabbar
;  :ensure t
;  :config
;  (tabbar-mode 1))

(load "~/.emacs.d/init-git.el")

(load "~/.emacs.d/init-jekyll.el")

(use-package forge
:ensure t)
(put 'upcase-region 'disabled nil)

(provide 'init) 

