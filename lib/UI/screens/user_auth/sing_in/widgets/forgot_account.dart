import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_up/sing_up_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/verification_email/verification_email_screen.dart';

class ForgotAccount extends StatelessWidget {
  const ForgotAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        TextButton(
          onPressed: () {
            Get.to(() => const VerityEmailScreen());
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
              children: [
                const TextSpan(
                  text: "Don't have account?  ",
                ),
                TextSpan(
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    text: 'Sing Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(SingUpScreen.name);
                      }),
              ]),
        ),
      ]),
    );
  }
}
