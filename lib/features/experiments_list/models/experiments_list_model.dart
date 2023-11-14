import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapso/features/recall_task/models/recall_task_model.dart';
import 'dart:convert';

import 'package:synapso/features/recognition_task/models/recognition_task_model.dart';

part 'experiments_list_model.freezed.dart';
part 'experiments_list_model.g.dart';

ExperimentsModel experimentsModelFromJson(String str) => ExperimentsModel.fromJson(json.decode(str));

String experimentsModelToJson(ExperimentsModel data) => json.encode(data.toJson());

@freezed
class ExperimentsModel with _$ExperimentsModel {
  const factory ExperimentsModel({
    required List<RecallTaskModel> recall,
    required List<RecognitionTaskModel> recognition,
  }) = _ExperimentsModel;

  factory ExperimentsModel.fromJson(Map<String, dynamic> json) => _$ExperimentsModelFromJson(json);
}
