import GLib from 'gi://GLib'
import { Variable } from 'astal'

enum Format {
  DATE = '%F',
  TIME = '%H:%M %p',
}

const now = (format = Format.TIME) => GLib.DateTime.new_now_local().format(format)!

const Clock = () => {
  let format: Format = Format.TIME
  const stamp = Variable(now(format)).poll(1000, () => now(format))

  return (
    <eventbox
      onClick={() => {
        format = format === Format.DATE ? Format.TIME : Format.DATE
        stamp.set(now(format))
      }}
      onDestroy={() => stamp.drop()}
    >
      <box className="box">
        <label label={stamp()} />
      </box>
    </eventbox>
  )
}

export default Clock
