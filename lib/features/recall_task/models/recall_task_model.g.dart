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
      isSequenceMatter: json['isSequenceMatter'] as bool,
      isFreeRecall: json['isFreeRecall'] as bool,
    );

Map<String, dynamic> _$$RecallTaskModelImplToJson(
        _$RecallTaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'stimulus': instance.stimulus,
      'isSequenceMatter': instance.isSequenceMatter,
      'isFreeRecall': instance.isFreeRecall,
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
