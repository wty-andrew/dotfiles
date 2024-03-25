import GLib from 'gi://GLib'

const { Box, EventBox, Label } = Widget

const now = () => GLib.DateTime.new_now_local()

const datetime = Variable(now(), { poll: [1000, now] })

type Format = 'date' | 'time'

const formatTime = (format: Format, time: GLib.DateTime) =>
  time.format(format === 'time' ? '%H:%M %p' : '%F')!

const Clock = () => {
  let format: Format = 'time'

  const label = Label({
    label: datetime.bind('value').transform((time) => formatTime(format, time)),
  })

  const update = (format: Format) => (label.label = formatTime(format, now()))

  return Box({
    class_name: 'box',
    child: EventBox({
      on_primary_click: () => {
        format = format === 'time' ? 'date' : 'time'
        update(format)
      },
      child: Box({
        children: [label],
      }),
    }),
  })
}

export default Clock
