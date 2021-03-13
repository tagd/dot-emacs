;;;Package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Note comments on custom will be removed
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-macro-global
   '("c:/texlive/2020/texmf-var/tex/" "c:/texlive/texmf-local/tex/" "c:/texlive/texmf-local/bibtex/bst/" "c:/texlive/2020/texmf-dist/tex/" "c:/texlive/2020/texmf-dist/bibtex/bst/"))
 '(TeX-macro-private '("g:/Library/Latex/"))
 '(auto-save-list-file-prefix "~/.emacs.d/auto-save-list/.saves-")
 '(auto-save-visited-mode t)
 '(blink-cursor-mode nil)
 '(current-language-environment "UTF-8")
 '(cursor-type 'bar)
 '(custom-safe-themes t)
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(doc-view-continuous t)
 '(doc-view-scale-internally nil)
 '(electric-indent-mode nil)
 '(global-visual-line-mode t)
 '(image-file-name-extensions
   '("png" "jpeg" "jpg" "gif" "tiff" "tif" "xbm" "xpm" "pbm" "pgm" "ppm" "pnm" "svg" "pdf" "bmp"))
 '(inhibit-startup-screen t)
 '(menu-bar-mode t)
 '(org-ellipsis "$(O#/(B")
 '(org-hide-block-startup nil)
 '(org-hide-leading-stars t)
 '(org-image-actual-width '(600))
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "grffile" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" t nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" t nil)
     ("" "comment" t nil)
     ("" "biblatex" t nil)
     ("" "acronym" t nil)))
 '(org-latex-pdf-process '("latexmk -shell-escape -bibtex -f -pdf %f"))
 '(org-noter-always-create-frame nil)
 '(org-roam-directory "g:/entropy/")
 '(org-startup-folded nil)
 '(org-startup-with-inline-images t)
 '(org-superstar-headline-bullets-list '(9673 9675 9671 10047))
 '(package-selected-packages
   '(org-noter-pdftools org-noter org-roam-bibtex ivy-bibtex org-ref bibtex-completion latex-preview-pane yasnippet pdf-tools auctex org-superstar org-download counsel olivetti swiper ivy modus-vivendi-theme modus-operandi-theme org-roam))
 '(pop-up-windows nil)
 '(safe-local-variable-values '((TeX-master . master)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode t)
 '(version-control t)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; ------Adding load path-------
;; Allows librarys to be added by me
(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
;(setq TeX-PDF-mode t)                         ; compile with PDFLaTeX by default
;(add-hook 'TeX-mode-hook 'TeX-fold-mode)      ; auto-activate TeX-fold-mode
;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)  ; auto-activate math mode

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)


