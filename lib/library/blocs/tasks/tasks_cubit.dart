import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/library/blocs/tasks/tasks_state.dart';
import 'package:sport/library/data_structure/task/task_model.dart';
import 'package:sport/library/utils/shared_preferences_helper.dart';
import 'package:sport/library/utils/toast_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TasksCubit extends Cubit<TasksState> {
  late SupabaseClient db;
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  late TaskModel? task;
  bool isAdd = true;

  TasksCubit({this.task}) : super(TasksState()) {
    db = SharedPreferencesHelper.getInstanceSupabase();
    initData();
  }

  void initData() {
    if (task != null) {
      title.text = task!.title ?? '';
      description.text = task!.description ?? '';
      isAdd = false;
    }
  }

  Future<void> getTasks() async {
    emit(state.copyWith(title: null, description: null, loading: state.tasks.isEmpty ? true : false , hasErorr :false));
    List<TaskModel> tasks = [];
    try {
      var response = await db.from('maps').select().order('id');
      if (response.isNotEmpty) {
        for (var task in response) {
          tasks.add(TaskModel.fromJson(task));
        }
      }
    } catch (e) {
      ShowToastHelper.show("$e", ToastType.error);
      emit(state.copyWith(loading: false , hasErorr : true));
    }
    emit(state.copyWith(loading: false, tasks: tasks));
  }

  Future<bool> saveTask() async {
    if (state.loading) return false;
    if (title.text.isEmpty) {
      emit(state.copyWith(title: "العنوان مطلوب"));
      return false;
    }
    if (description.text.isEmpty) {
      emit(state.copyWith(description: "الوصف مطلوب"));
      return false;
    }
    emit(state.copyWith(title: null, description: null, loading: true));
    try {
      var response;
      if (isAdd) {
        task = TaskModel(
            title: title.text,
            description: description.text,
            created_at: DateTime.now().toString());
        response = await db.from('maps').insert(task!.toJson()).select();
      } else {
        response = await db
            .from('maps')
            .update(task!.toJson())
            .eq('id', task!.id!)
            .select();
      }
      if (response.isNotEmpty) {
        ShowToastHelper.show("تم التحفظ", ToastType.success);
      }
    } catch (e) {
      ShowToastHelper.show("$e", ToastType.error);
      emit(state.copyWith(loading: false));
      return false;
    }
    emit(state.copyWith(loading: false));
    return true;
  }

  Future<void> deleteTask(TaskModel task) async {
    if(task.isDeleting)return;
    emit(state.copyWith(date: DateTime.now().toString()));
    try {
       var response = await db
            .from('maps')
            .delete()
            .eq('id', task.id!)
            .select();
      if (response.isNotEmpty) {
        ShowToastHelper.show("تم الحذف", ToastType.success);
      }
    } catch (e) {
      ShowToastHelper.show("$e", ToastType.error);
    }
    task.isDeleting = false;
    emit(state.copyWith(date: DateTime.now().toString()));
  }

  Future<void> completeTask(TaskModel task) async {
    task.isCompleted = !task.isCompleted;
    emit(state.copyWith(date: DateTime.now().toString()));
    try {
      var response = await db
          .from('maps')
          .update(task.toJson())
          .eq('id', task.id!)
          .select();
    } catch (e) {
      task.isCompleted = !task.isCompleted;
      ShowToastHelper.show("$e", ToastType.error);
    }
    emit(state.copyWith(date: DateTime.now().toString()));
  }
  
  Future<void> addListenerTasks() async {
    db.from('maps').stream(primaryKey: ['id']).listen(
      (event) {
        getTasks();
      },
    );
  }
}
