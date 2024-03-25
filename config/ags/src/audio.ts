const Audio = await Service.import('audio')

const { Box, EventBox, Icon, Label } = Widget

type AudioLevel = 'low' | 'medium' | 'high'

type AudioIcon =
  | `audio-volume-muted-symbolic`
  | `audio-volume-${AudioLevel}-symbolic`

const THRESHOLDS: Array<[AudioLevel, number]> = [
  ['low', 30],
  ['medium', 60],
  ['high', 150],
]

const audioLevel = (percent: number): AudioLevel => {
  for (const [level, threshold] of THRESHOLDS) {
    if (percent <= threshold) return level
  }
  return THRESHOLDS[THRESHOLDS.length - 1][0]
}

const getIcon = (audio: typeof Audio): AudioIcon => {
  if (!audio.speaker) {
    return 'audio-volume-low-symbolic'
  }
  const { stream, volume } = audio.speaker
  if (stream && stream.is_muted) {
    return 'audio-volume-muted-symbolic'
  }
  const level = audioLevel(Math.floor(volume * 100))
  return `audio-volume-${level}-symbolic`
}

const getLabel = (audio: typeof Audio): string => {
  if (!audio.speaker) {
    return ''
  }
  const { volume } = audio.speaker
  return `${Math.round(volume * 100)}%`
}

// https://github.com/Aylur/ags/issues/123
const toggleMute = () =>
  Utils.execAsync('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')

const AudioStatus = () => {
  const icon = Icon()
  const label = Label()

  return Box({
    class_name: 'box',
    child: EventBox({
      on_primary_click: toggleMute,
      on_scroll_up: () => Audio.speaker && (Audio.speaker.volume += 0.05),
      on_scroll_down: () => Audio.speaker && (Audio.speaker.volume -= 0.05),
      child: Box({
        spacing: 5,
        children: [icon, label],
      }).hook(Audio, () => {
        icon.icon = getIcon(Audio)
        label.label = getLabel(Audio).padStart(3, ' ')
      }),
    }),
  })
}

export default AudioStatus
