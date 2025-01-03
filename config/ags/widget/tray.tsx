import Tray from 'gi://AstalTray'
import { bind } from 'astal'
import { App } from 'astal/gtk3'

interface TrayItemProps {
  item: Tray.TrayItem
}

const TrayItem = ({ item }: TrayItemProps) => {
  if (item.iconThemePath) App.add_icons(item.iconThemePath)

  // TODO: check if the new api supports different mouse buttons
  return (
    <menubutton
      tooltipMarkup={bind(item, 'tooltipMarkup')}
      usePopover={false}
      actionGroup={bind(item, 'actionGroup').as((ag) => ['dbusmenu', ag])}
      menuModel={bind(item, 'menuModel')}
    >
      <icon gicon={bind(item, 'gicon')} />
    </menubutton>
  )
}

const SysTray = () => {
  const tray = Tray.get_default()
  const trayItems = bind(tray, 'items')

  return (
    <box className="systray">
      {trayItems.as((items) => items.map((item) => <TrayItem item={item} />))}
    </box>
  )
}

export default SysTray
