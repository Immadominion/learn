import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'leaderboard_entry.dart';

class LeaderboardSection extends StatelessWidget {
  const LeaderboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeaderboardEntry(rank: 1, username: 'Alice', score: 120),
          LeaderboardEntry(rank: 2, username: 'Bob', score: 110),
          LeaderboardEntry(rank: 3, username: 'Charlie', score: 105),
        ],
      ),
    );
  }
}
