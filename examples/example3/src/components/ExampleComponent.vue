<template>
  <div class="wrapper">
    <p>I'm a "dump" component. I should only take props from my parent and emit
    events back. No direct store interactions from within me!</p>
    <div><strong>Property:</strong> {{ exampleProperty }}</div>
    <div><strong>Data:</strong> {{ exampleData }}</div>
    <a href="#" @click.prevent="exampleLocalMethod">Local Interaction</a>
    <br />
    <a href="#" @click.prevent="exampleEmitMethod1">Store Interaction 1</a>
    <br />
    <a href="#" @click.prevent="exampleEmitMethod2">Store Interaction 2</a>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Prop } from 'vue-property-decorator';

@Component
export default class ExampleComponent extends Vue {
  @Prop({ default: 'default property value' })
  exampleProperty!: string;

  exampleData: string = 'Example';

  exampleLocalMethod() {
    this.exampleData = this.exampleData
      .split('')
      .reverse()
      .join('');
  }

  exampleEmitMethod1() {
    this.$emit('mutation', 'New property value after click');
  }

  exampleEmitMethod2() {
    this.$emit('action');
  }
}
</script>

<style lang="scss" scoped>
.wrapper {
  margin-left: 20px;
}
</style>
