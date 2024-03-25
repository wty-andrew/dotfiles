import type { Application } from 'types/service/applications'

const WINDOW_NAME = 'applauncher'

const Applications = await Service.import('applications')

const AppItem = (app: Application) =>
  Widget.Button({
    on_clicked: () => {
      App.closeWindow(WINDOW_NAME)
      app.launch()
    },
    attribute: { app },
    child: Widget.Box({
      children: [
        // Widget.Icon({ icon: app.icon_name || '', size: 42 }),
        Widget.Label({
          class_name: 'title',
          label: app.name,
          xalign: 0,
          vpack: 'center',
          truncate: 'end',
        }),
      ],
    }),
  })

const AppLauncher = ({ width = 500, height = 500, spacing = 12 }) => {
  let applications = Applications.query('').map(AppItem)

  const list = Widget.Box({
    vertical: true,
    children: applications,
    spacing,
  })

  const repopulate = () => {
    applications = Applications.query('').map(AppItem)
    list.children = applications
  }

  const entry = Widget.Entry({
    hexpand: true,
    css: `margin-bottom: ${spacing}px;`,
    on_accept: () => {
      if (applications[0]) {
        App.toggleWindow(WINDOW_NAME)
        applications[0].attribute.app.launch()
      }
    },
    on_change: ({ text }) =>
      applications.forEach(
        (item) => (item.visible = item.attribute.app.match(text))
      ),
  })

  return Widget.Box({
    vertical: true,
    css: `margin: ${spacing * 2}px;`,
    children: [
      entry,
      Widget.Scrollable({
        hscroll: 'never',
        css: `
          min-width: ${width}px;
          min-height: ${height}px;
        `,
        child: list,
      }),
    ],
    setup: (self) =>
      self.hook(App, (_, windowName, visible) => {
        if (windowName !== WINDOW_NAME) return

        if (visible) {
          repopulate()
          entry.text = ''
          entry.grab_focus()
        }
      }),
  })
}

export default () =>
  Widget.Window({
    name: WINDOW_NAME,
    visible: false,
    keymode: 'on-demand',
    child: AppLauncher({
      width: 500,
      height: 500,
      spacing: 12,
    }),
    setup: (self) => self.keybind('Escape', () => App.closeWindow(WINDOW_NAME)),
  })
