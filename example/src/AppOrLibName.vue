<template>
  <div>
    test<br />
    <span>{{ msg }}</span>
    <Test />
</div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import Test from './components/Test.vue';
import store from './store';

@Component({
  store,
  components: {
    Test,
  },
})
export default class AppOrLibName extends Vue {
  @Prop()
  private msg!: string;
}
</script>
