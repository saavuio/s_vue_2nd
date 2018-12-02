import Vue from 'vue';
import Vuetify from 'vuetify';
import Index from './pages/index.vue';
import store from './store';
import 'vuetify/dist/vuetify.min.css';

Vue.use(Vuetify);

new Vue({
  store,
  render: h => h(Index),
}).$mount('#app');
