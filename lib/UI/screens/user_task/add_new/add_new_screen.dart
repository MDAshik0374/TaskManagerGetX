import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_task/add_new/widgets/add_new_form.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  static String name = '/addNew';

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.authScreenSidePadding),
          child: const SingleChildScrollView(
            child: AddNewForm(),
          ),
        ),
      ),
    );
  }


}
