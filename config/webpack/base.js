const { webpackConfig, merge } = require('@rails/webpacker')

const webpack = require('webpack')

const customConfig = {
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          { loader: 'resolve-url-loader' },
          { loader: 'sass-loader', options: { sourceMap: true } }
        ]
      },
      {
        test: /\.handlebars$/,
        loader: 'handlebars-loader'
      }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      // jQuery
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery',

      // Window
      'window.jQuery': 'jquery',

      // I18n
      'I18n': 'i18n-js'
    })
  ]
}

module.exports = merge(webpackConfig, customConfig)
