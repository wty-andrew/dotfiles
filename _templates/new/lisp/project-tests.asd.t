---
to: <%= name %>/<%= name %>-tests.asd
---
(defsystem <%= name %>-tests
  :class :package-inferred-system
  :pathname "tests"
  :depends-on ("<%= name %>" "<%= name %>-tests/package")
  :perform (asdf:test-op (op c) (uiop:symbol-call :<%= name %>-tests '#:main)))

