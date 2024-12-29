import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport/library/data_structure/task/task_model.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  factory TasksState({
    @Default(false) bool loading,
    @Default(false) bool updating,
    @Default('') String date,
    String? title,
    String? description,
    @Default([]) List<TaskModel> tasks,
  }) = _TasksState;
}
