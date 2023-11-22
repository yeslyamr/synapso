import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:synapso/core/network/api_service.dart';
import 'package:synapso/features/my_experiments/model/my_experiment_model.dart';

class MyExperimentsRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  Future<List<MyExperimentModel>> getMyExperimentsList() async {
    try {
      final List<MyExperimentModel> myExperimentsList = await _apiService.getListData(
        endpoint: '/subject/result',
        parser: (json) {
          return myExperimentModelFromJson(jsonEncode(json));
        },
        requiresAuthToken: true,
      );
      return myExperimentsList;
    } catch (e) {
      rethrow;
    }
  }
}
