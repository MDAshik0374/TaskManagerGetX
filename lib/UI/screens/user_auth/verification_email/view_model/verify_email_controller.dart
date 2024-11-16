import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/otp_verify/otp_verify_screen.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';
import 'package:task_manager_get_x/data/services/network_caller.dart';
import 'package:task_manager_get_x/data/utils/urls.dart';

class VerifyEmailController extends GetxController {
  bool get inProgress => _inProgress;

  bool _inProgress = false;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  String? _successMessage;

  String? get  successMessage => _successMessage;

  Future<bool> verificationEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse networkResponse = await NetworkCaller.getRequest(
      url: Urls.recoverVerifyEmail(email),
    );
    if (networkResponse.isSuccess) {
      Get.to(() => OtpScreen(email: email));
      _successMessage = 'A 6 digit OTP code sent to your email';
      isSuccess = true;
    } else {
      _errorMessage = networkResponse.errorMassage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
