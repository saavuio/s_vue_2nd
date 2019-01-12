<template>
  <div>
    <div>Hello from index.vue!</div>
    <ExampleContainer />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import ExampleContainer from '@/containers/ExampleContainer.vue';

@Component({
  components: {
    ExampleContainer,
  },
})
export default class IndexPage extends Vue {
  test: string = 'World';

  created() {
    console.log(`Hello ${this.test}`);
  }
}
</script>
