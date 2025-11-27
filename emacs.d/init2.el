;; ==============================================
;; Ultra-light Emacs config for RE + LSP + Org
;; ==============================================


;; ---------------------------------------------------------
;; NETWORK PROXY SETUP
;; ---------------------------------------------------------
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http"     . "127.0.0.1:12334")  ; Replace with your proxy IP:PORT
     ("https"    . "127.0.0.1:12334"))) ; Replace with your proxy IP:PORT


;; ========== 包管理 ==========
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)



;; ========== 基础 UI ==========
;; Disable all graphical UI elements to focus on code
(tool-bar-mode -1)           ; specific to Tsoding: hates icons
(menu-bar-mode -1)           ; learn the hotkeys instead
(scroll-bar-mode -1)         ; wastes screen real estate
(setq inhibit-startup-screen t) ; jump straight to scratch buffer
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)
(electric-pair-mode 1)
(set-face-attribute 'default nil :height 180 :font "Iosevka-20")


(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;; ==============================================
;;     SECTION 1 —— 代码阅读：LSP + tree-sitter
;; ==============================================

;; ---- tree-sitter ----
;; (use-package treesit-auto
;;   :config
;;   (treesit-auto-add-to-auto-mode-alist 'all)
;;   (global-treesit-auto-mode))

;; ---- lsp-mode ----
;; (use-package lsp-mode
;;   :hook(
;;          (c-mode . lsp)
;;          (c++-mode . lsp)
;;          (python-mode . lsp)
;;          (rust-mode . lsp)
;;          (go-mode . lsp)
;;          (sh-mode . lsp)
;;          ;; (c-ts-mode . lsp)
;;          ;; (c++-ts-mode . lsp)
;;          ;; (python-ts-mode . lsp)
;;          ;; (rust-ts-mode . lsp)
;;          ;; (go-ts-mode . lsp)
;;          ;; (bash-ts-mode . lsp)
;; 	 )


;;   :commands lsp
;;   :config
;;   (setq lsp-headerline-breadcrumb-enable nil
;;         lsp-enable-symbol-highlighting t
;;         lsp-enable-snippet nil))


;;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'tuareg-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c++-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'simpc-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'emacs-lisp-mode 'rc/set-up-whitespace-handling)
(add-hook 'java-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'lua-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'rust-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'scala-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'haskell-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'python-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'erlang-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'asm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'fasm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'go-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'nim-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'yaml-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'porth-mode-hook 'rc/set-up-whitespace-handling)



;; ---- semantic（快速跳转 / 分析）----
(require 'semantic)
(semantic-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semanticdb-minor-mode 1)

;; 更方便的跳转
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "M-.") 'semantic-ia-fast-jump)


;; ---------------------------------------------------------
;; CORE EDITOR TWEAKS
;; ---------------------------------------------------------
;; Relative line numbers (mentioned in his FAQ)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Electric pairs (auto-close brackets)
(electric-pair-mode 1)

;; No backup files cluttering directory (keeps folders clean)
(setq make-backup-files nil) 
(setq auto-save-default nil)


;; ---------------------------------------------------------
;; 5. KEY PACKAGES
;; ---------------------------------------------------------

;; MAGIT: The absolute best git client, Tsoding uses this extensively.
(use-package magit
  :bind ("C-x g" . magit-status))
;; IVY/SWIPER/COUNSEL: For fuzzy finding.
;; Tsoding has used various completion frameworks, but Ivy is 
;; a standard minimal choice for this style.
(use-package ivy
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)))

;; ---------------------------------------------------------
;; COMPILATION
;; ---------------------------------------------------------
;; Tsoding often compiles C code directly from Emacs.
;; This binds 'F5' to recompile automatically.
(global-set-key (kbd "<f5>") 'recompile)

;; ---------------------------------------------------------
;; CUSTOM FUNCTIONS (Optional but very "Tsoding")
;; ---------------------------------------------------------
;; He often live-codes C and wants quick execution.
(defun run-current-file ()
  "Execute the current file based on extension."
  (interactive)
  (cond ((string= (file-name-extension buffer-file-name) "py")
         (compile (format "python3 %s" (buffer-name))))
        ((string= (file-name-extension buffer-file-name) "c")
         (compile (format "gcc -Wall -Wextra %s -o %s && ./%s" 
                          (buffer-name) (file-name-base) (file-name-base))))
        (t (message "Unknown file type"))))

(global-set-key (kbd "C-c r") 'run-current-file)







;; ==============================================
;;     SECTION 2 —— 逆向工程增强包
;; ==============================================

;; ===== Hexdump =====
(use-package hexl
  :ensure nil
  :commands hexl-mode)

;; 打开二进制文件自动 hexl
(add-to-list 'magic-mode-alist '("\0\0\0\0" . hexl-mode))

;; ===== Assembly/disasm 高亮 =====
(use-package asm-mode
  :mode ("\\.S\\'" "\\.asm\\'" "\\.s\\'" "\\.disasm\\'")
  :hook (asm-mode . (lambda ()
                      (setq tab-width 8))))

;; 反汇编视图（你会用到很多）
(defun disasm-buffer ()
  "Disassemble current buffer via objdump"
  (interactive)
  (let* ((file (buffer-file-name))
         (buf  (get-buffer-create "*disasm*")))
    (unless file (error "Not visiting a file"))
    (with-current-buffer buf
      (erase-buffer)
      (call-process "objdump" nil buf nil "-d" file)
      (asm-mode))
    (switch-to-buffer buf)))

(global-set-key (kbd "C-c d") 'disasm-buffer)


