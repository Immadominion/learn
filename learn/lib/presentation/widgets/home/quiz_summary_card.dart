import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/data/controllers/dashboard_controller.dart';
import 'package:learn/presentation/screens/quiz.dart';

import '../../../data/controllers/projects_controller.dart';

class QuizSummaryCard extends ConsumerStatefulWidget {
  final String title;
  final bool isTop;
  final double width;
  const QuizSummaryCard(
      {super.key, required this.title, this.isTop = false, this.width = 200});

  @override
  ConsumerState<QuizSummaryCard> createState() => _QuizSummaryCardState();
}

class _QuizSummaryCardState extends ConsumerState<QuizSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("The card name is == ${widget.title.toLowerCase()}");
        Future.microtask(() => ref
            .read(projectsController)
            .toGetQuizByQuery(widget.title.toLowerCase()));
        widget.width == 200
            ? ref.read(dashboardProvider.notifier).setActiveTab(1)
            : Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const QuizScreen(),
                ),
              );
      },
      child: Container(
        width: widget.width.w,
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10.r),
          border:
              widget.isTop ? Border.all(color: Colors.blue, width: 2.0) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight:
                    widget.width == 200 ? FontWeight.bold : FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontFamily: "Mont",
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '5 questions',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(.7),
                fontFamily: "Mont",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
