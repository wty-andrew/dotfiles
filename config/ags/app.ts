import { App } from 'astal/gtk3'

import style from './scss/main.scss'
import Bar from './widget/bar'

App.add_icons('./assets/icon')

App.start({
  css: style,
  main() {
    Bar(0)
  },
})
