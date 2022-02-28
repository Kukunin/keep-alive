import { Application } from "stimulus"
import { registerControllers } from 'stimulus-vite-helpers'

// Start the Stimulus application.
const application = Application.start()

// Controller files must be named *_controller.js.
const controllers  = import.meta.globEager('./**/*_controller.js')
registerControllers(application, controllers)

import {
  Alert,
  Autosave,
  Dropdown,
  Modal,
  Tabs,
  Popover,
  Toggle,
  Slideover
} from "tailwindcss-stimulus-components"

application.register('alert', Alert)
application.register('autosave', Autosave)
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
application.register('slideover', Slideover)
