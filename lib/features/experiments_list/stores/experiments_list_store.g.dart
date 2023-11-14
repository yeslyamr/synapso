// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiments_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExperimentsListStore on _ExperimentsListStoreBase, Store {
  Computed<bool>? _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: '_ExperimentsListStoreBase.hasResults'))
          .value;

  late final _$fetchExperimentsAtom = Atom(
      name: '_ExperimentsListStoreBase.fetchExperiments', context: context);

  @override
  ObservableFuture<ExperimentsModel> get fetchExperiments {
    _$fetchExperimentsAtom.reportRead();
    return super.fetchExperiments;
  }

  @override
  set fetchExperiments(ObservableFuture<ExperimentsModel> value) {
    _$fetchExperimentsAtom.reportWrite(value, super.fetchExperiments, () {
      super.fetchExperiments = value;
    });
  }

  late final _$fetchReposAsyncAction =
      AsyncAction('_ExperimentsListStoreBase.fetchRepos', context: context);

  @override
  Future<void> fetchRepos() {
    return _$fetchReposAsyncAction.run(() => super.fetchRepos());
  }

  @override
  String toString() {
    return '''
fetchExperiments: ${fetchExperiments},
hasResults: ${hasResults}
    ''';
  }
}
