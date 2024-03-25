import GLib from 'gi://GLib'

const OUT_DIR = `${App.configDir}/dist`
const SCSS_PATH = `${App.configDir}/scss/main.scss`
const CSS_PATH = `${OUT_DIR}/style.css`

const compileScss = () =>
  Utils.exec(`sassc -t expanded ${SCSS_PATH} ${CSS_PATH}`)

const reloadStyle = () => {
  compileScss()
  App.resetCss()
  App.applyCss(CSS_PATH)
}

if (GLib.getenv('NODE_ENV') === 'development') {
  const nodemon = `${App.configDir}/node_modules/.bin/nodemon`
  Utils.subprocess(
    `${nodemon} -q -w scss -e scss --on-change-only --exec echo`,
    reloadStyle
  )
}

compileScss()

App.addIcons(`${App.configDir}/assets/icon`)

const { default: windows } = await import(`file://${OUT_DIR}/main.js`)

App.config({
  style: CSS_PATH,
  windows,
})
