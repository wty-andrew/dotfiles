import Battery from 'resource:///com/github/Aylur/ags/service/battery.js'
import {
  Box,
  EventBox,
  Icon,
  Label,
} from 'resource:///com/github/Aylur/ags/widget.js'
import { subprocess } from 'resource:///com/github/Aylur/ags/utils.js'

type BatteryLevel = 'empty' | 'caution' | 'low' | 'good' | 'full'

type BatteryIcon =
  | 'battery-missing-symbolic'
  | `battery-${BatteryLevel}-symbolic`
  | `battery-${BatteryLevel}-charging-symbolic`
  | 'battery-full-charged-symbolic'

const THRESHOLDS: Array<[BatteryLevel, number]> = [
  ['empty', 5],
  ['caution', 20],
  ['low', 40],
  ['good', 95],
  ['full', 100],
]

const batteryLevel = (percent: number): BatteryLevel => {
  for (const [level, threshold] of THRESHOLDS) {
    if (percent <= threshold) return level
  }
  return THRESHOLDS[THRESHOLDS.length - 1][0]
}

const getIcon = (battery: typeof Battery): BatteryIcon => {
  const { charged, charging, percent } = battery
  if (charged && charging) {
    return 'battery-full-charged-symbolic'
  }
  const level = batteryLevel(percent)
  return `battery-${level}${charging ? '-charging' : ''}-symbolic`
}

type Display = 'percent' | 'time'

const formatTime = (seconds: number) => {
  const hour = Math.floor(seconds / 3600)
  const minutes = Math.floor((seconds % 3600) / 60)
  return `${hour}:${String(minutes).padStart(2, '0')}`
}

const getLabel = (battery: typeof Battery, display: Display): string => {
  switch (display) {
    case 'percent':
      return `${battery.percent}%`
    case 'time': {
      if (battery.charged && !battery.charging) {
        return 'Plugged'
      }
      return formatTime(battery.time_remaining)
    }
  }
}

const hasBattery = () => {
  const proc = subprocess('[ -d "/sys/module/battery" ]', () => void 0)!
  return proc.wait(null) && proc.get_successful()
}

const BatteryStatus = () => {
  if (!hasBattery()) return null

  let displayType: Display = 'percent'

  const icon = Icon()
  const label = Label()

  const update = (displayType: Display) => {
    icon.icon = getIcon(Battery)
    label.label = getLabel(Battery, displayType)
  }

  return Box({
    class_name: 'box',
    child: EventBox({
      on_primary_click: () => {
        displayType = displayType === 'percent' ? 'time' : 'percent'
        update(displayType)
      },
      child: Box({
        spacing: 5,
        children: [icon, label],
      }).hook(Battery, () => update(displayType)),
    }),
  })
}

export default BatteryStatus
