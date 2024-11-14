import { App, Astal, Gtk } from 'astal/gtk3'

import Audio from './audio'
import Battery from './battery'
import Bluetooth from './bluetooth'
import Clock from './clock'
import Tray from './tray'
import Workspaces from './workspaces'

const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

const Bar = (monitor: number) => {
  return (
    <window
      name="bar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
      className="bar"
    >
      <centerbox>
        <box hexpand halign={Gtk.Align.START} spacing={10}>
          <icon icon="nixoscolorful" />
          <Workspaces />
        </box>

        <box />

        <box hexpand halign={Gtk.Align.END} spacing={5}>
          <Audio />
          <Battery />
          <Bluetooth />
          <Clock />
          <Tray />
        </box>
      </centerbox>
    </window>
  )
}

export default Bar
