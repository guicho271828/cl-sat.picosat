
(in-package :cl-user)
(defpackage cl-sat.picosat-asd
  (:use :cl :asdf))
(in-package :cl-sat.picosat-asd)


(defsystem cl-sat.picosat
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:trivia :alexandria :iterate :cl-sat)
  :pathname "src"
  :components ((:file "package"))
  :description "CL-SAT binding to PicoSAT"
  :in-order-to ((test-op (test-op :cl-sat.picosat.test)))
  :defsystem-depends-on (:trivial-package-manager)
  :perform
  (load-op :before (op c)
           (uiop:symbol-call :trivial-package-manager
                             :ensure-program
                             "picosat"
                             :apt "picosat"
                             :dnf "picosat"
                             :yum "picosat"
                             :from-source (format nil "make -C ~a"
                                                  (asdf:system-source-directory :cl-sat.picosat)))))
