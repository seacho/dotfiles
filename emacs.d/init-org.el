;;org-mode
(use-package org-mode
  :mode "\\.org$"
  :ensure org
  :config
  (progn
    (setq org-log-done 'time)
    (setq org-confirm-babel-evaluate nil)
    (setq org-export-babel-evaluate nil)
    (setq org-html-validation-link nil)
    ;; ... more stuff
  )
)
(require 'ob-core)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)  ; 默认支持的语言
   (python . t)       ; Python 支持
   (R . t)            ; R 支持
   (shell . t)))      ; Shell 脚本支持


(use-package ox-reveal :ensure t)
(require 'org-protocol)
;;(setq org-reveal-root "~/reveal.js-5.1.0")

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

(global-set-key (kbd "C-c c") 'org-capture)



(use-package org-msg
  :ensure t
  :config
  (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil tex:dvipng")
  (setq org-msg-startup "hidestars indent inlineimages")
  (setq org-msg-greeting-fmt "\n%s,\n\n")
  (setq org-msg-greeting-fmt-mailto t)
  (setq org-msg-signature "
            #+begin_signature
            -- *Mike* \\\\
            #+end_signature")
  (org-msg-mode))

(defun my-guess-language ()
  "Guess the programming language based on the current buffer's file extension."
  (let ((extension (file-name-extension (buffer-file-name))))
    (cond
     ((member extension '("py" "pyw")) "python")
     ((member extension '("js" "jsx")) "javascript")
     ((member extension '("java")) "java")
     ((member extension '("html" "htm")) "html")
     ((member extension '("css")) "css")
     ((member extension '("sh" "bash")) "shell")
     ((member extension '("c" "cc" "cpp")) "c++")
     ((member extension '("go")) "go")
     ((member extension '("rust")) "rust")
     ((member extension '("perl")) "perl")
     ((member extension '("ruby")) "ruby")
     ((member extension '("php")) "php")
     ((member extension '("swift")) "swift")
     ((member extension '("ts" "tsx")) "typescript")
     (t "text"))))

(defun my-insert-src-block (&optional lang)
  "Insert an Org src block with the specified language LANG.
If LANG is not provided, guess the language based on the current buffer's file extension."
  (interactive (list (or (my-guess-language) (read-string "Enter programming language: "))))
  (insert (format "#+BEGIN_SRC %s\n\n#+END_SRC" lang))
  (forward-line -1)
  (org-edit-src-code))

;; Ensure org-mode is loaded before defining the key binding
(eval-after-load 'org
  '(define-key org-mode-map (kbd "C-c s") 'my-insert-src-block))
;;显示自动换行
(add-hook 'org-mode-hook 'visual-line-mode)
