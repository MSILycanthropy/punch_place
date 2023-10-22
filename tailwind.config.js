module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.ts',
    './app/components/**/*.html.erb',
    './app/components/**/*.ts',
    './app/components/**/*.rb',
  ],
  plugins: [
    require('daisyui')
  ]
}
