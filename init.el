(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(defun joindirs (root &rest dirs)	;
  "Joins a series of directories together, like Python's os.path.join,
  (dotemacs-joindirs \"/tmp\" \"a\" \"b\" \"c\") => /tmp/a/b/c"

  (if (not dirs)
      root
    (apply 'joindirs
	   (expand-file-name (car dirs) root)
	   (cdr dirs))))


(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get-bundle org
  :type git
  :url "git://orgmode.org/org-mode.git"
  :build ("make clean" "make" "make doc")
  :prepare
  (progn
    (setq load-path (remove "/Applications/Emacs.app/Contents/Resources/lisp/org" load-path))    
    (add-to-list 'load-path (joindirs user-emacs-directory "el-get" "org" "lisp"))
    (add-to-list 'load-path (joindirs user-emacs-directory "el-get" "org" "contrib" "lisp"))
    (require 'ox-beamer)
    )
  )

(setq magit-last-seen-setup-instructions "1.4.0")

(org-babel-load-file (joindirs user-emacs-directory "settings.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "2aa073a18b2ba860d24d2cd857bcce34d7107b6967099be646d9c95f53ef3643" "94146ac747852749e9444b184eb1e958f0e546072f66743929a05c3af62de473" "4c028a90479b9ad4cbb26ae7dc306dded07718749fe7e4159621a8aebac40213" "9bb642187b302a23587b5ed0e0276772d836516c48c70fbf1dfea9fed55d0e38" "d9046dcd38624dbe0eb84605e77d165e24fdfca3a40c3b13f504728bab0bf99d" "523d5a027e2f378ad80f9b368db450f4a5fa4a159ae11d5b66ccd78b3f5f807d" "b0984818158ff2fa3ae511a2f3db7ea239a223d1dc09475c6c2ccdbc8ee03dd3" "3b0360a4dd337050bf9e25eeae4424f4bbf7d34b2900a286db3f534121ecb1ab" "866be962f0a48c2fe648ea23a3f3c0148e5747d05626d75b6eaa9cd55a44c592" default)))
 '(org-agenda-files (quote ("~/Desktop/pablo/tec-isc/discrete-math/notes.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
