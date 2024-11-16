import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/update_password/widgets/password_form.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';
import 'package:task_manager_get_x/common/widgets/have_account_section.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key, required this.email, required this.otp});

  final String email;
  final String otp;

  static String name = '/password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.authScreenSidePadding,
          ),
          child:  SingleChildScrollView(
            child: Column(
              children: [
                PasswordForm(email: email, otp: otp,),
                const HaveAccountSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
