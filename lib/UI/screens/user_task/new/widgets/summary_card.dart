import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_task/new/models/task_count_model.dart';
import 'package:task_manager_get_x/common/widgets/neumorphism_box.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.taskCountModel});

  final TaskCountModel taskCountModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: SizedBox(
        width: 98,
        child: NeumorphismBox(
          child: Column(
            children: [
              Text(
                taskCountModel.sum.toString(),
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w600),
              ),
              Text(
                taskCountModel.sId ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
