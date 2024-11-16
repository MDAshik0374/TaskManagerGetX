import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/app_bar/tm_app_bar.dart';
import 'package:task_manager_get_x/UI/screens/home/view_model/home_screen_controller.dart';
import 'package:task_manager_get_x/UI/screens/user_task/canceled/canceled_task_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_task/completed/completed_task_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_task/new/new_task_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_task/progress/progress_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeController = Get.put(HomeScreenController());

  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    ProgressTaskScreen(),
    CancelTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TmAppBar(),
      body: Obx(() {
        return _screens[homeController.selectedIndex.value];
      }),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildNavigationBar() {
    return Obx(() {
      return NavigationBar(
        selectedIndex: homeController.selectedIndex.value,
        onDestinationSelected: homeController.updateSelectedIndex,
        backgroundColor: Colors.grey[300],
        indicatorColor: Colors.grey[600],
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.new_label_outlined),
            selectedIcon: Icon(
              Icons.new_label_outlined,
              color: Colors.white,
            ),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.label_important),
            selectedIcon: Icon(
              Icons.label_important,
              color: Colors.white,
            ),
            label: 'Completed',
          ),
          NavigationDestination(
            icon: Icon(Icons.label_important_outline),
            selectedIcon: Icon(
              Icons.label_important_outline,
              color: Colors.white,
            ),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.label_off_outlined),
            selectedIcon: Icon(
              Icons.label_off_outlined,
              color: Colors.white,
            ),
            label: 'Canceled',
          ),
        ],
      );
    });
  }
}
