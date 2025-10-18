import AstalTray from 'gi://AstalTray'
import { createBinding, For } from 'ags'

interface TrayItemProps {
  item: AstalTray.TrayItem
}

const TrayItem = ({ item }: TrayItemProps) => {
  const gicon = createBinding(item, 'gicon')

  return (
    <menubutton
      $={(btn) => {
        btn.menuModel = item.menuModel
        btn.insert_action_group('dbusmenu', item.actionGroup)
        item.connect('notify::action-group', () =>
          btn.insert_action_group('dbusmenu', item.actionGroup)
        )
      }}
    >
      <image gicon={gicon} />
    </menubutton>
  )
}

const Tray = () => {
  const tray = AstalTray.get_default()
  const items = createBinding(tray, 'items')

  return (
    <box>
      <For each={items}>{(item) => <TrayItem item={item} />}</For>
    </box>
  )
}

export default Tray
