<template>
  <v-btn
    :disabled="disabled"
    @click="action"
  >
    {{ text }}
  </v-btn>
</template>

<script lang="ts">
import { Component, Vue, Prop } from 'vue-property-decorator';

@Component
export default class Root extends Vue {
  @Prop({ type: String, required: true, default: 'Click Me' })
  text!: string;

  @Prop({ type: Function, required: true, default: () => {} })
  action!: Function;

  @Prop({ type: Boolean, default: false })
  disabled!: boolean;
}
</script>

<style scoped>
button {
  font-size: 10px;
}
</style>
