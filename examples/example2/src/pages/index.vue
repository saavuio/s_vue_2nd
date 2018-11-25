<template>
  <v-app>
    <v-content>
      <v-container>
        <div class="index">
          <Root />
        </div>
      </v-container>
    </v-content>
  </v-app>
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
  font-family: sans-serif;
  background-color: #eee;
  margin: 15px 10px;
  padding: 20px 30px;
}
</style>
