<template>
  <div class="index">
    <Root />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Root from '@/containers/Root.vue';

@Component({
  components: {
    Root,
  },
})
export default class Index extends Vue {}
</script>

<style scoped>
.index {
  background-color: #eee;
  margin: 15px 10px;
  padding: 10px;
}
</style>
