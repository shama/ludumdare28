module.exports = ->
  @registerTask 'default', ['clean', 'webpack:dist', 'copy:dist']
  @registerTask 'dev', ['default', 'connect', 'watch']
  webpack = require('./webpack.config.coffee').bind(@)

  @initConfig
    clean: dist: 'dist'
    copy: dist: src: 'src/index.html', dest: 'dist/index.html'
    webpack: dist: webpack('src/app.coffee', 'dist/app.js')
    connect: server: options: base: 'dist'
    watch:
      options: spawn: false
      lr:
        options: livereload: true
        files: ['dist/**/*']
      jscss:
        files: ['src/**/*.{coffee,hbs,js,html,styl}']
        tasks: ['webpack', 'copy', 'beep']
      gruntfile:
        files: ['Gruntfile.coffee', 'webpack.config.coffee', 'beep']

  # load npm installed tasks
  @loadNpmTasks(task) for task in require('matchdep').filterDev(['grunt-*', '!grunt-cli'])
