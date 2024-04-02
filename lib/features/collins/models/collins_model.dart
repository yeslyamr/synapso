import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'collins_model.freezed.dart';
part 'collins_model.g.dart';

CollinsModel collinsModelFromJson(String str) => CollinsModel.fromJson(json.decode(str));

String collinsModelToJson(CollinsModel data) => json.encode(data.toJson());

@freezed
class CollinsModel with _$CollinsModel {
  const factory CollinsModel({
    required int id,
    required String name,
    required int userId,
    required DateTime createdAt,
    required String instructionText,
    required List<Datum> data,
    required int interStimuliDelay,
  }) = _CollinsModel;

  factory CollinsModel.fromJson(Map<String, dynamic> json) => _$CollinsModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    required int id,
    required int collinId,
    required String question,
    required String correct,
    required String wrong,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
