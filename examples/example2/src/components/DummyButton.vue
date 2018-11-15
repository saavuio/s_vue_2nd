<template>
  <button @click="action">
    {{ text }}
  </button>
</template>

<script lang="ts">
import { Component, Vue, Prop } from 'vue-property-decorator';

@Component
export default class Root extends Vue {
  @Prop({ type: String, required: true, default: 'Click Me' })
  text!: string;
  @Prop({ type: Function, required: true, default: () => {} })
  action!: Function;
}
</script>

<style scoped>
button {
  font-size: 10px;
}
</style>
