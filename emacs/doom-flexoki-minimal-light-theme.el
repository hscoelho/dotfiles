;;; doom-flexoki-minimal-light-theme.el --- inspired by Flexoki Light theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;; Commentary:
;;; This is based in the flexoki light theme palette, but with my own syntax-hightlighting rules, in which I try to use less colors
;;; Code:

(require 'doom-themes)

;;
;;; Variables

;;
;;; Theme definition
(def-doom-theme doom-flexoki-minimal-light
  "A light theme inspired by Flexoki Light."
  :family 'doom-flexoki
  :background-mode 'light

  ;; name        default   256       16
  ((bg         '("#FFFCF0" "white"   "white"        ))
   (fg         '("#100F0F" "#100F0F" "black"        ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#E6E4D9" "white"   "white"        ))
   (fg-alt     '("#282726" "#282726" "brightblack"  ))

   (base0	'("#E6E4D9" "#E6E4D9" "white"))
   (base1	'("#CECDC3" "#CECDC3" "brightblack"))
   (base2	'("#B7B5AC" "#B7B5AC" "brightblack"))
   (base3	'("#9F9D96" "#9F9D96" "brightblack"))
   (base4	'("#878580" "#878580" "brightblack"))
   (base5	'("#6F6E69" "#6F6E69" "brightblack"))
   (base6	'("#575653" "#575653" "brightblack"))
   (base7	'("#403E3C" "#403E3C" "brightblack"))
   (base8	'("#282726" "#282726" "black"))

   (grey       base4)

   (red	      '("#D14D41" "#D14D41" "red"))
   (orange    '("#DA702C" "#DA702C" "brightred"))
   (green     '("#879A39" "#879A39" "green"))
   (teal      '("#66800B" "#66800B" "brightgreen"))
   (yellow    '("#D0A215" "#D0A215" "yellow"))
   (blue	  '("#4385BE" "#4385BE" "brightblue"))
   (dark-blue '("#205EA6" "#205EA6" "blue"))
   (magenta	  '("#CE5D97" "#CE5D97" "magenta"))
   (violet	  '("#8B7EC8" "#8B7EC8" "brightmagenta"))
   (cyan	  '("#3AA99F" "#3AA99F" "brightcyan"))
   (dark-cyan '("#24837B" "#24837B" "cyan"))
                 
   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      cyan)
   (vertical-bar   base3)
   (selection      dark-blue)
   (builtin        magenta)
   (comments       orange)
   (doc-comments   (doom-darken comments 0.15))
   (constants      violet)
   (functions      blue)
   (keywords       magenta)
   (methods        blue)
   (operators      violet)
   (type           teal)
   (strings        green)
   (variables      fg)
   (numbers        violet)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red))

  ;;;; Base theme face overrides
  ()

  ;;;; Base theme variable overrides-
  ()
)

;;; doom-flexoki-minimal-light-theme.el ends here
