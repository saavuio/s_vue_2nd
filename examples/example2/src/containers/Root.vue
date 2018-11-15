<template>
  <div>
    Hello World {{ singleValue }}!
    <br />
    <br />
    <DummyButton
      :text="buttonText"
      :action="buttonAction" />
    <br />
    <br />
    <pre>{{ listOfValues }}</pre>
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
  @exampleVuexModule.Action
  fetchNewListOfValues!: () => ({}) | undefined;

  buttonText = 'Click';
  buttonAction = this.fetchNewListOfValues;
}
</script>

<style scoped>
div {
  font-size: 20px;
}
</style>
