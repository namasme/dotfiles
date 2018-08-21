;; auto-mode-alist

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;; Recent files configuration

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(run-at-time nil (* 60 60) 'recentf-save-list)

;; enable C-x C-n

(put 'set-goal-column 'disabled nil)

;; Coq's Proof General setup

(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; Extend emacs' PATH to find flake8 executable

(setq exec-path (append exec-path '("~/.local/bin/")))

;; Set web-mode markup indentation to 2 spaces

(defun set-indentation-hook ()
  (setq web-mode-markup-indent-offset 2)
)

(add-hook 'web-mode-hook 'set-indentation-hook)
