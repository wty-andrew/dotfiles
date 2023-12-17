import Widget from 'resource:///com/github/Aylur/ags/widget.js'

const label = Widget.Label({
  label: 'some content'
})

const bar = Widget.Window({
  name: 'bar',
  anchor: ['top', 'left', 'right'],
  child: label,
})

export default {
  windows: [
    bar,
  ],
}
