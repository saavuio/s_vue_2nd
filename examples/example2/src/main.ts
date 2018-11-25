import Vue from 'vue';
import Index from './pages/index.vue';
import store from './store';
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css';

Vue.use(Vuetify);

new Vue({
  store,
  render: h => h(Index),
}).$mount('#app');
