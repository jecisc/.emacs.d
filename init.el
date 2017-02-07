(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"]);;THEME
 '(custom-enabled-themes (quote (deeper-blue))) ;;THEME
 '(default-directory (expand-file-name "~/")) ;; Default directory into the home for windows
 '(inhibit-startup-screen t) ;; no more ugly screen at the beginning
 '(menu-bar-mode nil) ;; no more menu bar
 '(tool-bar-mode nil) ;; no more big toolbar

 ;; BACKUP FILES
 '(backup-by-copying t) ;; copy files and don't rename them
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups")))) ;;The temp files should be store into backup directory.
 '(delete-old-versions t) ;; do not ask me to delete backups
 '(kept-new-versions 6) ;; keep 6 new versions
 '(kept-old-versions 10) ;; keep 10 old versions
 '(version-control t) ;; I want a version controle on the backup files
 
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

;; I add the lisp folder to the load path
;; (add-to-list 'load-path "~/.emacs.d/lisp/")

;; line wraping
(setq auto-fill-mode 1)

;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Do not use gpg agent when runing in terminal
;; This will allow to use a non-graphical password prompt for gpg
(defadvice epg--start (around advice-epg-disable-agent activate)
  (let ((agent (getenv "GPG_AGENT_INFO")))
  (when (not (display-graphic-p))
    (setenv "GPG_AGENT_INFO" nil))
   ad-do-it
   (when (not (display-graphic-p))
     (setenv "GPG_AGENT_INFO" agent))))

;;PERSONNAL FUNCTIONS

;; Path (Copy of Damien init.el)
(defun add-to-executable-path (path)
  (let ((expanded-path (expand-file-name path)))
    (add-to-list 'exec-path expanded-path)
    (setenv "PATH" (concat expanded-path ":" (getenv "PATH")))))

(defun generate-temporary-buffer ()
  "open up a guaranteed new scratch buffer"
 (interactive)
  (switch-to-buffer (make-temp-name "scratch")))

(defun nxml-pretty-format ()
    (interactive)
    (save-excursion
        (shell-command-on-region (point-min) (point-max) "xmllint --format -" (buffer-name) t)
        (nxml-mode)
        (indent-region begin end)))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Use Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(mapc 'add-to-executable-path '("~/.cask/bin"))

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; EasyPG
(require 'epa-file)
(epa-file-enable)


;; For now I add the each packages of cask, see the answer of Damien to improve

;;> Et comme j'ai vu sur la doc de Cask j'ai fait: cask install
;;> J'ai désormais un dossier pillar-20141112.1011 dans .
;;> emacs.d/.cask/24.4.1/elpa/
;;> cependant quand je suis dans emacs je n'ai toujours pas le
;;> pillar-mode.
;;
;;c'est normal. Cask se charge de télécharger les paquets dans le .cask et
;;de les ajouter dans la variable 'load-path. C'est à toi de demander à
;;Emacs de charger ce que tu veux quand tu le veux. Le plus simple est
;;d'ajouter un require pour chaque paquet que tu veux charger :
;;
;;(require 'pillar)
;;
;;Quand tu auras de nombreux paquets, il faudra faire les choses un peu
;;plus intelligemment car la ligne ci-dessus charge Pillar lors du
;;lancement d'Emacs alors qu'a priori tu n'en as besoin que lorsque tu
;;édites un fichier .pillar ou .pier. Mais tu pourras voir ça plus tard
;;(moi j'utilise use-package pour faire ça).

(require 'dired-toggle-sudo)

(require 'pillar)

(require 'jdee)

(require 'shampoo)

(require 'xquery-mode)

(require 'nix-mode)

(require 'nixos-options)

(require 'magit)
(global-set-key (kbd "C-x C-g s") 'magit-status)
(global-set-key (kbd "C-x C-g c ") 'magit-clone)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ; Enable guide-key-mode


