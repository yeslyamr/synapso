// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recall_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecallTaskModelImpl _$$RecallTaskModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecallTaskModelImpl(
      id: json['id'] as int,
      userId: json['userId'] as int,
      name: json['name'] as String,
      stimulus: Stimulus.fromJson(json['stimulus'] as Map<String, dynamic>),
      isFreeRecall: json['isFreeRecall'] as bool,
      isDistractionEnabled: json['isDistractionEnabled'] as bool,
      distractionType: json['distractionType'] as String,
      distractionText: json['distractionText'] as String,
      instructionText: json['instructionText'] as String,
      recallInstructionText: json['recallInstructionText'] as String,
      distractionDuration: json['distractionDuration'] as int,
      interStimuliDelay: json['interStimuliDelay'] as int,
    );

Map<String, dynamic> _$$RecallTaskModelImplToJson(
        _$RecallTaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'stimulus': instance.stimulus,
      'isFreeRecall': instance.isFreeRecall,
      'isDistractionEnabled': instance.isDistractionEnabled,
      'distractionType': instance.distractionType,
      'distractionText': instance.distractionText,
      'instructionText': instance.instructionText,
      'recallInstructionText': instance.recallInstructionText,
      'distractionDuration': instance.distractionDuration,
      'interStimuliDelay': instance.interStimuliDelay,
    };

_$RecallTaskModelStimulusImpl _$$RecallTaskModelStimulusImplFromJson(
        Map<String, dynamic> json) =>
    _$RecallTaskModelStimulusImpl(
      type: json['type'] as String,
      stimuli: (json['stimuli'] as List<dynamic>)
          .map((e) => StimulusElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecallTaskModelStimulusImplToJson(
        _$RecallTaskModelStimulusImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'stimuli': instance.stimuli,
    };

_$StimulusElementImpl _$$StimulusElementImplFromJson(
        Map<String, dynamic> json) =>
    _$StimulusElementImpl(
      id: json['id'] as int,
      recallId: json['recallId'] as int,
      data: json['data'] as String,
      delay: json['delay'] as int,
      cue: json['cue'] as String?,
    );

Map<String, dynamic> _$$StimulusElementImplToJson(
        _$StimulusElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recallId': instance.recallId,
      'data': instance.data,
      'delay': instance.delay,
      'cue': instance.cue,
    };
