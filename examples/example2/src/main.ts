import Vue from 'vue';
import Index from './pages/index.vue';
import store from './store';

new Vue({
  store,
  render: h => h(Index),
}).$mount('#app');
