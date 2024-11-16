import 'package:get/get.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';
import 'package:task_manager_get_x/data/services/network_caller.dart';
import 'package:task_manager_get_x/data/utils/urls.dart';

class TaskUpdateController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> updateTask(String userId, String status) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse networkResponse = await NetworkCaller.getRequest(
      url: Urls.updateTaskStatus(userId, status),
    );

    if (networkResponse.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = networkResponse.errorMassage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
