;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     yaml
     html
     deft
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     (org :variables org-enable-github-support t)
     org-roam
     pdf-tools
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     python
     javascript
     java
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ox-clip
     helm-org-rifle
     org-cliplink
     org-ql
     helm-org
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   ;; ----
   ;; There's a bug [0] in org-projectile that interferes with capture and
   ;; generates error messages. It is fixed in the develop branch but I'd rather
   ;; stay with vanilla master and not cherry-pick. Since I'm not using
   ;; org-projectile yet, the easiest is to exclude it.
   ;; [0] https://github.com/syl20bnr/spacemacs/issues/9374#issuecomment-325238803
   dotspacemacs-excluded-packages '(org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Disable hl-todo in org-mode, it messes up the TODO kw highlighting
  ;; This will be set by default in a future version of spacemacs, and then we can remove it
  ;; (check https://github.com/syl20bnr/spacemacs/issues/9950)
  (setq global-hl-todo-mode 1)
  (add-hook 'org-mode-hook (lambda () (hl-todo-mode -1) nil))

  ;; Jump out of parens, quotes etc.
  (global-set-key (kbd "C-l") 'sp-up-sexp)

  ;; System locale to use for formatting time values.
  (setq system-time-locale "C")         ; Make sure that the weekdays in the
                                        ; time stamps of your Org mode files and
                                        ; in the agenda appear in English.

  ;; Try to get agenda to split vertically a bit more often
  (setq split-width-threshold 144)

  ;; Javascript
  (setq js-indent-level 2)

  ;; Open org archive files in org-mode
  (add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode)) 

  ;; Magit
  (with-eval-after-load 'evil-magit
    ;; do not quit buffer on Esc (use q instead)
    (evil-magit-define-key 'normal 'magit-mode-map "<escape>" nil))

  ;; Auto-completion is not useful in org-mode and introduces graphic glitches
  (spacemacs|disable-company org-mode)

  ;; Custom key bindings
  ;; ===================


  ;; Use avy to jump around the screen
  (global-set-key (kbd "C-'") 'evil-avy-goto-char-timer)

  ;; Use C-; to insert current datetime like in every other app
  (defun rodelrod/insert-timestamp ()
    "Insert current date time formatted like an org inactive timestamp."
    (interactive)
    (insert (format-time-string "[%Y-%m-%d %a %H:%M]")))
  (global-set-key (kbd "C-;") 'rodelrod/insert-timestamp)

  ;; Own prefix (after SPC)
  (spacemacs/declare-prefix "o" "own-menu")

  ;; Global and Org key bindings for org-rifle
  (spacemacs/set-leader-keys "or" 'helm-org-rifle)


  ;; Org key binding for org-columns
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "oc" 'org-columns)

  ;; Org key binding for org-cliplink
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "op" 'org-cliplink)

  ;; Org key bindings for IDs
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "ol" 'org-store-link)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "oy" 'org-id-protocol-link-copy)


  ;; Org settings
  ;; ============

  ;; Wrap lines respecting indent
  (add-hook 'org-mode-hook 'visual-line-mode)

  (with-eval-after-load 'org
    (setq org-directory "~/org")
    (setq org-agenda-files '("~/org/"))
    (setq org-todo-keywords
          '((sequence "TODO(t)" "NEXT(n)" "WAITING(w@)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c@)")))
    (spacemacs/toggle-mode-line-org-clock-on)
    (setq org-hide-emphasis-markers t)
    (setq org-enforce-todo-dependencies t)
    ;; Put log notes (C-c C-z) and state changes in LOGBOOK drawer.
    (setq org-log-into-drawer t)
    ;; Make Ctrl-i jump back like in Vim by dissociating it from TAB.
    (setq dotspacemacs-distinguish-gui-tab t)
    ;; Open narrowed indirect buffer in a new frame instead of re-using another window.
    ;; This means I have to delete the buffers myself, or they'll just accumulate.
    (setq org-indirect-buffer-display 'new-frame)

    ;; Create and use ID property for links, instead of text
    ;; Uses a human-readable CUSTOM_ID property if it exists
    ;;
    ;; For some reason I need to use the first 2 lines here to force loading
    ;; `org-id', or else this won't work (`org-store' won't create an ID
    ;; property) until a `org-id-*' command is executed.
    (require 'org-id)
    (add-to-list 'org-modules 'org-id)
    (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

    ;; Create an Evernote link type that will a custom launch script at
    ;; `~/bin/nixnote_url' which opens the correct note in Nixnote2.
    (defun evernote-open-link (url)
      (let ((display-buffer-alist
             (cons (cons "\\*Async Shell Command\\*.*"
                         (cons #'display-buffer-no-window nil))
                   display-buffer-alist))) ;; suppress async shell command window
        (async-shell-command (concat "nixnote_url evernote:" url))))
    (org-add-link-type "evernote" 'evernote-open-link)

    ;; Deft
    ;; ----
    (setq deft-directory "~/org/notes")
    (setq deft-recursive t)
    (setq deft-use-filename-as-title nil)

    ;; Org-Protocol
    ;; ------------
    (require 'org-protocol)
    (add-to-list 'org-modules 'org-protocol)
    (setq org-protocol-default-template-key "p")

    ;; Allow linking to a heading from outside emacs
    ;; from https://emacs.stackexchange.com/a/58174/29166
    (add-to-list 'org-protocol-protocol-alist
                 '("org-id" :protocol "org-id"
                 :function org-id-protocol-goto-org-id))

    (defun org-id-protocol-goto-org-id (info)
      "This handler simply goes to the org heading with given id using emacsclient.

    INFO is an alist containing additional information passed by the protocol URL.
    It should contain the id key, pointing to the path of the org id.

      Example protocol string:
      org-protocol://org-id?id=309A0509-81BE-4D51-87F4-D3F61B79EBA4"
      (when-let ((id (plist-get info :id)))
        (org-id-goto id))
      nil)

    (defun org-id-protocol-link-copy ()
      (interactive)
      (org-kill-new (concat "org-protocol://org-id?id="
                            (org-id-copy))))

    ;; Org-Rifle
    ;; ----------
    ;; show path to header in search results
    (setq helm-org-rifle-show-path t)

    ;; While I do want to prepend the paths in helm-org-rifle, the few times
    ;; that I use helm-org-rifle-occur this setting breaks the occur
    ;; functionality because the buffer does not respect the Org syntax. I asked
    ;; the author [1] and he was kind enough to give me a workaround.
    ;; [1]  https://github.com/alphapapa/org-rifle/issues/46
    (defun rodelrod/helm-org-rifle-occur ()
      "Call `helm-org-rifle-occur' with paths disabled."
      (interactive)
      (let (helm-org-rifle-show-path)
        (call-interactively #'helm-org-rifle-occur)))

    ;; Org-Agenda
    ;; ----------
    (setq org-agenda-custom-commands
          '(("n" "Agenda, NEXT, and other TODOs"
             ((agenda "" nil)
              (todo "NEXT"
                    ((org-agenda-overriding-header "Unscheduled NEXT items:")
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))))
              (todo "WAITING" nil)
              )
             nil)

            ;; Last week entries sorted roughly by from latest to earliest (it's
            ;; hard to sort by creation date, which is what I wanted).
            ("l"  "Entries created last week"
             tags "+TIMESTAMP_IA>\"<-1w>\""
             ((org-agenda-sorting-strategy '(tsia-down timestamp-down))))

            ;; Allow me to archive old items. I prefer archiving only level-2
            ;; headings: Level-1 are Areas and Level-2 can be projects or odd
            ;; tasks. I want to archive project trees in one go instead of
            ;; having the tasks scattered in the Archive datetree.
            ("r" "Tasks/Projects ready to archive (Level-2 items closed more than 2 months ago)"
             tags "+CLOSED<\"<-2m>\"+LEVEL=2")))

    ;; The default 'reorganize-frame always makes me lose windows
    (setq org-agenda-window-setup 'other-window)

    ;; Org-Archive
    ;; -----------
    (setq org-archive-location "%s_archive::datetree/")

    ;; Auto-save all org files on some org-agenda commands (feel free to add)
    ;; based on https://emacs.stackexchange.com/a/7840 and https://emacs.stackexchange.com/a/489
    (advice-add 'org-agenda-quit :before 'org-save-all-org-buffers)
    (advice-add 'org-archive-subtree :after #'org-save-all-org-buffers)
    (advice-add 'org-refile :after 'org-save-all-org-buffers)
    (add-hook 'org-capture-after-finalize-hook 'org-save-all-org-buffers)

    ;; Org-Refile
    ;; ----------
    ;; based on https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
    (defun my-refile-reference-files ()
      "Define a callable with no arguments (through partial applicatin) that I
       can pass to org-refile-targets."
      (directory-files "~/org/reference/" 'full ".*\.org")
      )
    (setq org-refile-targets
          '(
            (my-refile-reference-files :maxlevel . 2)
            (org-agenda-files :maxlevel . 2)
            ))
    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)

    ;; Org-Capture
    ;; -----------
    (setq org-default-notes-file "inbox.org")
    ;; Get into insert state immediately after entering Capture
    (add-hook 'org-capture-mode-hook 'evil-insert-state)
    (setq org-capture-templates
          '(("t" "todo" entry
             (file "inbox.org")
             "* TODO %?\n  %U\n")
            ("n" "note" entry
             (file "inbox.org")
             "* %?\n  %U\n")
            ("p" "org-protocol" entry
             (file "inbox.org")
             "* %:annotation\n  %U\n\n%i\n"
             :empty-lines 1
             :immediate-finish t)
            ("r" "weekly org review" entry
             (file "weekly_reviews.org")
             (file "~/org/templates/review.org"))
            )
          )

    ;; Org-Pomodoro
    ;; ------------
    (setq org-pomodoro-start-sound-p t)
    (setq org-pomodoro-ticking-sound-p t)


    ;; Org-Roam
    ;; --------
    (setq org-roam-tag-sources '(prop all-directories))
    (setq org-roam-directory "~/org/notes")

    ;; Org-Sparse-Tree
    ;; ---------------
    ;; Include all types of dates in the date range filter
    '(org-sparse-tree-default-date-type (quote all))

    ;; Org-Stuck-Projects
    ;; ------------------
    ;; List as stuck project if ProjectState property is ACTIVE but it has no
    ;; sub-task marked as NEXT; except if project is marked as a SOMEDAY, DONE
    ;; or CANCELLED todo item. The ProjectState property is set automatically on
    ;; every heading that has a statistics cookie.
    (setq org-stuck-projects
          '("+ProjectState=\"ACTIVE\"/-SOMEDAY-DONE-CANCELLED" ("NEXT") nil ""))

    ;; Toggle ProjectState in headings with a statistic cookie between
    ;; ACTIVE (if it contains at least one subtask to be done) and
    ;; MUTED (if there's no subtask to be done).
    (defun org-summary-todo (n-done n-not-done)
      "Switch entry to DONE when all subentries are done, to TODO otherwise."
      (let (org-log-done org-log-states)   ; turn off logging
        (org-set-property "ProjectState" (if (= n-not-done 0) "MUTED" "ACTIVE"))))
    (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

    ;; Set ACTIVE and MUTED as allowed values for ProjectState
    (defun org-property-set-allowed-project-states (property)
      "Set allowed valued for the ProjectState property."
      (when (equal property "ProjectState") '("ACTIVE" "MUTED")))
    (add-hook 'org-property-allowed-value-functions 'org-property-set-allowed-project-states)

    ;; Fix M-RET behaviour in Spacemacs
    (org-defkey org-mode-map [(meta return)] 'org-meta-return)

    ;; Move a sub-tree to the top or bottom of its parent
    ;; --------------------------------------------------
    ;; Copied from a John Kitchin's SO answer: https://emacs.stackexchange.com/a/43662
    (defun JK-org-move-to-extreme (up)
      "Move current org subtree to the end of its parent.
       With prefix arg move subtree to the start of its parent."
      (interactive "P")
      (condition-case err
          (while t
            (funcall (if up
                         'org-move-subtree-up
                       'org-move-subtree-down)))
        (user-error
         (let ((err-msg (cadr err)))
           (unless (string-match "Cannot move past superior level or buffer limit" err-msg)
             (signal 'user-error (list err-msg)))))))

    (defun JK-org-move-to-top ()
      "Move sub-tree to top of parent"
      (interactive)
      (setq current-prefix-arg 4) ; C-u
      (call-interactively 'JK-org-move-to-extreme))

    (defun JK-org-move-to-bottom ()
      "Move sub-tree to bottom of parent"
      (interactive)
      (call-interactively 'JK-org-move-to-extreme))

    ;; Bind keys
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "ht" 'JK-org-move-to-top)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "hb" 'JK-org-move-to-bottom)

    )

  ;; Function used to launch agenda on emacs client startup
  (defun org-agenda-show-n (&optional arg)
    (interactive "P")
    (org-agenda arg "n"))

  ;; Load org-babel languages
  (require 'ob-python)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))

  ;; Export to an `./exports' directory to prevent cluttering the main file and
  ;; allow to easily exclude from git.
  ;; Adapted from https://stackoverflow.com/a/47850858/20989
  (defun org-export-output-file-name-modified (orig-fun extension &optional subtreep pub-dir)
    (unless pub-dir
      (setq pub-dir "exports")
      (unless (file-directory-p pub-dir)
        (make-directory pub-dir)))
    (apply orig-fun extension subtreep pub-dir nil))
  (advice-add 'org-export-output-file-name :around #'org-export-output-file-name-modified)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-completion-style (quote emacs))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default))))
 '(org-sparse-tree-default-date-type (quote all))
 '(package-selected-packages
   (quote
    (emacsql-sqlite3 emacsql map yequake helm-rg ox-gfm pdf-tools tablist org-roam helm-org org-ql peg ov org-super-agenda ts ht git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flycheck-pos-tip pos-tip flycheck diff-hl lv transient org-cliplink imenu-list csv-mode yaml-mode helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-tern company-statistics company-emacs-eclim company-anaconda company auto-yasnippet ac-ispell auto-complete deft mmm-mode markdown-toc markdown-mode gh-md smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub treepy let-alist graphql with-editor helm-org-rifle tern yapfify web-beautify pyvenv pytest pyenv-mode py-isort pip-requirements livid-mode skewer-mode simple-httpd live-py-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode dash-functional helm-pydoc eclim yasnippet cython-mode coffee-mode anaconda-mode pythonic powerline spinner org-category-capture alert log4e gntp hydra htmlize parent-mode projectile pkg-info epl haml-mode flx smartparens iedit anzu evil goto-chg undo-tree highlight f dash s bind-map bind-key packed helm avy helm-core popup async org-plus-contrib ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline slim-mode scss-mode sass-mode restart-emacs request rainbow-delimiters pug-mode popwin persp-mode pcre2el paradox ox-clip org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint less-css-mode indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-ag google-translate golden-ratio gnuplot flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
