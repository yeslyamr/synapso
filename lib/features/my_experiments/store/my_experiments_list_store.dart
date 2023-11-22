import 'package:mobx/mobx.dart';
import 'package:synapso/features/my_experiments/model/my_experiment_model.dart';
import 'package:synapso/features/my_experiments/repository/my_experiments_repository.dart';

part 'my_experiments_list_store.g.dart';

class MyExperimentsListStore = _MyExperimentsListStoreBase with _$MyExperimentsListStore;

abstract class _MyExperimentsListStoreBase with Store {
  final MyExperimentsRepository repository = MyExperimentsRepository();

  List<MyExperimentModel>? experimentsModel;

  @observable
  ObservableFuture<List<MyExperimentModel>> fetchExperiments = emptyResponse;

  @computed
  bool get hasResults => fetchExperiments != emptyResponse && fetchExperiments.status == FutureStatus.fulfilled;

  static ObservableFuture<List<MyExperimentModel>> emptyResponse = ObservableFuture.value([]);

  @action
  Future<void> fetchRepos() async {
    final future = repository.getMyExperimentsList();

    fetchExperiments = ObservableFuture(future);
    try {
      experimentsModel = await future;
    } catch (e) {
      experimentsModel = null;
    }
  }
}
