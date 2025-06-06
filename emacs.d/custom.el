
(when (or (featurep 'esup-child)
          (fboundp 'profile-dotemacs)
          (daemonp)
          (boundp 'startup-now)
          noninteractive)
  (setq package-enable-at-startup nil))
(setq package-enable-at-startup nil)

(defvar my-computer-has-smaller-memory-p nil
  "Installing&Compiling many packages could cost too much memory.")

;; @see https://www.reddit.com/r/emacs/comments/ofhket/further_boost_start_up_time_with_a_simple_tweak/
;; 10% speed up of startup for my configuration
(unless my-computer-has-smaller-memory-p
  (setq gc-cons-percentage 0.6)
  (setq gc-cons-threshold most-positive-fixnum))

;; no startup-welcome-message
(setq inhibit-startup-message 0)
(setq package-enable-at-startup nil)


;; no menu bar, toolbar, scroll bar
(setq default-frame-alist
      '((menu-bar-lines . 1)
        (tool-bar-lines . 0)
        (horizontal-scroll-bars)
        (vertical-scroll-bars)))

(global-display-line-numbers-mode t)

(setq make-backup-files nil) 

(setq ring-bell-function 'ignore)

;(set-face-attribute 'default nil :height 250)

;(set-face-attribute 'default nil :font "MesloLGS NF")
(if *is-a-mac*
(set-face-attribute 'default nil :font (font-spec :family "MesloLGS NF" :size 16)))

;;(set-foreground-color "#E0DFDB")
;;(set-background-color "#000000")

(setq byte-compile-warnings '(cl-functions))
;; set tab


(if *is-a-mac*
  (setq delete-by-moving-to-trash t))

;; <macOS> Command -> Meta, Option -> Super
;;(if *is-a-mac*
;;    (setq mac-command-modifier 'Meta
;;	  mac-option-modifier 'Super
;;	  ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 '(package-selected-packages
   '(auto-complete avy benchmark-init cargo company-irony counsel elfeed
		   flycheck-rust ggtags gruber-darker-theme ht lv
		   racer spinner which-key yasnippet)))

;; 设置全局缩进风格，使用 4 个空格代替制表符
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; 确保 C 模式和 C++ 模式的缩进设置一致
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'substatement-open 0) ;; 调整子语句偏移
            (setq c-basic-offset 4)))           ;; C/C++ 基本缩进为 4 个空格
(add-hook 'c++-mode-hook
          (lambda ()
            (setq c-basic-offset 4)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; dark 主题
;; (use-package gruber-darker-theme
;;   :ensure t)



;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-one t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   ;; Enable custom neotree theme (nerd-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;   (doom-themes-treemacs-config)
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))

;; (load "~/.emacs.d/calm-forest-theme.el")
(load-theme 'tango-dark t)  ; 加载 'wombat' 主题，第二个参数 `t` 表示不提示确认
