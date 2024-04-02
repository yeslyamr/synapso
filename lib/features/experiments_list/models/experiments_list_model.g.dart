// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiments_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperimentsModelImpl _$$ExperimentsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExperimentsModelImpl(
      recall: (json['recall'] as List<dynamic>?)
          ?.map((e) => RecallTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recognition: (json['recognition'] as List<dynamic>?)
          ?.map((e) => RecognitionTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      collin: (json['collin'] as List<dynamic>?)
          ?.map((e) => CollinsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExperimentsModelImplToJson(
        _$ExperimentsModelImpl instance) =>
    <String, dynamic>{
      'recall': instance.recall,
      'recognition': instance.recognition,
      'collin': instance.collin,
    };
