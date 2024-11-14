import Battery from 'gi://AstalBattery'
import { bind } from 'astal'

const format = (percentage: number) => `${Math.round(percentage * 100)}%`.padStart(3, ' ')

const BatteryStatus = () => {
  const battery = Battery.get_default()!

  return (
    <box className="box" visible={bind(battery, 'isPresent')} spacing={5}>
      <icon icon={bind(battery, 'batteryIconName')} />
      <label label={bind(battery, 'percentage').as(format)} />
    </box>
  )
}

export default BatteryStatus
