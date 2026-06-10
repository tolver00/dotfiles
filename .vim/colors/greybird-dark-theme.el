;;; greybird-dark-theme.el --- Greybird-dark inspired theme -*- lexical-binding: t; -*-

(deftheme greybird-dark
  "A calm dark theme derived from the Greybird-dark terminal palette.")

(let* ((class '((class color) (min-colors 89)))
       ;; ── Palette (sourced from colors.toml) ────────────────────────────────
       ;; Backgrounds — stepped from darkest to lightest
       (gb-bg         "#162122")   ; primary.background
       (gb-bg-alt     "#1d2829")   ; lifted bg: modeline, sidebars
       (gb-bg-hl      "#243132")   ; hl-line, tooltips
       (gb-selection  "#304537")   ; selection.background (green-tinged)
       (gb-border     "#2e3c3e")   ; panel borders

       ;; Foregrounds
       (gb-fg         "#d4d5d0")   ; primary.foreground
       (gb-fg-alt     "#bbbcb8")   ; normal.white — identifiers, dimmer text
       (gb-muted      "#6b8486")   ; bright.black — comments, line-numbers

       ;; Accent / syntax colours (lifted from the toml palette for readability)
       (gb-accent     "#9dccd4")   ; ↑ bright.blue — keywords, prompts
       (gb-cyan       "#7ec0cc")   ; ↑ normal.cyan — functions, builtins
       (gb-green      "#88c8a8")   ; ↑ bright.green — strings
       (gb-yellow     "#c8b47c")   ; warm amber (new) — types, doc-strings
       (gb-magenta    "#a898c4")   ; soft lavender (new) — constants, numbers
       (gb-red        "#c08878"))  ; ↑ bright.red — errors, warnings

  (custom-theme-set-faces
   'greybird-dark

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
   `(diff-added        ((,class (:background "#1e2d26" :foreground ,gb-green))))
   `(diff-removed      ((,class (:background "#2c2422" :foreground ,gb-red))))
   `(diff-changed      ((,class (:background "#232c2d" :foreground ,gb-yellow))))
   `(diff-header       ((,class (:background ,gb-bg-alt :foreground ,gb-fg-alt))))
   `(diff-file-header  ((,class (:background ,gb-bg-alt :foreground ,gb-fg :weight bold))))
   `(diff-hunk-header  ((,class (:background ,gb-bg-alt :foreground ,gb-accent))))

   ;; ── Magit ────────────────────────────────────────────────────────────────
   `(magit-diff-added             ((,class (:background "#1e2d26" :foreground ,gb-green))))
   `(magit-diff-removed           ((,class (:background "#2c2422" :foreground ,gb-red))))
   `(magit-diff-added-highlight   ((,class (:background "#263a2e" :foreground ,gb-green :weight bold))))
   `(magit-diff-removed-highlight ((,class (:background "#372a28" :foreground ,gb-red   :weight bold))))
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

(defun greybird-dark--ml-active-p ()
  (eq (selected-window) (get-buffer-window (current-buffer) t)))

(defun greybird-dark--ml-state ()
  "Colored state pill: accent=clean, yellow=modified, muted=read-only."
  (let* ((mod  (buffer-modified-p))
         (ro   buffer-read-only)
         (face (cond (ro 'gb-ml-readonly) (mod 'gb-ml-modified) (t 'gb-ml-normal))))
    (propertize " ◆ " 'face face)))

(defun greybird-dark--ml-buffer ()
  "Bold buffer name."
  (propertize (format " %s " (buffer-name)) 'face 'gb-ml-buffer))

(defun greybird-dark--ml-branch ()
  "VC branch in muted text, or empty string."
  (when (and (boundp 'vc-mode) vc-mode (stringp vc-mode))
    (let ((branch (string-trim
                   (replace-regexp-in-string "^ ?[A-Za-z]+-?:?" "" vc-mode))))
      (unless (string-empty-p branch)
        (propertize (format " ⎇ %s" branch) 'face 'gb-ml-info)))))

(defun greybird-dark--ml-flymake ()
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

(defun greybird-dark--ml-encoding ()
  "Show encoding only when it is not plain UTF-8 unix."
  (unless (memq buffer-file-coding-system '(utf-8-unix undecided-unix nil))
    (propertize (format " %s " (symbol-name buffer-file-coding-system))
                'face 'gb-ml-info)))

(defun greybird-dark--ml-narrow ()
  "Indicate when the buffer is narrowed."
  (when (buffer-narrowed-p)
    (propertize " ⇕Narrow " 'face 'gb-ml-warning)))

(defun greybird-dark--ml-rhs ()
  "Right-hand side: flymake + narrow + encoding + major mode + line:col."
  (concat
   (or (greybird-dark--ml-flymake) "")
   (or (greybird-dark--ml-narrow) "")
   (or (greybird-dark--ml-encoding) "")
   (propertize (format " %s " (format-mode-line "%m")) 'face 'gb-ml-info)
   (propertize (format-mode-line " %l:%c ") 'face 'gb-ml-position)))

(defun greybird-dark--ml-render ()
  "Assemble the full airline-style mode line."
  (if (greybird-dark--ml-active-p)
      ;; Active window: colored state pill + buffer + branch ⟩ mode + pos
      (let* ((lhs (concat (greybird-dark--ml-state)
                          (greybird-dark--ml-buffer)
                          (or (greybird-dark--ml-branch) "")))
             (rhs (greybird-dark--ml-rhs))
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
              '("%e" (:eval (greybird-dark--ml-render))))

(provide-theme 'greybird-dark)

;;; greybird-dark-theme.el ends here
