import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../data/controllers/theme_notifier.dart';
import '../widgets/profile/profile_stat.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: "Mont",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Mont",
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                        fontFamily: "Mont",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // User Statistics
              Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Mont",
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Column(
                  children: [
                    ProfileStat(title: 'Total Quizzes Taken', value: '15'),
                    ProfileStat(title: 'Total Score', value: '1500'),
                    ProfileStat(title: 'Average Score', value: '100'),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // Settings Options
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Mont",
                ),
              ),
              SizedBox(height: 10.h),
              ListTile(
                leading: const Icon(Iconsax.pen_add_copy),
                title: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Mont",
                  ),
                ),
                onTap: () {
                  // Navigate to edit profile screen
                },
              ),
              ListTile(
                leading: const Icon(Iconsax.moon_copy),
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Mont",
                  ),
                ),
                trailing: Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  activeTrackColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Theme.of(context).colorScheme.onPrimary,
                  splashRadius: 70.0,
                  value: isDarkMode,
                  onChanged: (value) {
                    ref.read(themeProvider.notifier).setDarkMode(value);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Iconsax.logout_1_copy),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Mont",
                  ),
                ),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
