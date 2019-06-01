(provide 'org-customizations-file)

;; I use org-mode *constantly*, so I have a few tweaks here that make it work
;; for me exactly as I like it.
(setq org-agenda-files '("~/Documents/etc/org"))
(setq org-directory "~/Documents/etc/org")
(setq org-agenda-include-diary t)
(setq org-modules (quote (org-habit)))
(global-set-key "\C-ca" 'org-agenda)

(setq org-default-notes-file (concat org-directory "/agenda.org"))

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("proc"
               "\\documentclass[11pt]{proc}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
