import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderboardEntry extends StatelessWidget {
  final int rank;
  final String username;
  final int score;
  const LeaderboardEntry(
      {super.key,
      required this.rank,
      required this.username,
      required this.score});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$rank. $username',
            style: TextStyle(fontSize: 16.sp, fontFamily: "Mont",),
          ),
          Text(
            '$score pts',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: "Mont",),
          ),
        ],
      ),
    );
  }
}