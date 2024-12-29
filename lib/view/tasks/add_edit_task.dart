import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/library/blocs/tasks/tasks_cubit.dart';
import 'package:sport/library/blocs/tasks/tasks_state.dart';
import 'package:sport/library/data_structure/task/task_model.dart';
import 'package:sport/library/utils/colors.dart';
import 'package:sport/view/componenets/text_field_widget.dart';
import 'package:sport/view/componenets/text_widget.dart';

class AddEditTask extends StatefulWidget {
  const AddEditTask({super.key, this.task});

  final TaskModel? task;

  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> {
  late TasksCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = TasksCubit(task: widget.task);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: TextWidget(
          text:
              cubit.isAdd ? "Add New Task" : "Edit Task ${widget.task?.title}",
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TasksCubit, TasksState>(
        bloc: cubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                _buildInputForm(
                    controller: cubit.title,
                    txt: "Task Name",
                    error: state.title,
                    maxLines: 1),
                const SizedBox(height: 30),
                _buildInputForm(
                  controller: cubit.description,
                  txt: "Task Description",
                  error: state.description,
                  maxLines: 5,
                ),
                const Spacer(),
                _buildButtonSave(state),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputForm(
      {required TextEditingController controller,
      required String txt,
      String? error,
      int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txt),
        const SizedBox(height: 10),
        TextFieldWidget(
          controller: controller,
          maxLines: maxLines,
          error: error,
        ),
      ],
    );
  }

  Widget _buildButtonSave(TasksState state) {
    return GestureDetector(
      onTap: () async {
        bool isSaved = await cubit.saveTask();
        if (isSaved) {
          Navigator.pop(context);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        // width: state.loading ? 50 : double.infinity,
        decoration: BoxDecoration(
            color: ColorsApp.primaryColor,
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: state.loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const TextWidget(
                  text: "Save",
                ),
        ),
      ),
    );
  }
}
