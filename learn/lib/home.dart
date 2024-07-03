import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:learn/data/controllers/dashboard_controller.dart';
import 'package:learn/presentation/screens/home.dart';
import 'package:learn/presentation/screens/profile.dart';
import 'package:learn/presentation/screens/quiz_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    AllQuiz(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(dashboardProvider.notifier);
        return Scaffold(
          body: _pages[ref.watch(dashboardProvider).selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home_1_copy),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.message_question_copy),
                label: 'Quiz',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.user_cirlce_add_copy),
                label: 'Profile',
              ),
            ],
            currentIndex: ref.watch(dashboardProvider).selectedIndex,
            selectedItemColor: Colors.deepPurple,
            onTap: data.setActiveTab,
          ),
        );
      },
    );
  }
}
