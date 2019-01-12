<template>
  <div>
    <p>I'm a container. I should be used as a root for a more "complex" stack
    of components. You can use store stuff in me, and include as many "dump"
    components from the ./components folder as needed</p>
    <ExampleComponent
      :example-property="examplePropertyValue"
      @mutation="storeMutation"
      @action="storeAction"
    />
    <br />
    <div v-if="loading">Loading...</div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import ExampleComponent from '@/components/ExampleComponent.vue';
import { namespace } from 'vuex-class';

const exampleVuexModule = namespace('example');

@Component({
  components: {
    ExampleComponent,
  },
})
export default class ExampleContainer extends Vue {
  @exampleVuexModule.State
  examplePropertyValue: string | undefined;

  @exampleVuexModule.State
  loading: boolean | undefined;

  @exampleVuexModule.Mutation
  setExamplePropertyValue!: (x: string) => void;

  @exampleVuexModule.Action
  fetchPropertyValue!: () => void;

  storeMutation(value: string) {
    this.setExamplePropertyValue(value);
  }

  async storeAction() {
    await this.fetchPropertyValue();
  }
}
</script>

<style lang="scss" scoped>
p {
  margin-left: 10px;
}
</style>
