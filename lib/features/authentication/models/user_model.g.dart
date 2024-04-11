// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      role: json['role'] as String?,
      question1: json['question1'] as int?,
      question2: json['question2'] as int?,
      question3: json['question3'] as int?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'role': instance.role,
      'question1': instance.question1,
      'question2': instance.question2,
      'question3': instance.question3,
    };
