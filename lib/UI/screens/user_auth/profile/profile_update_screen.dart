import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/app_bar/tm_app_bar.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/widgets/profile_image_container.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/widgets/update_profile_form.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  static String name = '/profile';

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const TmAppBar(
        isProfile: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.authScreenSidePadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Update Profile',
                  style: textTheme.displayMedium,
                ),
                SizedBox(height: size.height * 0.026),
                const ProfileImageContainer(),
                const UpdateProfileForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
