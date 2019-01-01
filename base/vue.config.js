const path = require('path');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

const isProd = process.env.NODE_ENV === 'production';

module.exports = {
  outputDir: path.resolve(__dirname, './dist/builds'),
  lintOnSave: 'error',
  css: {
    extract: false,
  },
  chainWebpack: config => {
    config.plugin('friendly-errors').tap(() => [{ clearConsole: false }]);
  },
  configureWebpack: {
    optimization: {
      minimizer: isProd
        ? [
            new UglifyJsPlugin({
              uglifyOptions: {
                compress: {
                  drop_console: true,
                },
              },
            }),
          ]
        : [],
    },
  },
};
