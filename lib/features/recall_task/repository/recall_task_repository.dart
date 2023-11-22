import 'package:get_it/get_it.dart';

import '../../../core/network/api_service.dart';

class RecallTaskRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  Future<bool> submitResult({
    required List<String> response,
    required int id,
    required int timeToComplete,
  }) async {
    try {
      await _apiService.postData(
        endpoint: '/subject/result',
        parser: null,
        requiresAuthToken: true,
        body: {
          'id': id,
          'type': 'recall',
          'timeToComplete': timeToComplete,
          'response': response,
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
