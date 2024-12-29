import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport/library/blocs/tasks/tasks_cubit.dart';
import 'package:sport/library/blocs/tasks/tasks_state.dart';
import 'package:sport/library/utils/colors.dart';
import 'package:sport/library/utils/static_recoures.dart';
import 'package:sport/view/componenets/empty_component.dart';
import 'package:sport/view/componenets/image_circle_component.dart';
import 'package:sport/view/componenets/loading_component.dart';
import 'package:sport/view/tasks/add_edit_task.dart';
import 'package:sport/view/tasks/task_widget.dart';

import 'banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TasksCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = TasksCubit();
    cubit.addListenerTasks();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        actions: const [
          ImageCircleComponent(radius: 20),
          SizedBox(width: 16),
        ],
        leadingWidth: double.infinity,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("salam, ${StaticResources.name}"),
              SizedBox(height: 6),
              Text(StaticResources.email),
            ],
          ),
        ),
      ),
      body: BlocBuilder<TasksCubit, TasksState>(
        bloc: cubit,
        builder: (context, state) {
          return SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                 const BannerWidget(),
                const SizedBox(height: 16),
                _buildListTasks(state),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditTask(),
            ),
          );
        },
        backgroundColor: ColorsApp.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListTasks(TasksState state) {
    if (state.loading) {
      return const LoadingComponent();
    } else if (state.tasks.isEmpty) {
      return const EmptyComponent(
        title: "لايوجد مهام",
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: state.tasks.length,
        itemBuilder: (context, index) => TaskWidget(
          task: state.tasks[index],
          onDelete: (){
            cubit.deleteTask(state.tasks[index]);
          },
          onComplete: (){
            cubit.completeTask(state.tasks[index]);
          },
        ),
      ),
    );
  }
}
