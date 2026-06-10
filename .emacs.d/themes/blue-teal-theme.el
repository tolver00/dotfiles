;;; blue-teal-theme.el --- Greybird-dark inspired theme -*- lexical-binding: t; -*-

(deftheme blue-teal
  "A calm dark theme derived from the Blue-teal terminal palette.")

(let* ((class '((class color) (min-colors 89)))
       ;; ── Palette (sourced from blue_teal.vim) ──────────────────────────────
       ;; Backgrounds — stepped from darkest to lightest
       (gb-bg         "#203033")   ; primary.background      dark0
       (gb-bg-alt     "#293D42")   ; modeline, sidebars      dark1
       (gb-bg-hl      "#304048")   ; hl-line, panels         dark3
       (gb-selection  "#2C444E")   ; selection.background    dark2
       (gb-border     "#3A4C52")   ; panel borders           dark4

       ;; Foregrounds
       (gb-fg         "#C2D6DA")   ; primary.foreground      light0
       (gb-fg-alt     "#90B4BC")   ; dimmer text             light2
       (gb-muted      "#607A82")   ; comments, line-numbers  gray_245

       ;; Accent / syntax colours
       (gb-accent     "#5C88C8")   ; keywords                bright_blue   L~58%
       (gb-cyan       "#6AC0CC")   ; functions, builtins     bright_aqua   L~62%
       (gb-green      "#6EAA78")   ; strings                 bright_green  L~54%
       (gb-yellow     "#B8A060")   ; types, doc-strings      bright_yellow L~56%
       (gb-magenta    "#9070B0")   ; constants, numbers      bright_purple L~53%
       (gb-red        "#C87878"))  ; errors, warnings        bright_red    L~58%

  (custom-theme-set-faces
   'blue-teal

   ;; ── Base UI ───────────────────────────────────────────────────────────────
   `(default       ((,class (:background ,gb-bg :foreground ,gb-fg))))
   `(cursor        ((,class (:background ,gb-accent))))
   `(fringe        ((,class (:background ,gb-bg :foreground ,gb-muted))))
   `(region        ((,class (:background ,gb-selection :foreground ,gb-fg))))
   `(highlight     ((,class (:background ,gb-bg-hl))))
   `(hl-line       ((,class (:background ,gb-bg-hl))))
   `(shadow        ((,class (:foreground ,gb-muted))))
   `(link          ((,class (:foreground ,gb-accent :underline t))))
   `(link-visited  ((,class (:foreground ,gb-cyan :underline t))))
   `(vertical-border  ((,class (:foreground ,gb-border))))
   `(window-divider   ((,class (:foreground ,gb-border))))
   `(minibuffer-prompt ((,class (:foreground ,gb-accent :weight bold))))
   `(secondary-selection ((,class (:background ,gb-bg-hl))))

   ;; ── Line numbers ─────────────────────────────────────────────────────────
   `(line-number              ((,class (:foreground ,gb-muted :background ,gb-bg))))
   `(line-number-current-line ((,class (:foreground ,gb-fg-alt :background ,gb-bg-alt :weight bold))))

   ;; ── Mode line ─────────────────────────────────────────────────────────────
   `(mode-line
     ((,class (:background ,gb-bg-alt :foreground ,gb-fg
               :box (:line-width -1 :color ,gb-border)))))
   `(mode-line-inactive
     ((,class (:background ,gb-bg :foreground ,gb-muted
               :box (:line-width -1 :color ,gb-border)))))
   `(mode-line-buffer-id    ((,class (:foreground ,gb-accent :weight bold))))
   `(mode-line-emphasis     ((,class (:foreground ,gb-fg :weight bold))))
   `(mode-line-highlight    ((,class (:foreground ,gb-green))))

   ;; ── Syntax highlighting ───────────────────────────────────────────────────
   `(font-lock-comment-face           ((,class (:foreground ,gb-muted :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:inherit font-lock-comment-face))))
   `(font-lock-doc-face               ((,class (:foreground ,gb-yellow :slant italic))))
   `(font-lock-doc-markup-face        ((,class (:foreground ,gb-cyan :slant italic))))
   `(font-lock-string-face            ((,class (:foreground ,gb-green))))
   `(font-lock-keyword-face           ((,class (:foreground ,gb-accent :weight semi-bold))))
   `(font-lock-builtin-face           ((,class (:foreground ,gb-cyan))))
   `(font-lock-function-name-face     ((,class (:foreground ,gb-cyan))))
   `(font-lock-function-call-face     ((,class (:foreground ,gb-fg-alt))))
   `(font-lock-variable-name-face     ((,class (:foreground ,gb-fg-alt))))
   `(font-lock-variable-use-face      ((,class (:foreground ,gb-fg))))
   `(font-lock-constant-face          ((,class (:foreground ,gb-magenta))))
   `(font-lock-number-face            ((,class (:foreground ,gb-magenta))))
   `(font-lock-type-face              ((,class (:foreground ,gb-yellow))))
   `(font-lock-preprocessor-face      ((,class (:foreground ,gb-accent :slant italic))))
   `(font-lock-negation-char-face     ((,class (:foreground ,gb-red :weight bold))))
   `(font-lock-warning-face           ((,class (:foreground ,gb-red :weight bold))))
   `(error                            ((,class (:foreground ,gb-red :weight bold))))
   `(warning                          ((,class (:foreground ,gb-yellow :weight bold))))
   `(success                          ((,class (:foreground ,gb-green :weight bold))))

   ;; ── Search ────────────────────────────────────────────────────────────────
   ;; Active match: inverted accent (cursor colour)
   `(isearch        ((,class (:background ,gb-accent :foreground ,gb-bg :weight bold))))
   `(isearch-fail   ((,class (:background ,gb-red    :foreground ,gb-bg :weight bold))))
   ;; Other matches: subtle background tint
   `(lazy-highlight ((,class (:background ,gb-bg-hl  :foreground ,gb-accent))))

   ;; ── Show-paren ────────────────────────────────────────────────────────────
   `(show-paren-match    ((,class (:background ,gb-selection :foreground ,gb-fg :weight bold))))
   `(show-paren-mismatch ((,class (:background ,gb-red :foreground ,gb-bg :weight bold))))

   ;; ── Dired ────────────────────────────────────────────────────────────────
   `(dired-directory  ((,class (:foreground ,gb-accent :weight bold))))
   `(dired-flagged    ((,class (:foreground ,gb-red))))
   `(dired-marked     ((,class (:foreground ,gb-yellow :weight bold))))
   `(dired-symlink    ((,class (:foreground ,gb-cyan))))
   `(dired-perm-write ((,class (:foreground ,gb-magenta))))

   ;; ── Diff ─────────────────────────────────────────────────────────────────
   `(diff-added        ((,class (:background "#1E2B22" :foreground ,gb-green))))
   `(diff-removed      ((,class (:background "#2A2020" :foreground ,gb-red))))
   `(diff-changed      ((,class (:background "#202E32" :foreground ,gb-yellow))))
   `(diff-header       ((,class (:background ,gb-bg-alt :foreground ,gb-fg-alt))))
   `(diff-file-header  ((,class (:background ,gb-bg-alt :foreground ,gb-fg :weight bold))))
   `(diff-hunk-header  ((,class (:background ,gb-bg-alt :foreground ,gb-accent))))

   ;; ── Magit ────────────────────────────────────────────────────────────────
   `(magit-diff-added             ((,class (:background "#1E2B22" :foreground ,gb-green))))
   `(magit-diff-removed           ((,class (:background "#2A2020" :foreground ,gb-red))))
   `(magit-diff-added-highlight   ((,class (:background "#243428" :foreground ,gb-green :weight bold))))
   `(magit-diff-removed-highlight ((,class (:background "#342424" :foreground ,gb-red   :weight bold))))
   `(magit-section-heading        ((,class (:foreground ,gb-accent :weight bold))))
   `(magit-section-highlight      ((,class (:background ,gb-bg-hl))))
   `(magit-branch-local           ((,class (:foreground ,gb-cyan))))
   `(magit-branch-remote          ((,class (:foreground ,gb-green))))
   `(magit-tag                    ((,class (:foreground ,gb-yellow))))

   ;; ── Completions (company / corfu) ────────────────────────────────────────
   `(company-tooltip              ((,class (:background ,gb-bg-alt :foreground ,gb-fg))))
   `(company-tooltip-selection    ((,class (:background ,gb-bg-hl  :foreground ,gb-fg))))
   `(company-tooltip-annotation   ((,class (:foreground ,gb-muted))))
   `(company-tooltip-common       ((,class (:foreground ,gb-accent))))
   `(company-scrollbar-bg         ((,class (:background ,gb-bg))))
   `(company-scrollbar-fg         ((,class (:background ,gb-border))))

   `(corfu-default    ((,class (:background ,gb-bg-alt :foreground ,gb-fg))))
   `(corfu-current    ((,class (:background ,gb-bg-hl  :foreground ,gb-fg))))
   `(corfu-border     ((,class (:background ,gb-border))))
   `(corfu-annotations ((,class (:foreground ,gb-muted))))

   ;; ── Vertico / Consult ────────────────────────────────────────────────────
   `(vertico-current         ((,class (:background ,gb-bg-hl :foreground ,gb-fg :weight bold))))
   `(completions-annotations ((,class (:foreground ,gb-muted :slant italic))))
   `(completions-common-part ((,class (:foreground ,gb-accent :weight bold))))

   ;; ── Org-mode ─────────────────────────────────────────────────────────────
   `(org-document-title    ((,class (:foreground ,gb-fg :weight bold :height 1.2))))
   `(org-level-1           ((,class (:foreground ,gb-accent  :weight bold))))
   `(org-level-2           ((,class (:foreground ,gb-cyan    :weight bold))))
   `(org-level-3           ((,class (:foreground ,gb-green))))
   `(org-level-4           ((,class (:foreground ,gb-yellow))))
   `(org-block             ((,class (:background ,gb-bg-alt :extend t))))
   `(org-block-begin-line  ((,class (:foreground ,gb-muted  :background ,gb-bg-alt :extend t))))
   `(org-block-end-line    ((,class (:inherit org-block-begin-line))))
   `(org-code              ((,class (:foreground ,gb-green  :background ,gb-bg-hl))))
   `(org-verbatim          ((,class (:foreground ,gb-cyan   :background ,gb-bg-hl))))
   `(org-link              ((,class (:foreground ,gb-accent :underline t))))
   `(org-todo              ((,class (:foreground ,gb-red    :weight bold))))
   `(org-done              ((,class (:foreground ,gb-muted  :weight bold))))
   `(org-date              ((,class (:foreground ,gb-magenta))))
   `(org-tag               ((,class (:foreground ,gb-muted  :slant italic))))

   ;; ── Flymake / Flycheck ───────────────────────────────────────────────────
   `(flymake-error   ((,class (:underline (:style wave :color ,gb-red)))))
   `(flymake-warning ((,class (:underline (:style wave :color ,gb-yellow)))))
   `(flymake-note    ((,class (:underline (:style wave :color ,gb-cyan)))))

   ;; ── Whitespace / trailing ─────────────────────────────────────────────────
   `(trailing-whitespace ((,class (:background ,gb-red))))

   ;; ── Mode line segments ────────────────────────────────────────────────────
   ;; State pill (leftmost, colored background — the airline "mode" section)
   `(gb-ml-normal   ((,class (:background ,gb-accent  :foreground ,gb-bg :weight bold))))
   `(gb-ml-modified ((,class (:background ,gb-yellow  :foreground ,gb-bg :weight bold))))
   `(gb-ml-readonly ((,class (:background ,gb-muted   :foreground ,gb-bg :weight bold))))
   ;; Buffer name: bold, full foreground
   `(gb-ml-buffer   ((,class (:foreground ,gb-fg :weight bold))))
   ;; Secondary info: branch, major mode, position
   `(gb-ml-info     ((,class (:foreground ,gb-muted))))
   ;; Position (right segment): slightly brighter than info
   `(gb-ml-position ((,class (:foreground ,gb-fg-alt))))
   ;; Flymake diagnostic indicators
   `(gb-ml-ok       ((,class (:foreground ,gb-green))))
   `(gb-ml-warning  ((,class (:foreground ,gb-yellow :weight bold))))
   `(gb-ml-error    ((,class (:foreground ,gb-red    :weight bold)))))

  ) ; end custom-theme-set-faces

;; ── Mode line helpers ─────────────────────────────────────────────────────

(defun blue-teal--ml-active-p ()
  (eq (selected-window) (get-buffer-window (current-buffer) t)))

(defun blue-teal--ml-state ()
  "Colored state pill: accent=clean, yellow=modified, muted=read-only."
  (let* ((mod  (buffer-modified-p))
         (ro   buffer-read-only)
         (face (cond (ro 'gb-ml-readonly) (mod 'gb-ml-modified) (t 'gb-ml-normal))))
    (propertize " ◆ " 'face face)))

(defun blue-teal--ml-buffer ()
  "Bold buffer name."
  (propertize (format " %s " (buffer-name)) 'face 'gb-ml-buffer))

(defun blue-teal--ml-branch ()
  "VC branch in muted text, or empty string."
  (when (and (boundp 'vc-mode) vc-mode (stringp vc-mode))
    (let ((branch (string-trim
                   (replace-regexp-in-string "^ ?[A-Za-z]+-?:?" "" vc-mode))))
      (unless (string-empty-p branch)
        (propertize (format " ⎇ %s" branch) 'face 'gb-ml-info)))))

(defun blue-teal--ml-flymake ()
  "Flymake error/warning summary, or nil when flymake is not running."
  (when (bound-and-true-p flymake-mode)
    (let* ((diags (flymake-diagnostics))
           (errs  (length (seq-filter
                           (lambda (d) (eq :error (flymake-diagnostic-type d)))
                           diags)))
           (warns (length (seq-filter
                           (lambda (d) (eq :warning (flymake-diagnostic-type d)))
                           diags))))
      (cond
       ((> errs  0) (propertize (format " ✖ %d " errs)  'face 'gb-ml-error))
       ((> warns 0) (propertize (format " ⚠ %d " warns) 'face 'gb-ml-warning))
       (t           (propertize " ✔ "                    'face 'gb-ml-ok))))))

(defun blue-teal--ml-encoding ()
  "Show encoding only when it is not plain UTF-8 unix."
  (unless (memq buffer-file-coding-system '(utf-8-unix undecided-unix nil))
    (propertize (format " %s " (symbol-name buffer-file-coding-system))
                'face 'gb-ml-info)))

(defun blue-teal--ml-narrow ()
  "Indicate when the buffer is narrowed."
  (when (buffer-narrowed-p)
    (propertize " ⇕Narrow " 'face 'gb-ml-warning)))

(defun blue-teal--ml-rhs ()
  "Right-hand side: flymake + narrow + encoding + major mode + line:col."
  (concat
   (or (blue-teal--ml-flymake) "")
   (or (blue-teal--ml-narrow) "")
   (or (blue-teal--ml-encoding) "")
   (propertize (format " %s " (format-mode-line "%m")) 'face 'gb-ml-info)
   (propertize (format-mode-line " %l:%c ") 'face 'gb-ml-position)))

(defun blue-teal--ml-render ()
  "Assemble the full airline-style mode line."
  (if (blue-teal--ml-active-p)
      ;; Active window: colored state pill + buffer + branch ⟩ mode + pos
      (let* ((lhs (concat (blue-teal--ml-state)
                          (blue-teal--ml-buffer)
                          (or (blue-teal--ml-branch) "")))
             (rhs (blue-teal--ml-rhs))
             (fill (propertize " "
                               'display `(space :align-to
                                          (- right ,(string-width
                                                     (format-mode-line rhs)))))))
        (concat lhs fill rhs))
    ;; Inactive window: plain muted text, no colored pill
    (let* ((name (propertize (format "  %s  " (buffer-name)) 'face 'gb-ml-info))
           (pos  (propertize (format-mode-line " %l:%c ") 'face 'gb-ml-info))
           (fill (propertize " "
                             'display `(space :align-to
                                        (- right ,(string-width
                                                   (format-mode-line pos)))))))
      (concat name fill pos))))

(setq-default mode-line-format
              '("%e" (:eval (blue-teal--ml-render))))

(provide-theme 'blue-teal)

;;; blue-teal-theme.el ends here
