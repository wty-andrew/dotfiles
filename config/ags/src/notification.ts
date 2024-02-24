import Notifications, {
  type Notification,
} from 'resource:///com/github/Aylur/ags/service/notifications.js'
import {
  Box,
  Button,
  Icon,
  Label,
  EventBox,
  Window,
} from 'resource:///com/github/Aylur/ags/widget.js'
import { lookUpIcon } from 'resource:///com/github/Aylur/ags/utils.js'

type GtkWidget = ReturnType<typeof Box>['child']

const Image = (src: string) =>
  Box({
    css: `
    background-image: url("${src}");
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
  `,
  })

const Title = (text: string) =>
  Label({
    label: text,
    class_name: 'title',
    xalign: 0,
    justification: 'left',
    hexpand: true,
    max_width_chars: 24,
    truncate: 'end',
    use_markup: true,
    wrap: true,
  })

const Content = (text: string) =>
  Label({
    label: text,
    class_name: 'body',
    xalign: 0,
    justification: 'left',
    hexpand: true,
    use_markup: true,
    wrap: true,
  })

const ActionButton = (label: string, onClick: () => void): GtkWidget =>
  Button({
    class_name: 'action-button',
    on_clicked: onClick,
    hexpand: true,
    child: Label(label),
  })

const findIcon = (icon: string, entry?: string) => {
  if (entry && lookUpIcon(entry)) return entry
  if (lookUpIcon(icon)) return icon
  return 'dialog-information-symbolic'
}

const Popup = (notification: Notification): GtkWidget => {
  const {
    actions,
    invoke,
    dismiss,
    summary,
    body,
    image,
    app_icon,
    app_entry,
    urgency,
  } = notification
  return EventBox({
    on_primary_click: () => dismiss(),
    child: Box({
      class_name: `notification ${urgency}`,
      vertical: true,
      children: [
        Box({
          children: [
            Box({
              class_name: 'icon',
              vpack: 'start',
              child: (image
                ? Image(image)
                : Icon(findIcon(app_icon, app_entry))) as GtkWidget,
            }),
            Box({
              vertical: true,
              children: [Title(summary), Content(body)],
            }),
          ],
        }),
        Box({
          class_name: 'actions',
          children: actions.map(({ id, label }) =>
            ActionButton(label, () => invoke(id))
          ),
        }),
      ],
    }),
  })
}

const Popups = () =>
  Window({
    name: 'notifications',
    anchor: ['top', 'right'],
    child: Box({
      class_name: 'notifications',
      vertical: true,
      children: Notifications.bind('popups').transform((popups) =>
        popups.map(Popup)
      ),
    }),
  })

export default Popups
