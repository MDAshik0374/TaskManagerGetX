import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_up/widgets/sing_up_form.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';
import 'package:task_manager_get_x/common/widgets/have_account_section.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  static String name = '/SingUp';

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.authScreenSidePadding,
          ),
          child: const Column(
            children: [
              SingUpForm(),
              HaveAccountSection(),
            ],
          ),
        ),
      ),
    );
  }
}
