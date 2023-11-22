// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_experiment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyExperimentModelImpl _$$MyExperimentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyExperimentModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      experimentId: json['experimentId'] as int,
      userId: json['userId'] as int,
      response:
          (json['response'] as List<dynamic>).map((e) => e as String).toList(),
      timeToComplete: json['timeToComplete'] as int,
    );

Map<String, dynamic> _$$MyExperimentModelImplToJson(
        _$MyExperimentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'experimentId': instance.experimentId,
      'userId': instance.userId,
      'response': instance.response,
      'timeToComplete': instance.timeToComplete,
    };
