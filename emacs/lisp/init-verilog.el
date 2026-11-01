;;; -*- lexical-binding: t -*-

;;`verilog-mode` ships with GNU Emacs. Three commands do most of the work:
;;
;;- **`C-c C-a`** (`verilog-auto`) expands `AUTOINST`/`AUTOWIRE` from the module
;;  definitions.
;;- **`M-x compile`** → `just check`, then `g` in the compilation buffer
;;  (`recompile`) and `M-x next-error` to jump to the failing line.
;;- **`just asciiwatch waves/and_gate.json5`** in a shell buffer gives a live
;;  diagram preview while you edit the JSON5.
;;
;;For `AUTOINST` to find your modules, add this at the end of the file (or in
;;`.dir-locals.el`):
;;
;;```verilog
;;// Local Variables:
;;// verilog-library-directories:("." "../src")
;;// End:
;;```

(use-package verilog-mode
  :straight t
  )
