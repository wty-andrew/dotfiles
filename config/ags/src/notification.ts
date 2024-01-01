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
    // class_name: 'title',
    // xalign: 0,
    // justification: 'left',
    // hexpand: true,
    // max_width_chars: 24,
    // truncate: 'end',
    // wrap: true,
    // use_markup: true,
  })

const Content = (text: string) =>
  Label({
    label: text,
    // class_name: 'body',
    // hexpand: true,
    // use_markup: true,
    // xalign: 0,
    // justification: 'left',
    // wrap: true,
  })

const ActionButton = (label: string, onClick: () => void): GtkWidget =>
  Button({
    // class_name: 'action-button',
    // hexpand: true,
    on_clicked: onClick,
    child: Label(label),
  })

const findIcon = (icon: string, entry: string | null) => {
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
  } = notification
  return EventBox({
    on_primary_click: () => dismiss(),
    child: Box({
      // class_name: `notification ${n.urgency}`,
      vertical: true,
      children: [
        Box({
          children: [
            Box({
              vpack: 'start',
              // class_name: 'icon',
              child: image ? Image(image) : Icon(findIcon(app_icon, app_entry)),
            }),
            Box({
              vertical: true,
              children: [Title(summary), Content(body)],
            }),
          ],
        }),
        Box({
          // class_name: 'actions',
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
