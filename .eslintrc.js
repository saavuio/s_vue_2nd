module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: [
    'plugin:vue/recommended',
    '@vue/airbnb',
    '@vue/typescript',
    'plugin:prettier/recommended',
  ],
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'vue/html-self-closing': 'always',
    "vue/max-attributes-per-line": [2, {
      "singleline": 2,
      "multiline": { "max": 2, "allowFirstLine": false },
    }]
  },
  parserOptions: {
    parser: 'typescript-eslint-parser',
  },
};
