;; ~/.emacs.d/company.el
;; Configuration file for Company, the text-completion framework for Emacs

;; Start company in every buffer
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package company
  :ensure t)

(setq company-tooltip-align-annotations t)
(setq company-idle-delay 1)
(setq company-minimum-prefix-length 1)
