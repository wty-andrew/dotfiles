---
to: <%= name %>/src/package.lisp
---
(uiop:define-package <%= name %>
  (:use #:cl)
  (:use-reexport #:<%= name %>/core))
