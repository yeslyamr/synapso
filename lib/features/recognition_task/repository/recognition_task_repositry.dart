import 'package:get_it/get_it.dart';
import 'package:synapso/features/recognition_task/models/recognition_task_model.dart';

import '../../../core/network/api_service.dart';

class RecogntitionTaskRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  Future<RecognitionTaskModel> getRecognitionTask({required int id}) async {
    try {
      final RecognitionTaskModel recognitionTaskModel = await _apiService.getDocumentData(
        endpoint: '/subject/recognition/$id',
        parser: (json) {
          return RecognitionTaskModel.fromJson(json);
        },
        requiresAuthToken: true,
      );
      return recognitionTaskModel;
    } catch (e) {
      rethrow;
    }
  }
}
