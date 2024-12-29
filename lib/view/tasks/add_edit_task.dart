import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/library/blocs/tasks/tasks_cubit.dart';
import 'package:sport/library/blocs/tasks/tasks_state.dart';
import 'package:sport/library/data_structure/task/task_model.dart';
import 'package:sport/library/utils/colors.dart';
import 'package:sport/view/componenets/text_field_widget.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: Text(widget.task == null ? "Add New Task" : "Edit Task ${widget.task?.title}"),
        centerTitle: true,
      ),
      body: BlocBuilder<TasksCubit, TasksState>(
        bloc: cubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
            child: Column(
              children: [
                _buildInputForm(cubit.title,"Task Name",50,state.title),
                 const SizedBox(height: 30),
                _buildInputForm(cubit.description,"Task Description",100,state.description),
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

  Widget _buildInputForm(TextEditingController controller ,String txt,double height,String? error){
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(txt),
         const SizedBox(height: 10),
         TextFieldWidget(
           controller: controller,
           height: height,
           error: error,
         ),
       ],
     );
  }

  Widget _buildButtonSave(TasksState state){
    return GestureDetector(
      onTap: ()async{
        bool isSaved = await cubit.saveTask();
        if(isSaved){
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
          borderRadius: BorderRadius.circular(6)
        ),
        child:   Center(
          child: state.loading ?
          const CircularProgressIndicator(color: Colors.white,)
          :
          const Text(
            "Save",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}
