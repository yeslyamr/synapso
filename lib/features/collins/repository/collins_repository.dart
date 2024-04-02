import 'package:get_it/get_it.dart';
import 'package:synapso/features/collins/models/collins_user_response_model.dart';

import '../../../core/network/api_service.dart';

class CollinsRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  Future<bool> submitResult({
    required List<CollinsUserResponseModel> response,
  }) async {
    try {
      await _apiService.postData(
        endpoint: '/subject/collin/result',
        parser: null,
        requiresAuthToken: true,
        body: null,
        listData: response.map((e) => e.toJson()).toList(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
