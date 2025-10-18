import GLib from 'gi://GLib'
import { Gtk } from 'ags/gtk4'
import { createPoll } from 'ags/time'

const now = () => GLib.DateTime.new_now_local().format('%H:%M %p')!

const Clock = () => {
  const stamp = createPoll('', 1000, now)

  return (
    <menubutton $type="end" hexpand halign={Gtk.Align.CENTER}>
      <label label={stamp} />
      <popover>
        <Gtk.Calendar />
      </popover>
    </menubutton>
  )
}

export default Clock
