import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/home/home_screen.dart';
import 'package:task_manager_get_x/UI/screens/splash_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/profile_update_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/sing_in_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_up/sing_up_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/update_password/update_password_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/verification_email/verification_email_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_task/add_new/add_new_screen.dart';
import 'package:task_manager_get_x/controller_binder.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        colorSchemeSeed: Colors.blue,
        inputDecorationTheme: _buildInputDecorationTheme(),
        elevatedButtonTheme: _buildElevatedButtonThemeData(),
      ),
      initialBinding: ControllerBinder(),
      initialRoute: SplashScreen.name,
      routes: {
        SplashScreen.name: (context) => const SplashScreen(),
        SingInScreen.name: (context) => const SingInScreen(),
        SingUpScreen.name: (context) => const SingUpScreen(),
        VerityEmailScreen.name: (context) => const VerityEmailScreen(),
        HomeScreen.name: (context) => const HomeScreen(),
        ProfileUpdateScreen.name: (context) => const ProfileUpdateScreen(),
        AddNewScreen.name: (context) => const AddNewScreen(),
      },
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[600],
        foregroundColor: Colors.grey[300],
        fixedSize: const Size(double.maxFinite, 54),
      ),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.grey),
      border: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputBorder(),
      enabledBorder: _buildOutlineInputBorder(),
      errorBorder: _buildOutlineInputBorder(),
      focusedErrorBorder: _buildOutlineInputBorder(),
      disabledBorder: _buildOutlineInputBorder(),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey.shade100),
    );
  }
}
