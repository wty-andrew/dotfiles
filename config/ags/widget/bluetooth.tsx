import Bt from 'gi://AstalBluetooth'
import type Gtk from 'gi://Gtk'
import { bind } from 'astal'
import { Astal, Gdk } from 'astal/gtk3'

import { GtkMenu, GtkMenuItem } from './menu'

const getIcon = (enabled: boolean) => `bluetooth-${enabled ? 'active' : 'disabled'}-symbolic`

const Bluetooth = () => {
  const bt = Bt.get_default()

  const menu = (
    <GtkMenu>
      {bind(bt, 'devices').as((devices) =>
        devices.map((device) => (
          // TODO: connect on click
          <GtkMenuItem label={device.name} />
        ))
      )}
    </GtkMenu>
  ) as Gtk.Menu

  return (
    <eventbox
      onClick={(self, event) => {
        switch (event.button) {
          case Astal.MouseButton.SECONDARY:
            menu.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null)
            break
        }
      }}
      onDestroy={() => menu.destroy()}
    >
      <box className="box">
        <icon icon={bind(bt, 'isPowered').as(getIcon)} />
      </box>
    </eventbox>
  )
}

export default Bluetooth
