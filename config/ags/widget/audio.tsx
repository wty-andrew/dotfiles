import Wp from 'gi://AstalWp'
import type Gtk from 'gi://Gtk'
import { bind } from 'astal'
import { Astal, Gdk } from 'astal/gtk3'

import { clamp } from '../utils'
import { GtkMenu, GtkMenuItem } from './menu'

const format = (volume: number) => `${Math.round(volume * 100)}%`.padStart(3, ' ')

const Audio = () => {
  const { audio } = Wp.get_default()!
  const { defaultSpeaker: speaker } = audio

  const menu = (
    <GtkMenu>
      {bind(audio, 'speakers').as((speakers) =>
        speakers.map((speaker) => (
          <GtkMenuItem
            label={speaker.description}
            // @ts-ignore
            onActivate={() => speaker.set_is_default(true)}
          />
        ))
      )}
    </GtkMenu>
  ) as Gtk.Menu

  return (
    <eventbox
      onClick={(self, event) => {
        switch (event.button) {
          case Astal.MouseButton.PRIMARY:
            speaker.set_mute(!speaker.mute)
            break

          case Astal.MouseButton.SECONDARY:
            menu.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null)
            break
        }
      }}
      onScroll={(_, event) => {
        const step = 0.05 * (event.delta_y > 0 ? -1 : 1)
        speaker.volume = clamp(speaker.volume + step, 0, 1.5)
      }}
      onDestroy={() => menu.destroy()}
    >
      <box className="box" spacing={5}>
        <icon icon={bind(speaker, 'volumeIcon')} />
        <label label={bind(speaker, 'volume').as(format)} />
      </box>
    </eventbox>
  )
}

export default Audio
