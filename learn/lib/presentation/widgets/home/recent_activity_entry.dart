import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentActivityEntry extends StatelessWidget {
  final String activity;
  final String timestamp;
  const RecentActivityEntry(
      {super.key, required this.activity, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activity,
            style: TextStyle(fontSize: 16.sp, fontFamily: "Mont",),
          ),
          Text(
            timestamp,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey, fontFamily: "Mont",),
          ),
        ],
      ),
    );
  }
}