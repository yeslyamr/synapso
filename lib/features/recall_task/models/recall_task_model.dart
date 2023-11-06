import 'package:freezed_annotation/freezed_annotation.dart';

part 'recall_task_model.freezed.dart';
part 'recall_task_model.g.dart';

@freezed
class RecallTaskModel with _$RecallTaskModel {
  const factory RecallTaskModel({
    required Stimulus stimulus,
    required bool isSequenceMatter,
    required bool isFreeRecall,
  }) = _RecallTaskModel;

  factory RecallTaskModel.fromJson(Map<String, dynamic> json) => _$RecallTaskModelFromJson(json);
}

@freezed
class Stimulus with _$Stimulus {
  const factory Stimulus({
    required String type,
    required List<StimulusElement> stimuli,
  }) = _RecallTaskModelStimulus;

  factory Stimulus.fromJson(Map<String, dynamic> json) => _$StimulusFromJson(json);
}

@freezed
class StimulusElement with _$StimulusElement {
  const factory StimulusElement({
    required String data,
    required int delay,
    required String? cue,
  }) = _StimulusElement;

  factory StimulusElement.fromJson(Map<String, dynamic> json) => _$StimulusElementFromJson(json);
}
