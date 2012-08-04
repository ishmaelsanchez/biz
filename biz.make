; Version and API
core = 7.x
api = 2

; Modules ======================================================================

; Admin ========================================================================
projects[admin_menu][type] = "module"
projects[admin_menu][subdir] = "contrib"


; Ctool/Context ================================================================
projects[ctools][type] = "module"
projects[ctools][subdir] = "contrib"

projects[context][type] = "module"
projects[context][subdir] = "contrib"


; Date/time ====================================================================
; projects[calendar][type] = "module"
; projects[calendar][subdir] = "contrib"

projects[date][type] = "module"
projects[date][subdir] = "contrib"

; Development ==================================================================
projects[devel][type] = "module"
projects[devel][subdir] = "contrib"

projects[backup_migrate][type] = "module"
projects[backup_migrate][subdir] = "contrib"

; Display ======================================================================
; projects[ds][type] = "module"
; projects[ds][subdir] = "contrib"

; projects[livethemer][type] = "module"
; projects[livethemer][subdir] = "contrib"

; Features =====================================================================
; projects[features][type] = "module"
; projects[features][subdir] = "contrib"

; projects[strongarm][type] = "module"
; projects[strongarm][subdir] = "contrib"


; Field related ================================================================
projects[field_group][type] = "module"
projects[field_group][subdir] = "contrib"

projects[link][type] = "module"
projects[link][subdir] = "contrib"

projects[feeds][type] = "module"
projects[feeds][subdir] = "contrib"


; Menu =========================================================================
;projects[nice_menus][type] = "module"
;projects[nice_menus][subdir] = "contrib"

projects[superfish][type] = "module"
projects[superfish][subdir] = "contrib"

projects[menu_block][type] = "module"
projects[menu_block][subdir] = "contrib"


; Other ========================================================================
projects[addtoany][type] = "module"
projects[addtoany][subdir] = "contrib"

projects[entity][type] = "module"
projects[entity][subdir] = "contrib"

; office hours

; Social media
projects[socialmedia][type] = module
projects[socialmedia][subdir] = contrib

projects[colorbox][type] = module
projects[colorbox][subdir] = contrib

projects[logintoboggan][type] = "module"
projects[logintoboggan][subdir] = "contrib"

projects[nodeblock][type] = "module"
projects[nodeblock][subdir] = "contrib"

projects[token][type] = "module"
projects[token][subdir] = "contrib"

projects[module_filter][type] = "module"
projects[module_filter][subdir] = "contrib"

; projects[securepages][type] = "module"
; projects[securepages][subdir] = "contrib"

; projects[quicktabs][type] = "module"
; projects[quicktabs][subdir] = "contrib"

; projects[extlink][type] = "module"
; projects[extlink][subdir] = "contrib"


; Performance ==================================================================
projects[entitycache][type] = "module"
projects[entitycache][subdir] = "contrib"

; Rules ========================================================================
projects[rules][type] = "module"
projects[rules][subdir] = "contrib"


; Security =====================================================================
projects[mollom][type] = "module"
projects[mollom][subdir] = "contrib"

;projects[paranoia][type] = module
;projects[paranoia][subdir] = contrib


; SEO ==========================================================================
projects[globalredirect][type] = "module"
projects[globalredirect][subdir] = "contrib"
projects[google_analytics][type] = "module"
projects[google_analytics][subdir] = "contrib"
; projects[metatag][type] = "modules"
; projects[metatag][subdir] = "contrib"
projects[pathauto][type] = "module"
projects[pathauto][subdir] = "contrib"
projects[xmlsitemap][type] = "module"
projects[xmlsitemap][subdir] = "contrib"


; Views ========================================================================
projects[views][type] = "module"
projects[views][subdir] = "contrib"

; projects[views_bulk_operations][type] = "module"
; projects[views_bulk_operations][subdir] = "contrib"
; projects[views_slideshow][type] = "module"
; projects[views_slideshow][subdir] = "contrib"


; Webform ======================================================================
projects[webform][type] = "module"
projects[webform][subdir] = "contrib"


; WYSIWYG ======================================================================
projects[imce][type] = "module"
projects[imce][subdir] = "contrib"

projects[wysiwyg][type] = "module"
projects[wysiwyg][subdir] = "contrib"

projects[imce_wysiwyg][type] = "module"
projects[imce_wysiwyg][subdir] = "contrib"


; Themes =======================================================================
projects[rubik][type] = "theme"
projects[tao][type] = "theme"
projects[zen][type] = "theme"


; Third party libraries ========================================================
libraries[tinymce][download][type] = get
libraries[tinymce][download][url] = https://github.com/downloads/tinymce/tinymce/tinymce_3.4.9.zip
libraries[tinymce][directory_name] = tinymce

libraries[colorbox][download][type] = get
libraries[colorbox][download][url] = http://www.jacklmoore.com/colorbox/colorbox.zip
libraries[colorbox][directory_name] = colorbox
