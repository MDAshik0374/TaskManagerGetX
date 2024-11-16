import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_get_x/UI/task/models/task_model.dart';
import 'package:task_manager_get_x/common/widgets/neumorphism_box.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
    required this.child,
  });

  final TaskModel taskModel;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('EEE, M/ d/ y').format(
      DateTime.parse(
        taskModel.createdDate!,
      ),
    );
    return NeumorphismBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskModel.title ?? '',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                taskModel.status ?? '',
                style: TextStyle(
                  color: statusColor(taskModel.status!),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(taskModel.description ?? ''),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(fontSize: 10),
              ),
              child,
            ],
          ),
        ],
      ),
    );
  }

  Color statusColor(String status) {
    switch (status) {
      case 'New':
        return Colors.green;
      case 'Completed':
        return Colors.blue;
      case 'Progress':
        return Colors.orange;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.green;
    }
  }
}
