---
to: <%= name %>/<%= name %>.asd
---
(defsystem <%= name %>
  :class :package-inferred-system
  :pathname "src"
  :depends-on ("<%= name %>/package")
  :in-order-to ((asdf:test-op (asdf:test-op "<%= name %>-tests"))))
