const path = require('path');

module.exports = {
  outputDir: path.resolve(__dirname, './dist/builds'),
  lintOnSave: 'error',
  css: {
    extract: false,
  },
  chainWebpack: config => {
    config.plugin('friendly-errors').tap(() => [{ clearConsole: false }]);
  },
};
