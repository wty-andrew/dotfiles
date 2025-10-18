import { Astal, type Gdk, Gtk } from 'ags/gtk4'
import app from 'ags/gtk4/app'

import Audio from './audio'
import Clock from './clock'
import Tray from './tray'

const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

const Bar = (gdkmonitor: Gdk.Monitor) => {
  return (
    <window
      name="bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      application={app}
      anchor={TOP | LEFT | RIGHT}
      class="bar"
      visible
    >
      <centerbox cssName="centerbox">
        <box $type="start" hexpand spacing={10}>
          <image iconName="nixoscolorful" />
          {/* <Workspaces /> */}
        </box>

        <box $type="center" />

        <box $type="end" halign={Gtk.Align.END} spacing={5}>
          {/* <Audio /> */}
          {/* <Bluetooth /> */}
          <Clock />
          <Tray />
        </box>
      </centerbox>
    </window>
  )
}

export default Bar
