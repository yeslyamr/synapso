// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collins_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollinsUserResponseModelImpl _$$CollinsUserResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CollinsUserResponseModelImpl(
      experimentId: json['experimentId'] as int,
      collinDataId: json['collinDataId'] as int,
      response: json['response'] as String,
      timeToComplete: json['timeToComplete'] as int,
    );

Map<String, dynamic> _$$CollinsUserResponseModelImplToJson(
        _$CollinsUserResponseModelImpl instance) =>
    <String, dynamic>{
      'experimentId': instance.experimentId,
      'collinDataId': instance.collinDataId,
      'response': instance.response,
      'timeToComplete': instance.timeToComplete,
    };
