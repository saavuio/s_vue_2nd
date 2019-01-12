import { Module, VuexModule, Mutation, Action } from 'vuex-module-decorators';
import axios from 'axios';

@Module({ namespaced: true, stateFactory: true })
export default class ExampleStore extends VuexModule {
  exampleValues: Array<any> = [];

  examplePropertyValue: string = 'Default value from store';

  loading: boolean = false;

  @Mutation
  setLoading(newState: boolean) {
    this.loading = newState;
  }

  @Mutation
  setExamplePropertyValue(newValue: string) {
    this.examplePropertyValue = newValue;
  }

  @Action
  async fetchPropertyValue() {
    this.context.commit('setLoading', true);
    // DEV: mocked wait
    await new Promise(r => setTimeout(r, 1000));
    // END DEV
    try {
      const response = await axios.get('/data.txt');
      this.context.commit('setLoading', false);
      this.context.commit('setExamplePropertyValue', response.data);
    } catch (err) {
      this.context.commit('setLoading', false);
    }
  }
}
