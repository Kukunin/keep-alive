const typography = require('@tailwindcss/typography')
const forms = require('@tailwindcss/forms')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './config/initializers/**/*.rb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.{vue,js,ts,jsx,tsx}',
  ],
  theme: {
  },
  plugins: [typography, forms],
}
