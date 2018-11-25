<template>
  <div>
    <h1>Hello World {{ singleValue }}!</h1>
    <DummyButton
      :action="generateListOfValues"
      text="Generate a list of values"
    />
    <br />
    <DummyButton
      :disabled="loading"
      :action="fetchListOfValues"
      text="Fetch a list of values"
    />
    <br />
    <br />
    <div v-if="loading">Loading...</div>
    <pre v-if="!loading">{{ listOfValues }}</pre>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { namespace } from 'vuex-class';
import DummyButton from '@/components/DummyButton.vue';

const exampleVuexModule = namespace('example');

@Component({
  components: {
    DummyButton,
  },
})
export default class Root extends Vue {
  @exampleVuexModule.State
  singleValue!: string | undefined;
  @exampleVuexModule.State
  listOfValues!: [] | undefined;
  @exampleVuexModule.State
  loading!: boolean | undefined;
  @exampleVuexModule.Action
  generateListOfValues!: () => ({}) | undefined;
  @exampleVuexModule.Action
  fetchListOfValues!: () => ({}) | undefined;
}
</script>

<style scoped>
div {
  font-size: 20px;
}
</style>
