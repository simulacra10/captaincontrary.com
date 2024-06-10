(require 'ox-publish)

; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"./static/retro.css\" />")



(setq org-publish-project-alist
      (list
       (list "Captain Contrary"
	     :recursive t
	     :base-directory "./org"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-creator t
	     :with-toc t
	     )))

(setq org-html-validation-link nil)

(org-publish-all t)

(message "Build complete.")
