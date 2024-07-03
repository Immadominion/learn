import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:learn/data/controllers/dashboard_controller.dart';

import '../widgets/home/leaderboard_section.dart';
import '../widgets/home/quick_action_button.dart';
import '../widgets/home/quiz_summary_card.dart';
import '../widgets/home/recent_activity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  late bool _isTop;

  @override
  void initState() {
    _isTop = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: Text(
          'Learn',
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Message
                  Text(
                    'Welcome back, User!',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Mont",
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Quiz Summary Cards
                  Text(
                    'Quizzes',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Mont",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 150.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        QuizSummaryCard(
                          title: 'Derivatives',
                          isTop: ref.watch(dashboardProvider).isTop,
                        ),
                        QuizSummaryCard(
                          title: 'DAO',
                          isTop: _isTop,
                        ),
                        QuizSummaryCard(
                          title: 'Bitcoin',
                          isTop: _isTop,
                        ),
                        QuizSummaryCard(
                          title: 'Solana',
                          isTop: _isTop,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Leaderboard
                  Text(
                    'Leaderboard',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Mont",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const LeaderboardSection(),
                  SizedBox(height: 20.h),

                  // Recent Activity
                  Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Mont",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const RecentActivitySection(),
                  SizedBox(height: 20.h),

                  // Navigation Shortcuts
                  Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Mont",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickActionButton(
                        icon: Iconsax.play_copy,
                        label: 'Start Quiz',
                        onTap: () {
                          // Navigate to quiz screen
                          ref.read(dashboardProvider.notifier).setActiveTab(1);
                        },
                      ),
                      QuickActionButton(
                        icon: Iconsax.user_edit_copy,
                        label: 'Profile',
                        onTap: () {
                          // Navigate to profile screen
                          ref.read(dashboardProvider.notifier).setActiveTab(2);
                        },
                      ),
                      QuickActionButton(
                        icon: Icons.explore_outlined,
                        label: 'Explore',
                        onTap: () {
                          // Navigate to explore screen
                          _scrollController.animateTo(
                            0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );

                          ref
                              .read(dashboardProvider.notifier)
                              .setAsActive(true);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
