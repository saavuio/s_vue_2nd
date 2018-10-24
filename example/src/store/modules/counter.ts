import { Module, VuexModule, Mutation } from 'vuex-module-decorators';
// import axios from 'axios';

@Module({ namespaced: true, stateFactory: true })
export default class ChannelStore extends VuexModule {
  value: number = 1;

  @Mutation
  inc(incBy: number) {
    this.value += incBy || 0;
  }
}
