import Workspaces from './workspaces'
import Battery from './battery'
import Network from './network'
import Audio from './audio'
import Clock from './clock'
import Bluetooth from './bluetooth'
import Tray from './tray'

const { Box, CenterBox, EventBox, Icon, Window } = Widget

const BarLauncher = () => {
  return Box({
    child: EventBox({
      on_primary_click: () => App.toggleWindow('applauncher'),
      child: Icon({
        icon: 'nixoscolorful',
        size: 18,
      }),
    }),
  })
}

const Bar = (monitor: number) =>
  Window({
    name: `bar-${monitor}`,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    class_name: 'transparent',
    child: CenterBox({
      class_name: 'bar',
      start_widget: Box({
        class_name: 'start',
        hpack: 'start',
        spacing: 10,
        children: [BarLauncher(), Workspaces()],
      }),
      center_widget: Box({
        class_name: 'center',
        hpack: 'center',
        children: [],
      }),
      end_widget: Box({
        class_name: 'end',
        hpack: 'end',
        spacing: 5,
        children: [
          Audio(),
          Network(),
          Battery() || [],
          Bluetooth(),
          Clock(),
          Tray(),
        ].flat(),
      }),
    }),
  })

export default Bar
