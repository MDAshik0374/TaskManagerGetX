import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_task/progress/view_model/progress_task_controller.dart';
import 'package:task_manager_get_x/UI/task/task_card_section.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/common/widgets/snack_massage.dart';
import 'package:task_manager_get_x/common/widgets/tm_progress_indicator.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  final ProgressTaskController _progressTaskController =
      Get.find<ProgressTaskController>();

  @override
  void initState() {
    super.initState();
    _getProgressTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        onRefresh: () async {
          _getProgressTask();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
              AppPadding.defaultPadding,
            ),
            child: Expanded(
              child: GetBuilder<ProgressTaskController>(
                builder: (controller) {
                  return Visibility(
                    visible: !controller.inProgress,
                    replacement: const TMProgressIndicator(),
                    child: ListView.separated(
                      itemCount: controller.taskList.length,
                      itemBuilder: (context, index) {
                        return TaskCardSection(
                          taskModel: controller.taskList[index],
                          onRefresh: _getProgressTask,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getProgressTask() async {
    final bool result = await _progressTaskController.getProgressTask();
    if (result == false) {
      snackMassage(true, _progressTaskController.errorMessage!);
    }
  }
}
