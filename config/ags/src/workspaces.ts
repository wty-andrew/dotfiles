import Gdk from 'gi://Gdk'
import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js'
import { Box, Button } from 'resource:///com/github/Aylur/ags/widget.js'

import { range } from './utils'

const display = Gdk.Display.get_default()

const dispatch = (i: number) => Hyprland.messageAsync(`dispatch workspace ${i}`)

const WorkspaceButton = (i: number) =>
  Button({
    on_hover: (self) =>
      self.window.set_cursor(Gdk.Cursor.new_from_name(display!, 'pointer')),
    on_hover_lost: (self) => self.window.set_cursor(null),
    on_clicked: () => dispatch(i),
  }).hook(Hyprland, (self) => {
    const isActive = Hyprland.active.workspace.id === i
    self.label = isActive ? '' : ''
    self.toggleClassName('active', isActive)

    const isOccupied = (Hyprland.getWorkspace(i)?.windows || -1) > 0
    self.toggleClassName('occupied', isOccupied)
  })

const Workspaces = () =>
  Box({
    class_name: 'workspaces',
    children: range(1, 8).map(WorkspaceButton),
  })

export default Workspaces
