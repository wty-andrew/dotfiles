/** @param {string} s */
const capitalize = (s) => `${s.charAt(0).toUpperCase()}${s.slice(1)}`

/**
 * @param {import('@babel/core')} babel
 * @returns {import('@babel/core').PluginObj}
 */
const transformAgsJsx = ({ types: t }) => {
  return {
    visitor: {
      Program(path) {
        const importWidgetStatement = t.importDeclaration(
          [t.importSpecifier(t.identifier('Widget'), t.identifier('Widget'))],
          t.stringLiteral('resource:///com/github/Aylur/ags/widget.js')
        )
        path.unshiftContainer('body', importWidgetStatement)
      },
      JSXElement(path) {
        // TODO: WIP
        const tag = path.node.openingElement.name
        if (t.isJSXIdentifier(tag)) {
          const callExpression = t.callExpression(
            t.memberExpression(
              t.identifier('Widget'),
              t.identifier(capitalize(tag.name))
            ),
            []
          )

          path.replaceWith(callExpression)
        }
      },
    },
  }
}

module.exports = transformAgsJsx
