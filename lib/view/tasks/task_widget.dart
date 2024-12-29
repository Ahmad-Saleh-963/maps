import 'package:flutter/material.dart';
import 'package:sport/library/data_structure/task/task_model.dart';
import 'package:sport/library/utils/colors.dart';
import 'package:sport/view/tasks/add_edit_task.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task, required this.onDelete,required this.onComplete});

  final TaskModel task;
  final Function onDelete;
  final Function onComplete;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                  onPressed: (){
                    widget.onComplete();
                  },
                  icon: widget.task.isCompleted ?
                      Image.asset("assets/images/ok.png",width: 35) :
                  Icon(Icons.radio_button_off, color: ColorsApp.buttons,size: 40),
              ),
              const SizedBox(width: 8),
              Text(
                widget.task.title ?? '',
                style:  TextStyle(
                  fontSize: 18,
                  decoration: widget.task.isCompleted ? TextDecoration.lineThrough :  TextDecoration.none,
                  color: widget.task.isCompleted ? Colors.grey : ColorsApp.buttons,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _buildButton("Delete", widget.onDelete),
              const SizedBox(width: 8),
              _buildButton(
                "Edit",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEditTask(task: widget.task),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String title, Function onPress) {
    return OutlinedButton(
      onPressed: () {
        onPress();
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ColorsApp.buttons, width: 1 ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        foregroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: ColorsApp.buttons,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
