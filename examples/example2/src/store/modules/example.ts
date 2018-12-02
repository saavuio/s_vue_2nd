/* eslint-disable class-methods-use-this */
import {
  Module,
  VuexModule,
  Mutation,
  Action,
  MutationAction,
} from 'vuex-module-decorators';

import axios from 'axios';

@Module({ namespaced: true, stateFactory: true })
export default class ExampleStore extends VuexModule {
  listOfValues: Array<any> = [];

  singleValue: number = 123;

  loading: boolean = false;

  @Mutation
  addToListOfValues(newElements: Array<any>) {
    this.listOfValues.push(...newElements);
  }

  @Mutation
  setListOfValues(newElements: Array<any>) {
    this.listOfValues = newElements;
  }

  @Mutation
  setLoading(newState: boolean) {
    this.loading = newState;
  }

  @Action
  async fetchListOfValues() {
    this.context.commit('setLoading', true);
    const response = await axios.get('/mocks/example.json');
    // DEV: mocked wait
    await new Promise(r => setTimeout(r, 1000));
    // END DEV
    this.context.commit('setLoading', false);
    // this.loading = false;
    this.context.commit('setListOfValues', response.data);
  }

  @MutationAction({ mutate: ['listOfValues'] })
  async generateListOfValues() {
    const response = {
      listOfValues: [Math.random(), Math.random(), Math.random()],
    };
    return response;
  }
}
