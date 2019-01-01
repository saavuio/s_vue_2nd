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
  configureWebpack: config => {
    if (process.env.NODE_ENV === 'production') {
      // eslint-disable-next-line no-param-reassign
      config.optimization.minimizer[0].options.terserOptions.compress.drop_console = true;
    }
  },
};
