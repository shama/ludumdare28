module.exports = (entry, output) ->
  path = require('path')
  res =
    entry: path.resolve(__dirname, entry)
    output:
      path: path.dirname(output)
      filename: path.basename(output)
    module:
      loaders: [
        test: /\.coffee$/, loader: 'coffee'
      ,
        test: /\.hbs$/, loader: 'ember-templates'
      ,
        test: /\.styl$/,
        loader: 'style!raw!stylus'
      ,
        test: /\.css$/, loader: 'style!css'
      ,
        test: /\.png$/, loader: 'url?limit=100000&minetype=image/png'
      ]

    resolve:
      modulesDirectories: ['node_modules', 'bower_components']
      extensions: ['', '.coffee', '.js']
    node:
      __dirname: true
      __filename: true