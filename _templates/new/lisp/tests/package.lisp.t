---
to: <%= name %>/tests/package.lisp
---
(uiop:define-package #:<%= name %>-tests
  (:use #:cl #:lisp-unit
        #:<%= name %>-tests/core)
  (:export #:main))

(in-package #:<%= name %>-tests)

(defun main ()
  (lisp-unit:run-tests :all :<%= name %>-tests/core))
