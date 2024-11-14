import Tray from 'gi://AstalTray'
import { bind } from 'astal'
import { App, Astal, Gdk } from 'astal/gtk3'

interface TrayItemProps {
  item: Tray.TrayItem
}

const TrayItem = ({ item }: TrayItemProps) => {
  if (item.iconThemePath) App.add_icons(item.iconThemePath)
  const menu = item.create_menu()

  return (
    <eventbox
      tooltipMarkup={bind(item, 'tooltipMarkup')}
      onDestroy={() => menu?.destroy()}
      onClickRelease={(self, event) => {
        switch (event.button) {
          case Astal.MouseButton.PRIMARY:
            menu?.activate()
            break

          case Astal.MouseButton.SECONDARY:
            menu?.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null)
            break
        }
      }}
    >
      <icon gIcon={bind(item, 'gicon')} />
    </eventbox>
  )
}

const SysTray = () => {
  const tray = Tray.get_default()
  const trayItems = bind(tray, 'items')

  return (
    <box className="box" spacing={8}>
      {trayItems.as((items) => items.map((item) => <TrayItem item={item} />))}
    </box>
  )
}

export default SysTray
