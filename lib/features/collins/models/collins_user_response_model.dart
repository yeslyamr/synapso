import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'collins_user_response_model.freezed.dart';
part 'collins_user_response_model.g.dart';

CollinsUserResponseModel collinsUserResponseModelFromJson(String str) =>
    CollinsUserResponseModel.fromJson(json.decode(str));

String collinsUserResponseModelToJson(CollinsUserResponseModel data) => json.encode(data.toJson());

@freezed
class CollinsUserResponseModel with _$CollinsUserResponseModel {
  const factory CollinsUserResponseModel({
    required int experimentId,
    required int collinDataId,
    required String response,
    required int timeToComplete,
  }) = _CollinsUserResponseModel;

  factory CollinsUserResponseModel.fromJson(Map<String, dynamic> json) => _$CollinsUserResponseModelFromJson(json);
}
