import type { TrayItem } from 'types/service/systemtray'

const SystemTray = await Service.import('systemtray')

const { Box, Icon, EventBox } = Widget

type GtkWidget = ReturnType<typeof Box>['child']

const SystemTrayItem = (item: TrayItem): GtkWidget =>
  EventBox({
    child: Icon().bind('icon', item, 'icon'),
    tooltip_markup: item.bind('tooltip_markup'),
    on_primary_click: (_, event) => item.activate(event),
    on_secondary_click: (_, event) => item.openMenu(event),
  })

const Tray = () =>
  Box({
    class_name: 'box',
    spacing: 5,
    children: SystemTray.bind('items').transform((items) =>
      items.map(SystemTrayItem)
    ),
  })

export default Tray
