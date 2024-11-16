import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/home/home_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/sing_in_screen.dart';
import 'package:task_manager_get_x/data/data_controller/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await AuthController.getAccessToken();
    if (AuthController.isLoggedIn()) {
      await AuthController.getUserData();
      Get.offAllNamed(HomeScreen.name);
    } else {
      Get.offAllNamed(SingInScreen.name);
    }
  }

  @override
  void initState() {
    super.initState();
    _moveNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.task_rounded,
              size: 104,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              'Task Manager',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
