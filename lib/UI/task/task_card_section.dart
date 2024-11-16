import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/task/models/task_model.dart';
import 'package:task_manager_get_x/UI/task/view_model/task_delete_controller.dart';
import 'package:task_manager_get_x/UI/task/widgets/task_card.dart';
import 'package:task_manager_get_x/UI/task/widgets/task_update.dart';
import 'package:task_manager_get_x/common/widgets/snack_massage.dart';

class TaskCardSection extends StatefulWidget {
  const TaskCardSection(
      {super.key, required this.taskModel, required this.onRefresh});

  final TaskModel taskModel;
  final VoidCallback onRefresh;

  @override
  State<TaskCardSection> createState() => _TaskCardSectionState();
}

class _TaskCardSectionState extends State<TaskCardSection> {
  final TaskDeleteController _taskDeleteController =
      Get.find<TaskDeleteController>();

  @override
  Widget build(BuildContext context) {
    return TaskCard(
      taskModel: widget.taskModel,
      child: _buildButtonBar(),
    );
  }

  Widget _buildButtonBar() {
    return Wrap(
      children: [
        TaskUpdate(
          taskModel: widget.taskModel,
          onRefresh: widget.onRefresh,
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: _deleteTask,
          child: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Future<void> _deleteTask() async {
    final bool result = await _taskDeleteController.taskDelete(
      widget.taskModel.sId!,
    );
    if (result) {
      widget.onRefresh();
    } else {
      snackMassage(true, _taskDeleteController.errorMessage!);
    }
  }
}
