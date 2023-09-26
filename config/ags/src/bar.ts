import {
  Box,
  CenterBox,
  EventBox,
  Icon,
  Label,
  Revealer,
  Window,
} from 'resource:///com/github/Aylur/ags/widget.js'
import App from 'resource:///com/github/Aylur/ags/app.js'

import Workspaces from './workspaces'
import Battery from './battery'
import Network from './network'
import Audio from './audio'
import Clock from './clock'
import Bluetooth from './bluetooth'
import Tray from './tray'

const BarLauncher = () => {
  const revealer = Revealer({
    transition: 'slide_left',
    transition_duration: 500,
    child: Label({
      class_name: 'bar',
      label: 'Launcher',
    }),
    css: 'padding-left: 10px;',
  })

  return Box({
    child: EventBox({
      on_primary_click: () => App.toggleWindow('applauncher'),
      on_hover: () => (revealer.reveal_child = true),
      on_hover_lost: () => (revealer.reveal_child = false),
      child: Box({
        children: [
          Icon({
            icon: 'nixoscolorful',
            size: 18,
          }),
          revealer,
        ],
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
