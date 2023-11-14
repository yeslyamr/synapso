import 'package:mobx/mobx.dart';
import 'package:synapso/features/experiments_list/models/experiments_list_model.dart';
import 'package:synapso/features/experiments_list/repository/experiments_repository.dart';
part 'experiments_list_store.g.dart';

class ExperimentsListStore = _ExperimentsListStoreBase with _$ExperimentsListStore;

abstract class _ExperimentsListStoreBase with Store {
  final ExperimentsRepository repository = ExperimentsRepository();

  ExperimentsModel? experimentsModel;

  @observable
  ObservableFuture<ExperimentsModel> fetchExperiments = emptyResponse;

  @computed
  bool get hasResults => fetchExperiments != emptyResponse && fetchExperiments.status == FutureStatus.fulfilled;

  static ObservableFuture<ExperimentsModel> emptyResponse = ObservableFuture.value(
    const ExperimentsModel(
      recall: [],
      recognition: [],
    ),
  );

  @action
  Future<void> fetchRepos() async {
    final future = repository.getExperimentsList();

    fetchExperiments = ObservableFuture(future);
    try {
      experimentsModel = await future;
    } catch (e) {
      experimentsModel = null;
    }
  }
}
