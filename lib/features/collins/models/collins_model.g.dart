// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collins_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollinsModelImpl _$$CollinsModelImplFromJson(Map<String, dynamic> json) =>
    _$CollinsModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      userId: json['userId'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      instructionText: json['instructionText'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      interStimuliDelay: json['interStimuliDelay'] as int,
    );

Map<String, dynamic> _$$CollinsModelImplToJson(_$CollinsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'instructionText': instance.instructionText,
      'data': instance.data,
      'interStimuliDelay': instance.interStimuliDelay,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: json['id'] as int,
      collinId: json['collinId'] as int,
      question: json['question'] as String,
      correct: json['correct'] as String,
      wrong: json['wrong'] as String,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collinId': instance.collinId,
      'question': instance.question,
      'correct': instance.correct,
      'wrong': instance.wrong,
    };
