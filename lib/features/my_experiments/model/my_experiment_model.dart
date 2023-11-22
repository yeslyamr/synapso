import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'my_experiment_model.freezed.dart';
part 'my_experiment_model.g.dart';

List<MyExperimentModel> myExperimentModelFromJson(String str) =>
    List<MyExperimentModel>.from(json.decode(str).map((x) => MyExperimentModel.fromJson(x)));

String myExperimentModelToJson(List<MyExperimentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class MyExperimentModel with _$MyExperimentModel {
  const factory MyExperimentModel({
    required int id,
    required String name,
    required String type,
    required int experimentId,
    required int userId,
    required List<String> response,
    required int timeToComplete,
  }) = _MyExperimentModel;

  factory MyExperimentModel.fromJson(Map<String, dynamic> json) => _$MyExperimentModelFromJson(json);
}
