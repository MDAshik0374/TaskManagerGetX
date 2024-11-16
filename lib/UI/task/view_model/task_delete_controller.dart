import 'package:get/get.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';
import 'package:task_manager_get_x/data/services/network_caller.dart';
import 'package:task_manager_get_x/data/utils/urls.dart';

class TaskDeleteController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> taskDelete(String taskId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse networkResponse = await NetworkCaller.getRequest(
      url: Urls.deleteTask(taskId),
    );
    if (networkResponse.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = networkResponse.errorMassage;
    }
    return isSuccess;
  }
}
