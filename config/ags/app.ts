import app from 'ags/gtk4/app'

import style from './scss/main.scss'
import Bar from './widget/bar'

app.add_icons('./assets/icon')

const monitor = app.get_monitors()[0]
app.start({
  css: style,
  main() {
    Bar(monitor)
  },
})
