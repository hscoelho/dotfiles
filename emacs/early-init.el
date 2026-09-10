;; -*- lexical-binding: t; -*-

(defun android ()
  (eq system-type 'android))

(defun not-android ()
  (not (android)))

(when (android)
  ;; Add Termux binaries to PATH environment
  (let ((termuxpath "/data/data/com.termux/files/usr/bin"))
    (setenv "PATH" (concat (getenv "PATH") ":" termuxpath))
    (setq exec-path (append exec-path (list termuxpath)))
     ;; conversion-style set to nil for evil integration
    (setq overriding-text-conversion-style nil))

  ;; adding coursier bins
  ;; (let ((coursierpath "/data/data/com.termux/files/home/.local/share/coursier/bin"))
  ;;   (setenv "PATH" (concat (getenv "PATH") ":" coursierpath))
  ;;   (setq exec-path (append exec-path (list coursierpath)))
  ;;   )
  ;; scala bins, if necessary
  ;; export PATH=/data/data/com.termux/files/home/scala2-bins/scala-2.13.16/bin:$PATH
  ;; export PATH=/data/data/com.termux/files/home/scala2-bins/sbt/bin:$PATH
  )

(setq load-prefer-newer t)
(setq native-comp-jit-compilation t)

;; Disables the package.el because straight.el is used
(setq package-enable-at-startup nil) 
