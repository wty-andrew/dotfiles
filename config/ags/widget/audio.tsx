import Wp from 'gi://AstalWp'
import Gio from 'gi://Gio?version=2.0'
import { createBinding, For } from 'ags'
import { Gdk, Gtk } from 'ags/gtk4'

const clamp = (value: number, lower: number, upper: number) =>
  Math.max(lower, Math.min(upper, value))

const format = (volume: number) => `${Math.round(volume * 100)}%`.padStart(3, ' ')

const Audio = () => {
  const { audio } = Wp.get_default()!
  const { defaultSpeaker: speaker } = audio

  const speakers = createBinding(audio, 'speakers').as((speakers) => speakers.map((speaker) => {
    console.log(speaker.description)
    const menuItem = Gio.MenuItem.new(speaker.description, 'hello')
    // menuItem.set_label(speaker.description)
    return menuItem
  }))
  const volumeIcon = createBinding(speaker, 'volumeIcon')
  const volume = createBinding(speaker, 'volume').as(format)

  // const popover = (
  //   <Gtk.PopoverMenu>
  //     {/* <For each={speakers}>
  //       {(speaker, index) => {
  //         return (
  //           <Gtk4.MenuItem
  //             label={speaker.description}
  //             onActivate={() => speaker.set_is_default(true)}
  //           />
  //         )
  //       }}
  //     </For> */}
  //   </Gtk.PopoverMenu>
  // )
  // let popover: Gtk.PopoverMenu
  const menu = Gio.Menu.new()
  const item = Gio.MenuItem.new('foo', 'hello')
  menu.append_item(item)

  for (const speaker of speakers.get()) {
    menu.append_item(speaker)
  }
  let popover: Gtk.PopoverMenu

  return (
    <button>
      <Gtk.EventControllerScroll
        flags={Gtk.EventControllerScrollFlags.VERTICAL}
        onScroll={(_e, _dx, dy) => {
          const step = 0.05 * (dy > 0 ? -1 : 1)
          speaker.volume = clamp(speaker.volume + step, 0, 1.5)
        }}
      />
      <Gtk.GestureClick
        button={0}
        propagationPhase={Gtk.PropagationPhase.CAPTURE}
        onPressed={(e) => {
          switch (e.get_current_button()) {
            case Gdk.BUTTON_PRIMARY:
              speaker.set_mute(!speaker.mute)
              console.log('primary click')
              break
            case Gdk.BUTTON_SECONDARY:
              popover.popup()
              console.log('secondary click')
              break
          }
        }}
      />
      <box class="box" spacing={5}>
        <image iconName={volumeIcon} />
        <label label={volume} />

        <Gtk.PopoverMenu $={(ref) => (popover = ref)} menuModel={menu} />
      </box>
    </button>
  )
}

export default Audio
