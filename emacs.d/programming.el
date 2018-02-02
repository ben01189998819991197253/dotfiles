;;; programming.el --- Configuration file for how Emacs handles various programming languages
;;; Commentary:

;;; Code:

(use-package flycheck
  :ensure t)

;; Rust
;; Must do:
;; rustup component add rls-preview rust-analysis rust-src

(use-package rust-mode
    :mode "\\.rs\\'"
    :init
    (setq rust-format-on-save t))
(use-package lsp-mode
    :init
    (add-hook 'prog-mode-hook 'lsp-mode)
    :config
    (use-package lsp-flycheck
        :ensure f ; comes with lsp-mode
        :after flycheck))
(use-package lsp-rust
    :after lsp-mode)
(use-package toml-mode
  :ensure t)
(use-package cargo
  :ensure t)
(use-package racer
  :ensure t)
(use-package flycheck-rust
  :ensure t)

(define-key rust-mode-map [(tab)] #'company-indent-or-complete-common)

(defun rust-mode-setup ()
  (setq compile-command "cargo test && cargo check")
  (setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
  (define-key rust-mode-map "\C-c\C-c" 'compile))

(with-eval-after-load 'lsp-mode
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (require 'lsp-rust))

(add-hook 'rust-mode-hook 'rust-mode-setup)
(add-hook 'rust-mode-hook #'lsp-rust-enable)
(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


;; C/C++
(use-package company-c-headers
  :ensure t)

(defun c-mode-setup ()
  (setq company-backends (delete 'company-semantic company-backends))
  (define-key c-mode-map  [(tab)] 'indent-or-complete)
  (define-key c++-mode-map  [(tab)] 'indent-or-complete)
  (add-to-list 'company-backends 'company-c-headers))

(add-hook 'c-mode-hook 'c-mode-setup)

;; Use C++-mode for header files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Scala
(use-package ensime
  :ensure t
  :pin melpa)
(use-package scala-mode
  :pin melpa)
(use-package sbt-mode
  :pin melpa)

(defun scala-mode-setup ()
  (setq compile-command "sbt test && sbt compile")
  (define-key scala-mode-map "\C-c\C-c" 'compile))

(add-hook 'scala-mode-hook 'scala-mode-setup)

;; Racket
(use-package racket-mode
  :ensure t)

;; Haskell
(use-package haskell-mode
  :ensure t)
(use-package intero
  :ensure t)

;; (add-hook 'haskell-mode-hook 'intero-mode)
;; (setq flycheck-check-syntax-automatically '(save new-line))
;; (flycheck-add-next-checker 'intero '(warning . haskell-hlint))

(provide 'programming)
;;; programming.el ends here