;;; ------Files in load path------
;;(require 'org-bullets) ;;replaced with melpa org-superstar
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Set the folder for backup files to a subfolder in the 
;;.emacs.d folder of the user. 
(setq backup-directory-alist 
  '(("." . "~/.emacs.d/file-backups")))

;;; ------Link files in Linux -----
(when (string-equal system-type "gnu/linux")
(setq user-emacs-directory "/gdrive/.emacs.d/")
(setq default-directory "/gdrive")
(setenv "HOME" "/gdrive"))

;;; ------Link files in Windows-----
(when (string-equal system-type "windows-nt")
(setq user-emacs-directory "g:/.emacs.d/") ;;needs to be g
(setq default-directory "~")
(setenv "HOME" "G:") ;;needs to be g
;;; ------Find linux functions in windows-----  
  (add-to-list 'exec-path "~/.emacs.d/addons-win") ;; sqllite3.exe for use by org-roam
  (setenv "PATH"
    (concat
     "~/.emacs.d/addons-win/diff-bin" ";" ;;Custom adding of diff to install
     "C:/msys64/mingw64/bin" ";"
     "C:/texlive/2020/bin/win32" ";" ;;PDFlatex
     "C:/cygwin64/usr/local/bin" ";"
     "C:/cygwin64/usr/sbin" ";"
     "C:/cygwin64/bin" ";"
;     "C:/Program Files/Git/bin" ";" ;;All already included
     (getenv "PATH")
    )
  )
)

;;; ------Not thought through (clean when I have the time)---------
;;; Theming, roam workflow, config, latex workflow
;; Tell Emacs to start org-roam-mode when Emacs starts
(add-hook 'after-init-hook 'org-roam-mode)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; Recommendation for Windows users for performance
;; https://github.com/org-roam/org-roam/issues/1289#issuecomment-744046148
(setq org-roam-db-update-method 'immediate)
(setq latex-run-command "pdflatex")
(add-hook 'LaTeX-mode-hook (lambda ()
                 (push 
                  '("Latex_outdir" "%`pdflatex --output-directory=/tmp %(mode)%' %t" 
                TeX-run-TeX nil (latex-mode doctex-mode) 
                :help "Run pdflatex with output in /tmp")
                  TeX-command-list)))

;(add-hook 'latex
;          (lambda ()
;            (define-key latex-preview-pane "C-c l p"
;                        'latex-preview-pane-mode)))
(global-set-key (kbd "C-c l p") #'latex-preview-pane-mode)

	
(setq-default TeX-master nil) ; Query for master file.




(with-eval-after-load 'ox-latex ; add cls files
   (add-to-list 'org-latex-classes
                '("mitthesis"
                  "\\documentclass{mitthesis}"
                  ("\\chapter{%s}" . "\\chapter*{%s}")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
(with-eval-after-load 'ox-latex ; add cls files
   (add-to-list 'org-latex-classes
                '("tobysanswers"
                  "\\documentclass{tobysanswers}"
                  ("\\chapter{%s}" . "\\chapter*{%s}")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))


(defun fa/add-latex-acronym (region-beg region-end)
  "This function reads the written out form of an acronym via the
minibuffer and adds it to the acronym list in a latex
document. Addtionally, it sorts all acronyms in the list."
  (interactive "r")
  (save-excursion
    (let ((acronym
           (if (region-active-p)
               (buffer-substring region-beg region-end)
             (read-from-minibuffer "Acronym: ")))
          (full-name (read-from-minibuffer "Full Name: ")))
      (beginning-of-buffer)
      (if (search-forward "\\begin{acronym}" nil t)
          (progn
            (deactivate-mark)
            (open-line 1)
            (forward-line 1)
            (insert (concat "  \\acro{" acronym "}{" full-name "}"))
            (beginning-of-line)
            (sort-lines nil (point) (search-forward "\\end{acronym}" nil nil)))
        (user-error "No acronym environment found")))))
(eval-after-load "latex"
  '(define-key LaTeX-mode-map (kbd "C-c a c") 'fa/add-latex-acronym))
(eval-after-load "org"
  '(define-key org-mode-map (kbd "C-c a c") 'fa/add-latex-acronym))

;;; ------Keybindings------ ;;;

;;; Org-roam and file finding/ link creating
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n C-i") #'org-roam-insert-immediate)
(global-set-key (kbd "C-c n l") #'org-insert-link-global)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)
(global-set-key (kbd "C-c n o") #'org-noter)
(global-set-key (kbd "C-c n c") #'orb-insert);make note for a citation
(global-set-key (kbd "C-c n f") #'counsel-find-file)
(global-set-key (kbd "C-c n t") #'delete-file)

(defun org-noter-insert-selected-text-inside-note-content ()
  (interactive)
  (progn (setq currenb (buffer-name))
		 (org-noter-insert-precise-note)
		 (set-buffer currenb)
		 (org-noter-insert-note)
		 (org-noter-quote) ) )

(define-key pdf-view-mode-map (kbd "y") 'org-noter-insert-selected-text-inside-note-content)

;;; Quick access to init
(defun other-find-org-file ()
  "Org-roam-find-file', in another window."
  (interactive)
  (other-window org-roam-find-file))
(defun org-roam-find-file-other-window (&rest args)
  (interactive)
  (let ((org-roam-find-file-function #'find-file-other-window))
    (apply #'org-roam-find-file args)))
(global-set-key (kbd "C-c n .") #'org-roam-find-file-other-window)


;;; C-z to undo
(global-set-key (kbd "C-z") 'undo) ;Emacs default is bound to hide Emacs.




;;; ------Themeing----- ;;;

;; Font
;; If you want to know how to correct specify a font in Windows,
;; invoke `eval-last-sexp' for (w32-select-font)
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono-12")
(set-face-attribute 'default nil :font "dubai-12")
;;(set-face-attribute 'default nil  :font "courier-12")


;; Automatically load the theme you like
;; I am using modus-operandi (light theme) here
;; There is also modus-vivendi (dark theme)
;;(load-theme 'modus-operandi)

;;; ------Don't fully understand things beyond this point------ ;;;

; Ivy,Counsel, & Swiper
;; Enable Ivy mode in general
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Add Counsel and Swiper search functions
(global-set-key (kbd "C-c f r") #'counsel-recentf)
(global-set-key (kbd "C-f") #'swiper)

;; Replace default "M-x" and "C-x C-f" with Counsel version
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)

;; Optionally, you can replace these default functions with Counsel version, too
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)


;; Olivetti- Keep off for now
;; Look & Feel for long-form writing

;; Set the body text width
(setq olivetti-body-width 80)

;; Enable Olivetti for text-related mode such as Org Mode
;(add-hook 'text-mode-hook 'olivetti-mode)

;;----- Asthetic options ----- ;;
;(setq inhibit-startup-echo-area-message t)
;(setq inhibit-startup-message t)
;(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
;(setq-default indent-tabs-mode nil); no idea
;(setq pop-up-windows nil)
(scroll-bar-mode 0)  ;;hide scroll bar
(setq-default word-wrap t) ;;wrap word at end of lines
;(set-default-coding-systems 'utf-8)

;; Line spacing, can be 0 for code and 1 or 2 for text
(setq-default line-spacing 0)

;; Underline line at descent position, not baseline position
(setq x-underline-at-descent-line t)



;-----------------Bibleography funcs ----------------------

;;;; Org ref ;;;; https://github.com/jkitchin/org-ref

(setq reftex-default-bibliography '("~/entropy/roam.bib"))
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f")); "If you plan to build PDF files via LaTeX you need to make sure that org-latex-pdf-process is set to process the bibliography (using bibtex or biblatex). Here is one example of how to do that (see ./org-ref.org::*LaTeX export for other alternatives)."

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/entropy/notes/"
      org-ref-default-bibliography '("~/entropy/roam.bib")
      org-ref-pdf-directory '("~/Library/Papers/"
        "~/Library/Standards/" "~/Library/Misc/" "~/Library/CSUG/"))
(require 'org-ref)

;;;; Helm-bibtex ;;;; https://github.com/tmalsburg/helm-bibtex

(setq bibtex-completion-bibliography '("~/entropy/roam.bib")
      bibtex-completion-library-path '("~/Library/Papers"
        "~/Library/Standards" "~/Library/Misc"  "~/Library/CSUG" "~/Library/Books")
      bibtex-completion-notes-path "~/entropy/notes")

(setq bibtex-completion-pdf-field "File");; location of pdf may be specified in a field "File" the even allows for supplementry material to be stored e.g. "File = {:/path/to/article.pdf:PDF;:/path/to/supplementary_materials.pdf:PDF}"
(setq bibtex-completion-pdf-extension '(".pdf" ".pptx" ".docx"));;file types to recognise

;; open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

;; alternative
;; (setq bibtex-completion-pdf-open-function 'org-open-file)

(setq bibtex-completion-additional-search-fields '(keywords));Allows for search bib by keyword
(setq bibtex-completion-pdf-symbol "$(O'|(B") ;appears if pdf exists
(setq bibtex-completion-notes-symbol "$,2%N(B") ;appears if notes exist

;;; Helm keybindings
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-command-prefix)

(define-key helm-command-map "b" 'helm-bibtex)
(define-key helm-command-map "B" 'helm-bibtex-with-local-bibliography)
(define-key helm-command-map "n" 'helm-bibtex-with-notes)
(define-key helm-command-map "h" 'helm-resume)


;;;; ORB - org-roam-bibtex setup

(require 'org-roam-bibtex)
(add-hook 'after-init-hook #'org-roam-bibtex-mode)


(autoload 'helm-bibtex "helm-bibtex" "" t);;no idea where this came from or what it does


;-------------reloading info--------------------------------

;;; Quick access to init
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "C-c e") #'find-user-init-file)

;;; Reload file without resart
;You can use the command load-file (M-x load-file, then press return twice to accept the default filename, which is the current file being edited).

;You can also just move the point to the end of any sexp and press C-xC-e to execute just that sexp. Usually it's not necessary to reload the whole file if you're just changing a line or two.

;---------------------------------------------------------------------------

;;; Paste bin for regualterly used strings
(global-set-key (kbd "C-c a a") "#+roam_alias: ")
(global-set-key (kbd "C-c a s") "#+startup: content\n")
(global-set-key (kbd "C-c a t") "#+roam_tags: ")
(global-set-key (kbd "C-c a b") "#+roam_tags:  \"BT\" \n")
(global-set-key (kbd "C-c c") #'org-ref-helm-insert-cite-link)

;;; Paste map to C-v, cant to C-x C-c as this would break eveything
;;; Switched Cut and Paste as I use copy more
(global-set-key "\C-v" 'clipboard-yank)
(global-set-key "\M-v" 'yank-pop)
(global-set-key "\C-w" 'kill-ring-save)
(global-set-key "\M-w" 'kill-region)
(global-set-key "\C-c k" #'cua-mode)

;;;Wrap search is nothing found
;; Prevents issue where you have to press backspace twice when
;; trying to remove the first character that fails a search

(global-set-key (kbd "C-C C-f") 'isearch-forward) 
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

;(add-hook 'isearch-mode-hook (lambda () (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)))


(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

(defadvice isearch-search (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))

;;;Paused window 
(defadvice pop-to-buffer (before cancel-other-window first)
  (ad-set-arg 1 nil))

(ad-activate 'pop-to-buffer)

;; Toggle window dedication
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window 
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))

;; Press [pause] key in each window you want to "freeze"
(global-set-key "\C-s" 'toggle-window-dedicated)
(put 'set-goal-column 'disabled nil)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)



(add-hook 'after-init-hook 'pdf-tools-install)
 ;; open pdfs scaled to fit page
; (setq-default pdf-view-display-size 'fit-page)
 ;; automatically annotate highlights
 (setq pdf-annot-activate-created-annotations t)
 ;; use normal isearch
 ;(define-key pdf-view (kbd "C-s") 'isearch-forward)
