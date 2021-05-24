---
to: <%= name %>/src/core.lisp
---
(uiop:define-package <%= name %>/core
  (:use #:cl)
  (:export #:greet))

(in-package #:<%= name %>/core)

(defun greet (name)
  (format nil "Hello, ~a" name))
