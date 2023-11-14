import 'package:get_it/get_it.dart';
import 'package:synapso/core/network/api_service.dart';
import 'package:synapso/features/experiments_list/models/experiments_list_model.dart';

class ExperimentsRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  Future<ExperimentsModel> getExperimentsList() async {
    try {
      final ExperimentsModel recognitionTaskModel = await _apiService.getDocumentData(
        endpoint: '/subject/experiment',
        parser: (json) {
          return ExperimentsModel.fromJson(json);
        },
        requiresAuthToken: true,
      );
      return recognitionTaskModel;
    } catch (e) {
      rethrow;
    }
  }
}
