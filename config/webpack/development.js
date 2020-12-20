process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const { merge } = require('@rails/webpacker')
const webpackConfig = require('./base')

const StyleLintPlugin = require('stylelint-webpack-plugin')

const customConfig = {
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /vendor\/.+\.js$/,
        loader: 'standard-loader',
        options: {
          error: true,
          globals: [
            '$',
            'ClientSideValidations',
            'google',
            'Handlebars',
            'HandlebarsTemplates',
            'I18n',
            'InfoBox',
            'initGoogleMaps'
          ]
        }
      }
    ]
  },
  plugins: [
    new StyleLintPlugin({
      emitWarning: true,
      files: '/app/**/*.(s(c|a)ss|css)'
    })
  ]
}

module.exports = merge(webpackConfig, customConfig)
