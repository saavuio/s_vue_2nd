<template>
  <div>
    <span class="current-value">{{ value }}</span>
    <a
      href="#"
      @click.prevent="inc(2)">inc</a>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import { namespace } from 'vuex-class';

const counterVuexModule = namespace('counter');

@Component
export default class Test extends Vue {
  @counterVuexModule.State
  value: number | undefined;
  @counterVuexModule.Mutation
  inc!: () => void;
}
</script>

<style scoped>
.current-value {
  font-size: 2rem;
}
</style>
