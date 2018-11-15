/* eslint-disable class-methods-use-this */
import {
  Module,
  VuexModule,
  Mutation,
  MutationAction,
} from 'vuex-module-decorators';

@Module({ namespaced: true, stateFactory: true })
export default class ExampleStore extends VuexModule {
  listOfValues: Array<any> = [];
  singleValue: number = 123;

  @Mutation
  addToListOfValues(newElements: Array<any>) {
    this.listOfValues.push(...newElements);
  }

  @MutationAction({ mutate: ['listOfValues'] })
  async fetchNewListOfValues() {
    // this would come from an api (use axios for api-calls)
    // const response: Response = await axios.get(...)
    const response = {
      listOfValues: [Math.random(), Math.random(), Math.random()],
    };
    return response;
  }
}
