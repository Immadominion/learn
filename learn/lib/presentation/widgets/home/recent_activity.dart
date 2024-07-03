import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'recent_activity_entry.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecentActivityEntry(
              activity: 'Completed Crypto Basics Quiz',
              timestamp: '2 hours ago'),
          RecentActivityEntry(
              activity: 'Scored 85% on Solana Ecosystem Quiz',
              timestamp: '1 day ago'),
        ],
      ),
    );
  }
}
