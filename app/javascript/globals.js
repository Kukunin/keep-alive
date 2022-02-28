import jQuery from 'jquery'
import Rails from '@rails/ujs'

Object.assign(window, { $: jQuery, jQuery, Rails })

try { Rails.start() } catch { }
