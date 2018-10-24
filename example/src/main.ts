// NOTE: this file is not touched
// when built as library. That's why store is in AppOrLibName.vue
import Vue from 'vue';
import AppOrLibName from './AppOrLibName.vue';

Vue.config.productionTip = false;

new Vue({
  render: h => h(AppOrLibName),
}).$mount('#app');
