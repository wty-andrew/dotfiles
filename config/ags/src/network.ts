const Network = await Service.import('network')

const { Box, Icon, Stack } = Widget

const Wifi = () =>
  Box({
    child: Icon({ icon: Network.wifi.bind('icon_name') }),
  })

const Wired = () =>
  Box({
    child: Icon({ icon: Network.wired.bind('icon_name') }),
  })

const NetworkStatus = () =>
  Box({
    class_name: 'box',
    child: Stack({
      children: {
        wifi: Wifi(),
        wired: Wired(),
      },
      shown: Network.bind('primary').transform((p) => p || 'wifi'),
    }),
  })

export default NetworkStatus
