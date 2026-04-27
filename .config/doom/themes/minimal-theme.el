;;; minimal-theme.el --- A quiet low-color dark theme -*- lexical-binding: t; -*-

;; Author: Custom
;; Version: 2.0
;; Package-Requires: ((emacs "27.1"))

;;; Commentary:
;; A deliberately minimal dark theme.  Most syntax uses the main foreground;
;; comments use a readable muted color, and only diagnostics/diffs get subdued
;; semantic colors.

;;; Code:

(deftheme minimal "A quiet, low-color dark theme.")

(let ((bg "#282c34") ; Ghostty Default Style Dark background.
      (bg-alt "#23272f")
      (bg-hl "#303642")
      (bg-active "#384150")
      (bg-region "#3f4a5c")
      (fg "#e5e9f0")
      (fg-dim "#c0c8d4")
      (fg-muted "#9aa6b8")
      (fg-faint "#687386")
      (border "#3a4250")
      (comment "#a8bdd6")
      (accent "#88a8c7")
      (red "#c7777d")
      (green "#9ab083")
      (yellow "#c8ad72")
      (diff-added-bg "#303a35")
      (diff-removed-bg "#3a3035")
      (diff-refine-added-bg "#3b463f")
      (diff-refine-removed-bg "#49393e"))

  (custom-theme-set-faces
   'minimal

   ;; Core UI
   `(default ((t (:foreground ,fg :background ,bg))))
   `(cursor ((t (:background ,fg))))
   `(region ((t (:background ,bg-region))))
   `(highlight ((t (:background ,bg-hl))))
   `(hl-line ((t (:background ,bg-hl))))
   `(secondary-selection ((t (:background ,bg-active))))
   `(fringe ((t (:background ,bg))))
   `(vertical-border ((t (:foreground ,border))))
   `(border ((t (:foreground ,border))))
   `(internal-border ((t (:foreground ,border))))
   `(child-frame-border ((t (:foreground ,border))))
   `(shadow ((t (:foreground ,fg-muted))))
   `(minibuffer-prompt ((t (:foreground ,fg :bold t))))
   `(link ((t (:foreground ,fg :underline t))))
   `(link-visited ((t (:foreground ,fg-dim :underline t))))
   `(escape-glyph ((t (:foreground ,accent))))
   `(homoglyph ((t (:foreground ,accent))))
   `(success ((t (:foreground ,green))))
   `(warning ((t (:foreground ,yellow))))
   `(error ((t (:foreground ,red))))
   `(trailing-whitespace ((t (:background ,red))))

   ;; Line numbers
   `(line-number ((t (:foreground ,fg-faint :background ,bg))))
   `(line-number-current-line ((t (:foreground ,fg-dim :background ,bg))))

   ;; Mode line / header / tabs
   `(mode-line ((t (:foreground ,fg :background ,bg-active :box nil))))
   `(mode-line-inactive ((t (:foreground ,fg-muted :background ,bg-alt :box nil))))
   `(mode-line-emphasis ((t (:foreground ,fg :bold t))))
   `(mode-line-buffer-id ((t (:foreground ,fg :bold t))))
   `(mode-line-highlight ((t (:background ,bg-hl))))
   `(header-line ((t (:foreground ,fg-dim :background ,bg-alt :box nil))))
   `(tab-bar ((t (:foreground ,fg-muted :background ,bg-alt))))
   `(tab-bar-tab ((t (:foreground ,fg :background ,bg))))
   `(tab-bar-tab-inactive ((t (:foreground ,fg-muted :background ,bg-alt))))

   ;; Doom modeline
   `(doom-modeline-bar ((t (:background ,border))))
   `(doom-modeline-bar-inactive ((t (:background ,bg-alt))))
   `(doom-modeline-buffer-file ((t (:foreground ,fg :bold t))))
   `(doom-modeline-buffer-modified ((t (:foreground ,fg :bold t))))
   `(doom-modeline-buffer-path ((t (:foreground ,fg-dim))))
   `(doom-modeline-buffer-major-mode ((t (:foreground ,fg))))
   `(doom-modeline-buffer-minor-mode ((t (:foreground ,fg-muted))))
   `(doom-modeline-project-parent-dir ((t (:foreground ,fg-muted))))
   `(doom-modeline-project-dir ((t (:foreground ,fg-dim))))
   `(doom-modeline-project-root-dir ((t (:foreground ,fg :bold t))))
   `(doom-modeline-info ((t (:foreground ,fg-dim))))
   `(doom-modeline-warning ((t (:foreground ,yellow))))
   `(doom-modeline-urgent ((t (:foreground ,red))))
   `(doom-modeline-evil-emacs-state ((t (:foreground ,fg :bold t))))
   `(doom-modeline-evil-insert-state ((t (:foreground ,fg :bold t))))
   `(doom-modeline-evil-motion-state ((t (:foreground ,fg :bold t))))
   `(doom-modeline-evil-normal-state ((t (:foreground ,fg :bold t))))
   `(doom-modeline-evil-operator-state ((t (:foreground ,fg :bold t))))
   `(doom-modeline-evil-replace-state ((t (:foreground ,fg :bold t))))
   `(doom-modeline-evil-visual-state ((t (:foreground ,fg :bold t))))

   ;; Syntax: intentionally almost monochrome
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comment))))
   `(font-lock-doc-face ((t (:foreground ,comment))))
   `(font-lock-string-face ((t (:foreground ,fg))))
   `(font-lock-constant-face ((t (:foreground ,fg))))
   `(font-lock-keyword-face ((t (:foreground ,fg))))
   `(font-lock-builtin-face ((t (:foreground ,fg))))
   `(font-lock-function-name-face ((t (:foreground ,fg))))
   `(font-lock-variable-name-face ((t (:foreground ,fg))))
   `(font-lock-type-face ((t (:foreground ,fg))))
   `(font-lock-preprocessor-face ((t (:foreground ,fg))))
   `(font-lock-escape-face ((t (:foreground ,fg))))
   `(font-lock-negation-char-face ((t (:foreground ,fg))))
   `(font-lock-number-face ((t (:foreground ,fg))))
   `(font-lock-operator-face ((t (:foreground ,fg))))
   `(font-lock-property-name-face ((t (:foreground ,fg))))
   `(font-lock-property-use-face ((t (:foreground ,fg))))
   `(font-lock-variable-use-face ((t (:foreground ,fg))))
   `(font-lock-function-call-face ((t (:foreground ,fg))))
   `(font-lock-bracket-face ((t (:foreground ,fg))))
   `(font-lock-delimiter-face ((t (:foreground ,fg))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,fg))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,fg))))
   `(font-lock-warning-face ((t (:foreground ,yellow :bold t))))

   ;; Search
   `(isearch ((t (:foreground ,bg :background ,accent :bold t))))
   `(isearch-fail ((t (:foreground ,fg :background ,red :bold t))))
   `(lazy-highlight ((t (:foreground ,fg :background ,bg-active))))
   `(match ((t (:foreground ,fg :background ,bg-active))))

   ;; Completion / popups
   `(tooltip ((t (:foreground ,fg :background ,bg-alt))))
   `(popup-face ((t (:foreground ,fg :background ,bg-alt))))
   `(popup-tip-face ((t (:foreground ,fg :background ,bg-active))))
   `(company-tooltip ((t (:foreground ,fg :background ,bg-alt))))
   `(company-tooltip-common ((t (:foreground ,fg :bold t))))
   `(company-tooltip-common-selection ((t (:foreground ,fg :bold t))))
   `(company-tooltip-selection ((t (:foreground ,fg :background ,bg-active))))
   `(company-tooltip-annotation ((t (:foreground ,fg-muted))))
   `(company-tooltip-search ((t (:foreground ,fg :background ,bg-active))))
   `(company-scrollbar-fg ((t (:background ,fg-faint))))
   `(company-scrollbar-bg ((t (:background ,bg-alt))))
   `(corfu-default ((t (:foreground ,fg :background ,bg-alt))))
   `(corfu-current ((t (:foreground ,fg :background ,bg-active))))
   `(corfu-bar ((t (:background ,fg-faint))))
   `(corfu-border ((t (:background ,border))))
   `(vertico-current ((t (:foreground ,fg :background ,bg-active))))
   `(ivy-current-match ((t (:foreground ,fg :background ,bg-active :bold t))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,fg))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,fg :bold t))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,fg :bold t))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground ,fg :bold t))))
   `(orderless-match-face-0 ((t (:foreground ,fg :bold t))))
   `(orderless-match-face-1 ((t (:foreground ,fg :bold t))))
   `(orderless-match-face-2 ((t (:foreground ,fg :bold t))))
   `(orderless-match-face-3 ((t (:foreground ,fg :bold t))))
   `(marginalia-documentation ((t (:foreground ,fg-muted))))

   ;; Help / key discovery
   `(which-key-key-face ((t (:foreground ,fg :bold t))))
   `(which-key-command-description-face ((t (:foreground ,fg))))
   `(which-key-group-description-face ((t (:foreground ,fg-dim))))
   `(help-key-binding ((t (:foreground ,fg :background ,bg-active))))

   ;; Files and sidebars
   `(dired-directory ((t (:foreground ,fg :bold t))))
   `(dired-marked ((t (:foreground ,fg :background ,bg-active))))
   `(treemacs-root-face ((t (:foreground ,fg :bold t))))
   `(treemacs-file-face ((t (:foreground ,fg))))
   `(treemacs-directory-face ((t (:foreground ,fg))))
   `(treemacs-git-modified-face ((t (:foreground ,fg-dim))))
   `(treemacs-git-added-face ((t (:foreground ,green))))
   `(treemacs-git-untracked-face ((t (:foreground ,fg-muted))))

   ;; Diagnostics
   `(flycheck-error ((t (:underline (:color ,red :style wave)))))
   `(flycheck-warning ((t (:underline (:color ,yellow :style wave)))))
   `(flycheck-info ((t (:underline (:color ,accent :style wave)))))
   `(flymake-error ((t (:underline (:color ,red :style wave)))))
   `(flymake-warning ((t (:underline (:color ,yellow :style wave)))))
   `(flymake-note ((t (:underline (:color ,accent :style wave)))))

   ;; Diff / magit
   `(diff-added ((t (:foreground ,green :background ,diff-added-bg))))
   `(diff-removed ((t (:foreground ,red :background ,diff-removed-bg))))
   `(diff-changed ((t (:foreground ,fg))))
   `(diff-header ((t (:foreground ,fg :background ,bg-alt :bold t))))
   `(diff-file-header ((t (:foreground ,fg :background ,bg-alt :bold t))))
   `(diff-refine-added ((t (:foreground ,fg :background ,diff-refine-added-bg))))
   `(diff-refine-removed ((t (:foreground ,fg :background ,diff-refine-removed-bg))))
   `(magit-section-heading ((t (:foreground ,fg :bold t))))
   `(magit-section-highlight ((t (:background ,bg-hl))))
   `(magit-diff-added ((t (:foreground ,green :background ,diff-added-bg))))
   `(magit-diff-added-highlight ((t (:foreground ,green :background ,diff-refine-added-bg))))
   `(magit-diff-removed ((t (:foreground ,red :background ,diff-removed-bg))))
   `(magit-diff-removed-highlight ((t (:foreground ,red :background ,diff-refine-removed-bg))))
   `(magit-diff-context ((t (:foreground ,fg-dim))))
   `(magit-diff-context-highlight ((t (:foreground ,fg-dim :background ,bg-hl))))
   `(magit-diff-hunk-heading ((t (:foreground ,fg :background ,bg-alt))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,fg :background ,bg-active))))
   `(magit-branch-local ((t (:foreground ,fg :bold t))))
   `(magit-branch-remote ((t (:foreground ,fg-dim :bold t))))
   `(git-gutter:added ((t (:foreground ,green))))
   `(git-gutter:deleted ((t (:foreground ,red))))
   `(git-gutter:modified ((t (:foreground ,fg-dim))))
   `(git-gutter-fr:added ((t (:foreground ,green))))
   `(git-gutter-fr:deleted ((t (:foreground ,red))))
   `(git-gutter-fr:modified ((t (:foreground ,fg-dim))))
   `(diff-hl-insert ((t (:foreground ,green))))
   `(diff-hl-delete ((t (:foreground ,red))))
   `(diff-hl-change ((t (:foreground ,fg-dim))))

   ;; Org / markdown
   `(org-level-1 ((t (:foreground ,fg :bold t :height 1.15))))
   `(org-level-2 ((t (:foreground ,fg :bold t :height 1.08))))
   `(org-level-3 ((t (:foreground ,fg :bold t))))
   `(org-level-4 ((t (:foreground ,fg :bold t))))
   `(org-code ((t (:foreground ,fg-dim))))
   `(org-verbatim ((t (:foreground ,fg-dim))))
   `(org-block ((t (:background ,bg-alt))))
   `(org-block-begin-line ((t (:foreground ,fg-muted :background ,bg-alt))))
   `(org-block-end-line ((t (:foreground ,fg-muted :background ,bg-alt))))
   `(org-meta-line ((t (:foreground ,comment))))
   `(org-document-title ((t (:foreground ,fg :bold t :height 1.2))))
   `(org-document-info ((t (:foreground ,fg-dim))))
   `(org-todo ((t (:foreground ,red :bold t))))
   `(org-done ((t (:foreground ,green :bold t))))
   `(org-date ((t (:foreground ,fg-dim :underline t))))
   `(markdown-header-face-1 ((t (:foreground ,fg :bold t :height 1.15))))
   `(markdown-header-face-2 ((t (:foreground ,fg :bold t :height 1.08))))
   `(markdown-header-face-3 ((t (:foreground ,fg :bold t))))
   `(markdown-code-face ((t (:foreground ,fg-dim))))
   `(markdown-inline-code-face ((t (:foreground ,fg-dim))))
   `(markdown-link-face ((t (:foreground ,fg :underline t))))
   `(markdown-url-face ((t (:foreground ,fg-dim :underline t))))
   `(markdown-bold-face ((t (:bold t))))
   `(markdown-italic-face ((t (:italic t))))

   ;; Delimiters / whitespace
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,fg-dim))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,fg))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,fg-dim))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,fg))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,fg-dim))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,fg))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,fg-dim))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,fg))))
   `(show-paren-match ((t (:foreground ,fg :background ,bg-active :bold t))))
   `(show-paren-mismatch ((t (:foreground ,fg :background ,red :bold t))))
   `(indent-guide-face ((t (:foreground ,border))))
   `(highlight-indent-guides-character-face ((t (:foreground ,border))))
   `(whitespace-space ((t (:foreground ,fg-faint))))
   `(whitespace-tab ((t (:foreground ,fg-faint))))
   `(whitespace-newline ((t (:foreground ,fg-faint))))

   ;; Terminal colors, kept muted so shell buffers do not feel separate.
   `(term-color-black ((t (:foreground ,bg-alt :background ,bg-alt))))
   `(term-color-red ((t (:foreground ,red :background ,red))))
   `(term-color-green ((t (:foreground ,green :background ,green))))
   `(term-color-yellow ((t (:foreground ,yellow :background ,yellow))))
   `(term-color-blue ((t (:foreground ,accent :background ,accent))))
   `(term-color-magenta ((t (:foreground ,fg-muted :background ,fg-muted))))
   `(term-color-cyan ((t (:foreground ,accent :background ,accent))))
   `(term-color-white ((t (:foreground ,fg :background ,fg)))))

  (custom-theme-set-variables
   'minimal
   `(ansi-color-names-vector [,bg-alt ,red ,green ,yellow ,accent ,fg-muted ,accent ,fg])))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'minimal)

;;; minimal-theme.el ends here
