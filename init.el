;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
;;-------------- GNU Emacs .emacs file for Tomás Aragón --------------;;
;;-------------- Time-stamp: <2020-12-29 Tue 23:18:21> ---------------;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(setq user-mail-address "taragonmd@gmail.com")


;; ABBREVIATIONS
;; -------------------------------------------------------------------
;(setq-default abbrev-mode t)
;(read-abbrev-file "~/.emacs.d/abbrev_defs")
;(setq save-abbrevs t)


;; CALENDAR / Diary stuff
;; -------------------------------------------------------------------
;; Active Emacs calendar by Edward M. Reingold  (calls ~/diary)
;(setq org--agenda-include-diary t) 
;; inactivatue default holidays
(setq holiday-general-holidays 'nil)
(setq holiday-local-holidays 'nil)
(setq holiday-solar-holidays 'nil)
(setq holiday-bahai-holidays 'nil)
(setq holiday-christian-holidays 'nil)
(setq holiday-hebrew-holidays 'nil)
(setq holiday-islamic-holidays 'nil)
(setq holiday-oriental-holidays 'nil)
;; create my holidays
(setq holiday-other-holidays '(
    (holiday-fixed 1 1 "New Year's Day (Jan 1)")
    (holiday-float 1 1 3 "Dr. Martin Luther King, Jr. Day (3rd Mon Jan)")
    (holiday-float 2 1 3 "Presidents' Day (3rd Mon Feb)")
    (holiday-float 5 1 -1 "Memorial Day (Last Mon May)")
    (holiday-fixed 7 4 "Independence Day (Jul 4)")
    (holiday-float 9 1 1 "Labor Day (1st Mon Sep)")
    (holiday-float 10 1 2 "Columbus Day (2nd Mon Oct)")
    (holiday-fixed 11 11 "Veterans Day (Nov 11)")
    (holiday-float 11 4 4 "Thanksgiving Day (4th Thu Nov)")
    (holiday-fixed 12 25 "Christmas Day (Dec 25)")
	       ))
;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Importing-Diary.html
;; run below; clean then put into calendar.org
; (icalendar-import-file "~/org/ics-files/UCBAcadCal_2013-2014-Fall.ics"
;                            "~/diary")
;; -------------------------------------------------------------------


;; EBIB
;; -------------------------------------------------------------------
;; http://joostkremers.github.io/ebib/ebib-manual.html
(global-set-key "\C-ce" 'ebib)
;; -------------------------------------------------------------------


;; EMACS EDIFF to compare files or buffers
;; -------------------------------------------------------------------
;; http://www.gnu.org/software/emacs/manual/html_mono/ediff.html
;; https://stackoverflow.com/questions/7038146/how-can-i-compare-two-files-in-emacs-similar-to-vims-vimdiff
(setq ediff-split-window-function 'split-window-horizontally)


;; EMACS SPEAKS STATISTICS
;; -------------------------------------------------------------------
;; ESS: Emacs Speaks Statistics: http://ess.r-project.org/
;; http://ess.r-project.org/Manual/ess.html#Step-by-step-instructions
;(add-to-list 'load-path "~/Dropbox/tja/elisp/julia-mode-0.3/")
;(add-to-list 'load-path "~/Dropbox/tja/elisp/ESS/lisp")
;(require 'julia-mode)
;(require 'ess-site)
;; -----------------------------------------------------------------------------


;; FRAMES: Set up 2 or 3 frames; buffer has width 70 
;; -------------------------------------------------------------------
(setq default-frame-alist '((width . 166) (height . 70))) ;; 2 cols
;; (setq default-frame-alist '((width . 250) (height . 70))) ;; 3 cols
;; (setq default-frame-alist '((width . 80) (height . 80))) ;; 1 col
;; GRID LAYOUT:
;; https://www.emacswiki.org/emacs/GridLayout
(defun split-window-multiple-ways (x y)
  "Split the current frame into a grid of X columns and Y rows."
  (interactive "nColumns: \nnRows: ")
  ;; one window
  (delete-other-windows)
  (dotimes (i (1- x))
      (split-window-horizontally)
      (dotimes (j (1- y))
	(split-window-vertically))
      (other-window y))
  (dotimes (j (1- y))
    (split-window-vertically))
  (balance-windows))

(split-window-multiple-ways 2 1) ;; was 2 1

;; (desktop-save-mode)


;; GRAPHVIZ:  graphviz-dot-mode: http://graphviz.org
;; -------------------------------------------------------------------
;; https://github.com/ppareit/graphviz-dot-mode
(add-to-list 'auto-mode-alist '("\\.gv$" . graphviz-dot-mode))
;; -------------------------------------------------------------------


;; LaTeX & RefTeX MODE
;; ------------------------------------------------------------------- 
;; MacOS 2016-11-03
;; http://tex.stackexchange.com/questions/270490/how-to-use-auctex-in-macos-el-capitan
(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
(setq exec-path (append exec-path '("/Library/TeX/texbin")))

;; MacOS 2016-11-03
;; http://www.stefanom.org/setting-up-a-nice-auctex-environment-on-mac-os-x/
;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
;; -------------------------------------------------------------------


;; MARKDOWN POLYMODE
;; -------------------------------------------------------------------
;; Source: http://jblevins.org/projects/markdown-mode/
;(autoload 'markdown-mode "markdown-mode"
;  "Major mode for editing Markdown files" t)
;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode)) ;; tja
;(add-to-list 'auto-mode-alist '("\\.Rmarkdown\\'" . markdown-mode)) ;; tja

;(require 'poly-R)
;(require 'poly-org)
;(require 'poly-markdown)
;(add-to-list 'auto-mode-alist '("\\.R" . ess-r-mode))
;(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))


;; Source: http://www.emacswiki.org/emacs/MarkdownMode
;(add-hook 'markdown-mode-hook
;            (lambda ()
;              (when buffer-file-name
;                (add-hook 'after-save-hook
;                          'check-parens
;                          nil t))))

;; warning, may yield wrong results in edge-cases like single
;; double-quotes in code block.  Use only if your files usually are
;; balanced w/r/t double-quotes
;; <http://stackoverflow.com/questions/9527593/>
;(add-hook 'markdown-mode-hook
;	  (lambda ()
;	    (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)))


;; ORG MODE: http://orgmode.org
;; -------------------------------------------------------------------
;; http://emacswiki.org/emacs/LineWrap 
(setq org-startup-indented t)
;(setq org-hide-leading-stars t)

;; http://orgmode.org/org.html#Introduction 
;(add-to-list 'auto-mode-alist '("\\.org\\.txt\\'" . org-mode))
(setq org-directory "~/org")


;;bernt hansen - replaced line above
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; 2.7 You can also get 'a.', 'A.', 'a)' and 'A)' by configuring
;; org-list-allow-alphabetical. To minimize confusion with normal
;; text, those are limited to one character only. Beyond that limit,
;; bullets will automatically fallback to numbers.
(setq org-list-allow-alphabetical t)

;; 2.11 The Orgstruct minor mode: If you like the intuitive way the
;; Org mode structure editing and list formatting works, you might
;; want to use these commands in other modes like Text mode or Mail
;; mode as well. The minor mode orgstruct-mode makes this
;; possible. Toggle the mode with M-x orgstruct-mode RET, or turn it
;; on by default, for example in Message mode, with one of:
(add-hook 'message-mode-hook 'turn-on-orgstruct)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)

;; Functions to open my preferred files or directories.  "M-x gtd"
;; opens gtd.org; "M-x docs" opens Documents directory
;; http://members.optusnet.com.au/~charles57/GTD/orgmode.html
(defun init () (interactive) (find-file "~/.emacs.d/init.el"))
(defun gtd () (interactive) (find-file "~/org/gtd.org"))
(defun journal () (interactive) (find-file "~/org/journal.org"))
(defun learn () (interactive) (find-file "~/org/learn.org"))
(defun mtgs () (interactive) (find-file "~/org/meetings.org"))
(defun resources () (interactive) (find-file "~/org/resources.org"))
(defun phone () (interactive) (find-file "~/Dropbox/tja/org/phone.org"))
(defun todo () (interactive) (find-file "~/Dropbox/app/orgzly/todo.org"))
(defun projects () (interactive) (find-file "~/org/projects.org"))


;; 4.4: Move forward/backward to the next link in the buffer. At the
;; limit of the buffer, the search fails once, and then wraps
;; around. The key bindings for this are really too long; you might
;; want to bind this also to C-n and C-p
(add-hook 'org-load-hook
	  (lambda ()
	    (define-key org-mode-map "\C-n" 'org-next-link)
	    (define-key org-mode-map "\C-p" 'org-previous-link)))

;; 4.5 Using links outside Org: You can insert and follow links that
;; have Org syntax not only in Org, but in any Emacs buffer. For this,
;; you should create two global commands, like this (please select
;; suitable global keys yourself):
(global-set-key "\C-c L" 'org-insert-link-global)
(global-set-key "\C-c o" 'org-open-at-point-global)

;; 4.6 Link abbreviations: Long URLs can be cumbersome to type, and
;; often many similar links are needed in a document. For this you can
;; use link abbreviations. An abbreviated link looks like this
;; [[linkword:tag][description]] where the tag is optional. The
;; linkword must be a word, starting with a letter, followed by
;; letters, numbers, ‘-’, and ‘_’. Abbreviations are resolved
;; according to the information in the variable org-link-abbrev-alist
;; that relates the linkwords to replacement text. Here is an example:
(setq org-link-abbrev-alist
      '(("google"    . "http://www.google.com/search?q=")))

;; 5.2.4 Fast access to TODO states
;; 5.3.2 Tracking TODO state changes
;; @ = note with timestamp; use C-c C-c to cancel or complete note
;; ! = timestamp
;; /! = timestamp upon leaving state (e.g., @/!)
(setq org-todo-keywords
'((sequence "TODO(t@)" "DOING(d@)" "WAITING(w@)" "|" "DONE(f@)" "CANCELED(c!)")))

;; 9.1.1 Setting up capture using remember (v7.8)
(setq org-capture-templates
      '(
	;;("c" "Creative idea!!!" entry
	;; (file+headline "~/org/todo.org" "CREATIVE!")
	;; "* TODO %?\n %i\n %a")
	;;("j" "Journal entry" plain (file+datetree+prompt "~/org/journal.org")
        ;; "%K - %a\n%i\n%?\n")
	("f" "Family" entry
	 (file+headline "~/Dropbox/app/orgzly/todo.org" "FAMILY")
	 "* TODO %?\n %i\n %a")	
	("i" "Idea (Someday, Maybe)" entry
	 (file+headline "~/Dropbox/app/orgzly/todo.org" "IDEA")
	 "* TODO %?\n %i\n %a")
	("j" "Journal" entry (file+datetree+prompt "~/org/journal.org")
	 "* %?\nWhen: %U\n %i\nFrom: %a")
	("p" "Phone (random call)" entry (file+datetree "~/org/phone.org")
	 "* %?\nWhen: %U\n %i\nFrom: %a")
	("t" "Todo" entry (file+headline "~/Dropbox/app/orgzly/todo.org" "INBOX")
	 "* TODO %?\n %i\n %a")
	))

;; 10 Agenda views
(setq org-agenda-files (list "~/org/gtd.org"
			     "~/org/meetings.org"
                             "~/org/pm/projects.org"
                             "~/Dropbox/app/orgzly/todo.org"))


;; Org-mode and R: An Introduction
;; -------------------------------------------------------------------
;; https://github.com/erikriverson/org-mode-R-tutorial/blob/master/org-mode-R-tutorial.org
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (latex . t)))

;; ORG-REF
;; -------------------------------------------------------------------
;; https://github.com/jkitchin/org-ref
;; https://github.com/jkitchin/org-ref/blob/master/org-ref.org
;(require 'org-ref)

;(setq reftex-default-bibliography '("/Users/tja/Dropbox/tja/texmf/bibtex/bib/phds.bib"))

;(setq bibtex-completion-bibliography "/Users/tja/Dropbox/tja/texmf/bibtex/bib/phds.bib")

;(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

(require 'ox-bibtex)

;; PRAGMATIC EMACS
;; -------------------------------------------------------------------
;; http://pragmaticemacs.com/

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?B)

;; set colours for priorities
(setq org-priority-faces '((?A . (:foreground "red" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;; PACKAGE REPOSITORIES
;; -------------------------------------------------------------------
;; Source: http://www.emacswiki.org/emacs/ELPA
;; https://www.emacswiki.org/emacs/MELPA
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package markdown-mode
  :ensure t)


;; PARAGRAPH MODES: fill and unfill
;; -------------------------------------------------------------------
;; Auto-fill: Cameron D, et al. Learning GNU Emacs, 3rd Ed, p. 47
;; "M-q" formats paragraphs (see refill-mode for automatic formatting)
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; Word wrap

;; Refill-mode: Set global-key to automatically refill paragraphs
;; Source: http://www.emacswiki.org/emacs/RefillMode
(global-set-key (kbd "C-c q") 'refill-mode)

;; unfill-paragraph: http://www.emacswiki.org/emacs/UnfillParagraph
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))
(define-key global-map "\M-Q" 'unfill-paragraph)

;; unfill-region: http://www.emacswiki.org/emacs/UnfillRegion
(defun unfill-region (beg end)
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))
(define-key global-map "\C-\M-Q" 'unfill-region)


;; Python 3.7
;; -------------------------------------------------------------------
;; suppresses error message
;; https://emacs.stackexchange.com/questions/35306/python-shell-interpreter-doesn-t-seem-to-support-readline/35969
;tja (setq python-shell-completion-native-disabled-interpreters '("python"))
;; set Python shell interpreter
;tja (setq python-shell-interpreter "python3")


;; R and ESS in Mac OS
;; -------------------------------------------------------------------
;; http://stackoverflow.com/questions/32895781/emacs-on-mac-r-and-os-x-el-capitan
;tja (setq exec-path (cons "/usr/local/bin/" exec-path))


;; SPELL-CHECK
;; -------------------------------------------------------------------
;; brew install aspell
(setq-default ispell-program-name "/usr/local/bin/aspell")

;; https://vigou3.gitlab.io/emacs-modified-macos/
;(setq-default ispell-program-name "/usr/local/bin/hunspell")

;(setq ispell-really-hunspell t)

;; https://www.reddit.com/r/emacs/comments/dgj0ae/tutorial_spellchecking_with_hunspell_170_for/
;;(setq ispell-program-name "hunspell")
;(setq ispell-hunspell-dict-paths-alist
;'(("en_US" "/Users/tja/Library/Spelling/en_US.aff")))
;(setq ispell-local-dictionary "en_US")

;(setq ispell-local-dictionary-alist

;; Note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
;'(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))

;; following line won't make flyspell-mode enabled by default as you might think
;(flyspell-mode 1)

;; ispell-word for showing correcting options of the current misspelled word
;(global-set-key (kbd "M-\\") 'ispell-word)
;; -------------------------------------------------------------------


;; TIMESTAMP upon saving file
;; -------------------------------------------------------------------
;; Source: http://www.emacswiki.org/emacs/TimeStamp
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-pattern nil
      time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S")


;; TRAMP: allows editing of files on remote machines via SS
;; -------------------------------------------------------------------
;; http://nakkaya.com/2009/11/06/remote-file-editing-using-emacs/
(require 'tramp)
(setq tramp-default-method "scp")


;; -------------------------------------------------------------------
;; -------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(background-color "#fcf4dc")
 '(background-mode light)
 '(column-number-mode t)
 '(cursor-color "#52676f")
 '(custom-enabled-themes '(leuven))
 '(custom-safe-themes
   '("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))
 '(foreground-color "#52676f")
 '(package-selected-packages
   '(org-ref poly-org poly-R polymode tabbar exec-path-from-shell dash ess popup ivy helm-core helm-bibtex helm ebib bibtex-completion orgtbl-show-header org-kanban jedi elpy anaconda-mode pubmed org-bullets s org-table-comment org-publish-agenda org-plus-contrib org-agenda-property org-ac org notify markdown-mode lacarte julia-mode graphviz-dot-mode gnome-calendar doc-mode csv-mode color-theme-solarized cdlatex auctex anything-config anything alert adoc-mode))
 '(safe-local-variable-values '((TeX-master . t)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
