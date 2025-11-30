;;haskell config
(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'"
  :config
  (setq haskell-indentation-layout-offset 2
        haskell-indentation-left-offset 2
        haskell-indentation-ifte-offset 2))

(use-package dante
  :ensure t
  :after haskell-mode
  :hook (haskell-mode . dante-mode)
  :config
  (setq dante-repl-command-line '("ghci")))

(use-package reformatter
  :ensure t
  :config
  (reformatter-define fourmolu
    :program "fourmolu"
    :args '("--stdin-input-file" filepath)
    :stdin t
    :stdout t)
  (add-hook 'haskell-mode-hook 'fourmolu-on-save-mode))



