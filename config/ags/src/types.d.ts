import type { GObject } from 'gi://GObject'
import type { BoxProps as _BoxProps } from 'types/widgets/box'
import type { ButtonProps as _ButtonProps } from 'types/widgets/button'
import type { CenterBoxProps as _CenterBoxProps } from 'types/widgets/centerbox'
import type { CircularProgressProps as _CircularProgressProps } from 'types/widgets/circularprogress'
import type { EntryProps as _EntryProps } from 'types/widgets/entry'
import type { EventBoxProps as _EventBoxProps } from 'types/widgets/eventbox'
import type { IconProps as _IconProps } from 'types/widgets/icon'
import type { LabelProps as _LabelProps } from 'types/widgets/label'
import type { MenuProps as _MenuProps } from 'types/widgets/menu'
import type { OverlayProps as _OverlayProps } from 'types/widgets/overlay'
import type { ProgressBarProps as _ProgressBarProps } from 'types/widgets/progressbar'
import type { RevealerProps as _RevealerProps } from 'types/widgets/revealer'
import type { ScrollableProps as _ScrollableProps } from 'types/widgets/scrollable'
import type { SliderProps as _SliderProps } from 'types/widgets/slider'
import type { StackProps as _StackProps } from 'types/widgets/stack'
import type { WidgetProps as _WidgetProps } from 'types/widgets/widget'
import type { WindowProps as _WindowProps } from 'types/widgets/window'

type Bind = [
  prop: string,
  obj: GObject.Object,
  objProp?: string,
  transform?: (value: any) => any,
]
type WithBinds<T> = T & { binds?: Bind[] }

type BoxProps = WithBinds<_BoxProps>
type ButtonProps = WithBinds<_ButtonProps>
type CenterBoxProps = WithBinds<_CenterBoxProps>
type CircularProgressProps = WithBinds<_CircularProgressProps>
type EntryProps = WithBinds<_EntryProps>
type EventBoxProps = WithBinds<_EventBoxProps>
type IconProps = WithBinds<_IconProps>
type LabelProps = WithBinds<_LabelProps>
type MenuProps = WithBinds<_MenuProps>
type OverlayProps = WithBinds<_OverlayProps>
type ProgressBarProps = WithBinds<_ProgressBarProps>
type RevealerProps = WithBinds<_RevealerProps>
type ScrollableProps = WithBinds<_ScrollableProps>
type SliderProps = WithBinds<_SliderProps>
type StackProps = WithBinds<_StackProps>
type WidgetProps = WithBinds<_WidgetProps>
type WindowProps = WithBinds<_WindowProps>

interface AgsElements {
  box: BoxProps
  button: ButtonProps
  center_box: CenterBoxProps
  circular_progress: CircularProgressProps
  entry: EntryProps
  event_box: EventBoxProps
  icon: IconProps
  label: LabelProps
  menu: MenuProps
  overlay: OverlayProps
  progress_bar: ProgressBarProps
  revealer: RevealerProps
  scrollable: ScrollableProps
  slider: SliderProps
  stack: StackProps
  widget: WidgetProps
  window: WindowProps
}

declare global {
  namespace JSX {
    interface IntrinsicElements extends AgsElements {}
  }
}
