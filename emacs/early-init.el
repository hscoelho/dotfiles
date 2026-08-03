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
  )

