import Hyprland from 'gi://AstalHyprland'
import { Variable, bind } from 'astal'
import type { Widget } from 'astal/gtk3'
import type { ButtonProps } from 'astal/gtk3/widget'

import { range } from '../utils'

const hasClient = (hypr: Hyprland.Hyprland, id: number) =>
  hypr.get_workspace(id)?.get_clients().length > 0

interface WorkspaceButtonProps extends ButtonProps {
  id: number
}

const Button = ({ id, ...props }: WorkspaceButtonProps) => {
  const hypr = Hyprland.get_default()
  const isOccupied = Variable(hasClient(hypr, id))

  const setup = (self: Widget.Button) => {
    self.toggleClassName('active', hypr.focusedWorkspace.id === id)
    self.hook(bind(hypr, 'focusedWorkspace'), (self, ws: Hyprland.Workspace) =>
      self.toggleClassName('active', ws.id === id)
    )

    hypr.connect('client-moved', () => isOccupied.set(hasClient(hypr, id)))
    self.hook(bind(hypr, 'clients'), () => isOccupied.set(hasClient(hypr, id)))
  }

  return (
    <button
      setup={setup}
      cursor="pointer"
      onClick={() => hypr.get_workspace(id).focus()}
      {...props}
    >
      {isOccupied((v) => (v ? '' : ''))}
    </button>
  )
}

const Workspaces = () => (
  <box className="workspaces" spacing={10}>
    {range(1, 10).map((id) => (
      <Button id={id} />
    ))}
  </box>
)

export default Workspaces
