(provide 'lang-mode-customizations)

;; I've been trying to make C-mode bend to my will for a long time. Here are the
;; various attempts I've made at that to varying success. It works as I expect
;; by now as a result of this mess.
(defun my-arglist-indent ()
  (c-set-offset 'arglist-intro '++))
(add-hook 'c-mode-common-hook 'my-arglist-indent)

(setq java-default-style "gnu"
      java-basic-offset 2)
(defun java-arglist-indent ()
  (c-set-offset 'arglist-intro 2))
(add-hook 'java-mode-hook 'java-arglist-indent)
(require 'compile)
(add-hook 'java-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (format
                  "javac %s"
                  (file-name-nondirectory buffer-file-name)))))

;; Some LaTeX config stuff, I use LaTeX a lot
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;(setq reftex-plug-into-AUCTeX t)
