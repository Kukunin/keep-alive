// This file is automatically compiled by Vite, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
console.log('Vite ⚡️ Ruby')
import '~/stylesheets/application.scss'
import '~/globals.js'
import '~/setup.js'

// Delay bootstrap, to ensure jQuery is already defined globally by then.
import('~/bootstrap.js')

// Example: Using JS From Routes
import { announcements } from '~/api'
console.log('JS From Routes', { announcements: announcements.list.path() })
