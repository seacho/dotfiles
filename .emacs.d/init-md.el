;;;markdown config 


(use-package 'markdown-mode


  )


(defun markdown-split-preview ()
  "Split window and preview Markdown"
  (interactive)
  (split-window-right)  ; 纵向分屏
  (other-window 1)      ; 切换到右侧窗口
  (markdown-preview))   ; 调用预览命令


(global-set-key (kbd "C-c m p") 'markdown-split-preview)

