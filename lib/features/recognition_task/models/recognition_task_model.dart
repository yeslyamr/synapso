import 'package:freezed_annotation/freezed_annotation.dart';

part 'recognition_task_model.freezed.dart';
part 'recognition_task_model.g.dart';

@freezed
class RecognitionTaskModel with _$RecognitionTaskModel {
  const factory RecognitionTaskModel({
    required int id,
    required int userId,
    required String name,
    required String type,
    required bool isDistractionEnabled,
    required String distractionType,
    required String distractionText,
    required String instructionText,
    required int distractionDuration,
    required int interStimuliDelay,
    required List<Datum> data,
  }) = _RecognitionTaskModel;

  factory RecognitionTaskModel.fromJson(Map<String, dynamic> json) => _$RecognitionTaskModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    required int id,
    required int recognitionId,
    required String displayed,
    required String hidden,
    required int delay,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
