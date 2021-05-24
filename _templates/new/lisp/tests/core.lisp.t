---
to: <%= name %>/tests/core.lisp
---
(uiop:define-package #:<%= name %>-tests/core
  (:use #:cl #:lisp-unit
        #:<%= name %>/core))

(in-package #:<%= name %>-tests/core)

(define-test test-greet ()
  (assert-equal (greet "Bob") "Hello, Bob"))
