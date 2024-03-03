// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recognition_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecognitionTaskModelImpl _$$RecognitionTaskModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecognitionTaskModelImpl(
      id: json['id'] as int,
      userId: json['userId'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      isDistractionEnabled: json['isDistractionEnabled'] as bool,
      distractionType: json['distractionType'] as String,
      distractionText: json['distractionText'] as String,
      instructionText: json['instructionText'] as String,
      distractionDuration: json['distractionDuration'] as int,
      interStimuliDelay: json['interStimuliDelay'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecognitionTaskModelImplToJson(
        _$RecognitionTaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'type': instance.type,
      'isDistractionEnabled': instance.isDistractionEnabled,
      'distractionType': instance.distractionType,
      'distractionText': instance.distractionText,
      'instructionText': instance.instructionText,
      'distractionDuration': instance.distractionDuration,
      'interStimuliDelay': instance.interStimuliDelay,
      'data': instance.data,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: json['id'] as int,
      recognitionId: json['recognitionId'] as int,
      displayed: json['displayed'] as String,
      hidden: json['hidden'] as String,
      delay: json['delay'] as int,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recognitionId': instance.recognitionId,
      'displayed': instance.displayed,
      'hidden': instance.hidden,
      'delay': instance.delay,
    };
