import Bluetooth from 'resource:///com/github/Aylur/ags/service/bluetooth.js'
import { Box, Icon } from 'resource:///com/github/Aylur/ags/widget.js'

const getIcon = (enabled: boolean) =>
  `bluetooth-${enabled ? 'active' : 'disabled'}-symbolic`

const BluetoothStatus = () =>
  Box({
    class_name: 'box',
    children: [
      Icon({
        icon: Bluetooth.bind('enabled').transform(getIcon),
      }),
      // Box({ spacing: 10 }).hook(Bluetooth, (self) => {
      //   self.children = Bluetooth.connected_devices.map((device) =>
      //     Box({
      //       spacing: 5,
      //       children: [
      //         Icon(`${device.icon_name}-symbolic`),
      //         Label(device.alias),
      //       ],
      //     })
      //   )
      // }),
    ],
  })

export default BluetoothStatus
