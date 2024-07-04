import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/types/quiz.dart';
import '../widgets/home/quiz_summary_card.dart';

class AllQuiz extends ConsumerStatefulWidget {
  const AllQuiz({super.key});

  @override
  ConsumerState<AllQuiz> createState() => _AllQuizState();
}

class _AllQuizState extends ConsumerState<AllQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: Text(
          'Quiz',
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: "Mont",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionWidget(
                item: generalCategories,
                sectionName: "General",
              ),
              SectionWidget(
                item: technologyCategories,
                sectionName: "Technology",
              ),
              SectionWidget(
                item: investmentCategories,
                sectionName: "Investment",
              ),
              SectionWidget(
                item: otherCategories,
                sectionName: "Others",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to create List<Widget> from allParameters
List<Widget> buildQuizSummaryCards(List<String> titles, BuildContext context) {
  List<Widget> cards = [];
  for (var title in titles) {
    cards.add(
      QuizSummaryCard(
        title: title,
        width: MediaQuery.of(context).size.width / 2.3.w,
      ),
    );
  }
  return cards;
}

class SectionWidget extends StatelessWidget {
  final List<String> item;
  final String sectionName;
  const SectionWidget({
    super.key,
    required this.item,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionName,
            style: TextStyle(
                fontFamily: "Mont",
                fontSize: 17.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Wrap(
            runSpacing: 10.h,
            children: buildQuizSummaryCards(item, context),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
