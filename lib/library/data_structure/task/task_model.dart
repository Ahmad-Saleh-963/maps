import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {

  @JsonKey(includeToJson: false)
  int? id;
  String? title;
  String? description;
  String? created_at;
  bool isCompleted;

  @JsonKey(includeToJson: false,includeFromJson: false)
  bool isDeleting = false;

  TaskModel({
     this.id,
    required this.title,
    required this.description,
    required this.created_at,
    this.isCompleted = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
