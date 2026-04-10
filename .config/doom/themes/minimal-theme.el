;;; minimal-theme.el --- A minimal, muted dark theme -*- lexical-binding: t; -*-

;; Author: Custom
;; Version: 1.0
;; Package-Requires: ((emacs "27.1"))

;;; Commentary:
;; A minimal dark theme ported from a Helix editor theme.
;; Philosophy: most syntax is the same color (#e8e8e8), with only
;; comments (green), strings/escapes (warm tan), and a few subdued
;; elements differentiated.

;;; Code:

(deftheme minimal "A minimal, muted dark theme.")

(let ((bg          "#262626")
      (bg-alt      "#1e1e1e")
      (bg-hl       "#252526")
      (bg-popup    "#2d2d2d")
      (bg-sel      "#264f78")
      (fg          "#e8e8e8")
      (fg-dim      "#999999")
      (fg-faint    "#3a3a3a")
      (fg-indent   "#333333")
      (green       "#7ec07e")
      (tan         "#deb08a")
      (blue        "#6bb5ff")
      (blue-info   "#4da6ff")
      (purple      "#d098d0")
      (red         "#f55858")
      (yellow      "#d4b020"))

  (custom-theme-set-faces
   'minimal

   ;; ── Basic faces ──────────────────────────────────────
   `(default                          ((t (:foreground ,fg :background ,bg))))
   `(cursor                           ((t (:background ,fg))))
   `(region                           ((t (:background ,bg-sel))))
   `(highlight                        ((t (:background ,bg-sel))))
   `(hl-line                          ((t (:background ,bg-hl))))
   `(fringe                           ((t (:background ,bg-alt))))
   `(vertical-border                  ((t (:foreground ,fg-faint))))
   `(border                           ((t (:foreground ,fg-faint))))
   `(shadow                           ((t (:foreground ,fg-dim))))
   `(minibuffer-prompt                ((t (:foreground ,blue :bold t))))
   `(link                             ((t (:foreground ,fg :underline t))))
   `(link-visited                     ((t (:foreground ,fg-dim :underline t))))
   `(escape-glyph                     ((t (:foreground ,tan))))
   `(success                          ((t (:foreground ,green))))
   `(warning                          ((t (:foreground ,yellow))))
   `(error                            ((t (:foreground ,red))))
   `(trailing-whitespace              ((t (:background ,red))))
   `(lazy-highlight                   ((t (:background ,bg-sel))))

   ;; ── Line numbers ────────────────────────────────────
   `(line-number                      ((t (:foreground ,fg-dim :background ,bg-alt))))
   `(line-number-current-line         ((t (:foreground ,fg :background ,bg-hl :bold t))))

   ;; ── Mode-line / status line ──────────────────────────
   `(mode-line                        ((t (:foreground ,fg :background ,bg-hl))))
   `(mode-line-inactive               ((t (:foreground ,fg-dim :background ,bg-hl))))
   `(mode-line-emphasis               ((t (:foreground ,blue :bold t))))
   `(mode-line-buffer-id              ((t (:foreground ,fg :bold t))))
   `(header-line                      ((t (:foreground ,fg :background ,bg-hl))))

   ;; ── Doom modeline (if present) ───────────────────────
   `(doom-modeline-bar                ((t (:background ,blue))))
   `(doom-modeline-bar-inactive       ((t (:background ,bg-hl))))
   `(doom-modeline-buffer-file        ((t (:foreground ,fg :bold t))))
   `(doom-modeline-buffer-modified    ((t (:foreground ,tan :bold t))))
   `(doom-modeline-project-dir        ((t (:foreground ,fg-dim))))
   `(doom-modeline-info               ((t (:foreground ,green))))
   `(doom-modeline-warning            ((t (:foreground ,yellow))))
   `(doom-modeline-urgent             ((t (:foreground ,red))))
   `(doom-modeline-evil-normal-state  ((t (:foreground ,blue :bold t))))
   `(doom-modeline-evil-insert-state  ((t (:foreground ,green :bold t))))
   `(doom-modeline-evil-visual-state  ((t (:foreground ,purple :bold t))))

   ;; ── Tab-bar / buffer line ────────────────────────────
   `(tab-bar                          ((t (:foreground ,fg-dim :background ,bg-hl))))
   `(tab-bar-tab                      ((t (:foreground ,fg :background ,bg-alt :bold t))))
   `(tab-bar-tab-inactive             ((t (:foreground ,fg-dim :background ,bg-hl))))
   `(centaur-tabs-default             ((t (:background ,bg-hl))))
   `(centaur-tabs-selected            ((t (:foreground ,fg :background ,bg-alt :bold t))))
   `(centaur-tabs-unselected          ((t (:foreground ,fg-dim :background ,bg-hl))))
   `(centaur-tabs-selected-modified   ((t (:foreground ,tan :background ,bg-alt :bold t))))
   `(centaur-tabs-unselected-modified ((t (:foreground ,tan :background ,bg-hl))))

   ;; ── Font-lock (syntax) — minimal philosophy ─────────
   `(font-lock-comment-face           ((t (:foreground ,green :italic t))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,green :italic t))))
   `(font-lock-doc-face               ((t (:foreground ,green :italic t))))
   `(font-lock-string-face            ((t (:foreground ,tan))))
   `(font-lock-constant-face          ((t (:foreground ,fg))))
   `(font-lock-keyword-face           ((t (:foreground ,fg))))
   `(font-lock-builtin-face           ((t (:foreground ,fg))))
   `(font-lock-function-name-face     ((t (:foreground ,fg))))
   `(font-lock-variable-name-face     ((t (:foreground ,fg))))
   `(font-lock-type-face              ((t (:foreground ,fg))))
   `(font-lock-preprocessor-face      ((t (:foreground ,fg-dim))))
   `(font-lock-negation-char-face     ((t (:foreground ,fg))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,tan))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,tan))))
   `(font-lock-warning-face           ((t (:foreground ,yellow))))

   ;; ── Search ───────────────────────────────────────────
   `(isearch                          ((t (:foreground ,bg-alt :background ,blue))))
   `(isearch-fail                     ((t (:foreground ,red :background ,bg))))
   `(match                            ((t (:foreground ,fg :underline t))))

   ;; ── Popup / completion ───────────────────────────────
   `(tooltip                          ((t (:foreground ,fg :background ,bg-popup))))
   `(popup-face                       ((t (:foreground ,fg :background ,bg-popup))))
   `(popup-tip-face                   ((t (:foreground ,fg :background ,bg-popup))))

   ;; company
   `(company-tooltip                  ((t (:foreground ,fg :background ,bg-popup))))
   `(company-tooltip-common           ((t (:foreground ,blue))))
   `(company-tooltip-selection        ((t (:background ,bg-sel))))
   `(company-tooltip-annotation       ((t (:foreground ,fg-dim))))
   `(company-scrollbar-fg             ((t (:background ,fg-dim))))
   `(company-scrollbar-bg             ((t (:background ,bg-popup))))

   ;; corfu
   `(corfu-default                    ((t (:foreground ,fg :background ,bg-popup))))
   `(corfu-current                    ((t (:background ,bg-sel))))
   `(corfu-bar                        ((t (:background ,fg-dim))))
   `(corfu-border                     ((t (:background ,fg-faint))))

   ;; vertico / ivy / selectrum
   `(vertico-current                  ((t (:background ,bg-sel))))
   `(ivy-current-match                ((t (:background ,bg-sel :bold t))))
   `(ivy-minibuffer-match-face-1      ((t (:foreground ,blue))))
   `(ivy-minibuffer-match-face-2      ((t (:foreground ,blue :bold t))))

   ;; ── Which-key ────────────────────────────────────────
   `(which-key-key-face               ((t (:foreground ,blue))))
   `(which-key-command-description-face ((t (:foreground ,fg))))
   `(which-key-group-description-face ((t (:foreground ,fg-dim))))

   ;; ── Treemacs / dired ─────────────────────────────────
   `(treemacs-root-face               ((t (:foreground ,fg :bold t))))
   `(treemacs-file-face               ((t (:foreground ,fg))))
   `(treemacs-directory-face          ((t (:foreground ,fg))))
   `(treemacs-git-modified-face       ((t (:foreground ,tan))))
   `(treemacs-git-added-face          ((t (:foreground ,green))))
   `(treemacs-git-untracked-face      ((t (:foreground ,fg-dim))))
   `(dired-directory                  ((t (:foreground ,fg :bold t))))

   ;; ── Flycheck / flymake diagnostics ───────────────────
   `(flycheck-error                   ((t (:underline (:color ,red :style wave)))))
   `(flycheck-warning                 ((t (:underline (:color ,yellow :style wave)))))
   `(flycheck-info                    ((t (:underline (:color ,blue-info :style wave)))))
   `(flymake-error                    ((t (:underline (:color ,red :style wave)))))
   `(flymake-warning                  ((t (:underline (:color ,yellow :style wave)))))
   `(flymake-note                     ((t (:underline (:color ,blue-info :style wave)))))

   ;; ── Diff / magit ────────────────────────────────────
   `(diff-added                       ((t (:foreground ,green :background "#1e3a1e"))))
   `(diff-removed                     ((t (:foreground ,red :background "#3a1e1e"))))
   `(diff-changed                     ((t (:foreground ,fg))))
   `(diff-header                      ((t (:foreground ,blue :bold t))))
   `(diff-file-header                 ((t (:foreground ,blue :bold t))))
   `(diff-refine-added                ((t (:foreground ,green :background "#2a4a2a" :bold t))))
   `(diff-refine-removed              ((t (:foreground ,red :background "#4a2a2a" :bold t))))
   `(magit-section-heading            ((t (:foreground ,blue :bold t))))
   `(magit-section-highlight          ((t (:background ,bg-hl))))
   `(magit-diff-added                 ((t (:foreground ,green :background "#1e3a1e"))))
   `(magit-diff-added-highlight       ((t (:foreground ,green :background "#2a4a2a"))))
   `(magit-diff-removed               ((t (:foreground ,red :background "#3a1e1e"))))
   `(magit-diff-removed-highlight     ((t (:foreground ,red :background "#4a2a2a"))))
   `(magit-diff-context               ((t (:foreground ,fg-dim))))
   `(magit-diff-context-highlight     ((t (:foreground ,fg-dim :background ,bg-hl))))
   `(magit-diff-hunk-heading          ((t (:foreground ,fg :background ,bg-hl))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,fg :background ,bg-sel))))
   `(magit-branch-local               ((t (:foreground ,blue))))
   `(magit-branch-remote              ((t (:foreground ,green))))

   ;; ── Git gutter ───────────────────────────────────────
   `(git-gutter:added                 ((t (:foreground ,green))))
   `(git-gutter:deleted               ((t (:foreground ,red))))
   `(git-gutter:modified              ((t (:foreground ,fg))))
   `(git-gutter-fr:added              ((t (:foreground ,green))))
   `(git-gutter-fr:deleted            ((t (:foreground ,red))))
   `(git-gutter-fr:modified           ((t (:foreground ,fg))))
   `(diff-hl-insert                   ((t (:foreground ,green))))
   `(diff-hl-delete                   ((t (:foreground ,red))))
   `(diff-hl-change                   ((t (:foreground ,fg))))

   ;; ── Org-mode ─────────────────────────────────────────
   `(org-level-1                      ((t (:foreground ,fg :bold t :height 1.2))))
   `(org-level-2                      ((t (:foreground ,fg :bold t :height 1.1))))
   `(org-level-3                      ((t (:foreground ,fg :bold t))))
   `(org-level-4                      ((t (:foreground ,fg :bold t))))
   `(org-code                         ((t (:foreground ,tan))))
   `(org-verbatim                     ((t (:foreground ,tan))))
   `(org-block                        ((t (:background ,bg-alt))))
   `(org-block-begin-line             ((t (:foreground ,fg-dim :background ,bg-alt))))
   `(org-block-end-line               ((t (:foreground ,fg-dim :background ,bg-alt))))
   `(org-meta-line                    ((t (:foreground ,fg-dim))))
   `(org-document-title               ((t (:foreground ,fg :bold t :height 1.3))))
   `(org-document-info                ((t (:foreground ,fg-dim))))
   `(org-todo                         ((t (:foreground ,red :bold t))))
   `(org-done                         ((t (:foreground ,green :bold t))))
   `(org-date                         ((t (:foreground ,fg-dim :underline t))))

   ;; ── Markdown ─────────────────────────────────────────
   `(markdown-header-face-1           ((t (:foreground ,fg :bold t :height 1.2))))
   `(markdown-header-face-2           ((t (:foreground ,fg :bold t :height 1.1))))
   `(markdown-header-face-3           ((t (:foreground ,fg :bold t))))
   `(markdown-code-face               ((t (:foreground ,tan))))
   `(markdown-inline-code-face        ((t (:foreground ,tan))))
   `(markdown-link-face               ((t (:foreground ,fg :underline t))))
   `(markdown-url-face                ((t (:foreground ,fg-dim :underline t))))
   `(markdown-bold-face               ((t (:bold t))))
   `(markdown-italic-face             ((t (:italic t))))

   ;; ── Rainbow delimiters ───────────────────────────────
   `(rainbow-delimiters-depth-1-face  ((t (:foreground ,fg))))
   `(rainbow-delimiters-depth-2-face  ((t (:foreground ,fg-dim))))
   `(rainbow-delimiters-depth-3-face  ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-4-face  ((t (:foreground ,tan))))
   `(rainbow-delimiters-depth-5-face  ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-6-face  ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-7-face  ((t (:foreground ,fg))))

   ;; ── Indent guides ───────────────────────────────────
   `(indent-guide-face                ((t (:foreground ,fg-indent))))
   `(highlight-indent-guides-character-face ((t (:foreground ,fg-indent))))

   ;; ── Misc ─────────────────────────────────────────────
   `(show-paren-match                 ((t (:foreground ,fg :underline t :bold t))))
   `(show-paren-mismatch              ((t (:foreground ,red :background ,bg :bold t))))
   `(whitespace-space                 ((t (:foreground ,fg-faint))))
   `(whitespace-tab                   ((t (:foreground ,fg-faint))))
   `(whitespace-newline               ((t (:foreground ,fg-faint))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'minimal)

;;; minimal-theme.el ends here
