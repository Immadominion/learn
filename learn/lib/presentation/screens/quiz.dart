import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/core/constants/enum.dart';
import 'package:learn/data/controllers/projects_controller.dart';
import '../widgets/shimmer.dart';

const darkShimmerGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 28, 28, 31),
    Color.fromARGB(255, 182, 182, 187),
    Color.fromARGB(255, 28, 28, 31),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState createState() => QuizScreenState();
}

class QuizScreenState extends ConsumerState<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _hasAnswered = false;
  late MapEntry<String, String> myEntry = const MapEntry('key', 'value');

  final Map<int, String> _selectedAnswers = {};

  void _checkAnswer(String answer, entry) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = answer;
      if (answer == entry.value) {
        _score++;
      }
      debugPrint("ANs $answer");
      debugPrint(
          "CR Ans${ref.read(projectsController.notifier).question.questions?[_currentQuestionIndex].correctAnswer}");

      _hasAnswered = true;
    });
  }

  Future<void> _nextQuestion() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _currentQuestionIndex++;
      _hasAnswered = false;
    });
  }

  void _submitQuiz() {
    setState(() {
      // Calculate score
    });

    // Show results dialog or navigate to results screen
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Quiz Completed!',
          style: TextStyle(
            fontFamily: "Mont",
          ),
        ),
        content: Text(
          'Your score is $_score/${ref.read(projectsController.notifier).question.questions?.length ?? 0}.',
          style: const TextStyle(
            fontFamily: "Mont",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontFamily: "Mont",
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Future.microtask(() => ref.read(projectsController).toGetQuizByQuery());
  }

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
      body: Stack(
        children: [
          Scaffold(
            body: Consumer(
              builder: (context, ref, child) {
                final loadingState = ref.watch(projectsController).loadingState;
                final questions =
                    ref.read(projectsController.notifier).question.questions ??
                        [];

                return Shimmer(
                  linearGradient: darkShimmerGradient,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: _currentQuestionIndex < questions.length
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Progress Indicator
                                    ShimmerLoading(
                                      isLoading:
                                          loadingState == LoadingState.loading,
                                      child: LinearProgressIndicator(
                                        value: (_currentQuestionIndex + 1) /
                                            questions.length,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),

                                    // Question Text
                                    ShimmerLoading(
                                      isLoading:
                                          loadingState == LoadingState.loading,
                                      child: Text(
                                        'Question ${_currentQuestionIndex + 1}/${questions.length}',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Mont",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    ShimmerLoading(
                                      isLoading:
                                          loadingState == LoadingState.loading,
                                      child: Text(
                                        questions[_currentQuestionIndex]
                                                .question ??
                                            "Waiting for network...",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: "Mont",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),

                                    // Answer Options
                                    ShimmerLoading(
                                      isLoading:
                                          loadingState == LoadingState.loading,
                                      child: Column(
                                        children:
                                            questions[_currentQuestionIndex]
                                                    .options
                                                    ?.entries
                                                    .map((entry) {
                                                  final correctAnswer = ref
                                                      .watch(projectsController
                                                          .notifier)
                                                      .question
                                                      .questions?[
                                                          _currentQuestionIndex]
                                                      .correctAnswer;
                                                  myEntry = entry;

                                                  final color = _hasAnswered
                                                      ? (entry.key ==
                                                              correctAnswer
                                                          ? Colors.green
                                                          : Colors.red)
                                                      : null;

                                                  return RadioListTile<String>(
                                                    title: Text(
                                                      '${entry.key}: ${entry.value}',
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily: "Mont",
                                                        color: color,
                                                      ),
                                                    ),
                                                    value: entry.value,
                                                    groupValue: _selectedAnswers[
                                                        _currentQuestionIndex],
                                                    onChanged: !_hasAnswered
                                                        ? (value) {
                                                            setState(() {
                                                              _selectedAnswers[
                                                                      _currentQuestionIndex] =
                                                                  value!;
                                                            });
                                                          }
                                                        : null,
                                                  );
                                                }).toList() ??
                                                [],
                                      ),
                                    ),
                                    SizedBox(height: 20.h),

                                    // Next/Submit Button
                                    ShimmerLoading(
                                      isLoading:
                                          loadingState == LoadingState.loading,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          onPressed: _selectedAnswers
                                                  .containsKey(
                                                      _currentQuestionIndex)
                                              ? () {
                                                  if (_hasAnswered) {
                                                    if (_currentQuestionIndex ==
                                                        questions.length - 1) {
                                                      _submitQuiz();
                                                    } else {
                                                      _nextQuestion();
                                                    }
                                                  } else {
                                                    _checkAnswer(
                                                        _selectedAnswers[
                                                            _currentQuestionIndex]!,
                                                        myEntry);
                                                    Future.delayed(
                                                            const Duration(
                                                                seconds: 1))
                                                        .then((_) {
                                                      if (_currentQuestionIndex ==
                                                          questions.length -
                                                              1) {
                                                        _submitQuiz();
                                                      } else {
                                                        _nextQuestion();
                                                      }
                                                    });
                                                  }
                                                }
                                              : null,
                                          child: Text(
                                            _currentQuestionIndex ==
                                                    questions.length - 1
                                                ? 'Submit'
                                                : 'Next',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily: "Mont",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Text(
                                    'No questions available.',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: "Mont",
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      if (loadingState == LoadingState.loading)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  ),
                );
              },
            ),
          ),

          ///POWERED BY SECTION
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "---------------- Powered by ",
                  style: TextStyle(
                    fontFamily: "Mont",
                  ),
                ),
                Image.asset(
                  height: 15.sp,
                  "asset/grid.gif",
                ),
                const Text(
                  " ----------------",
                  style: TextStyle(fontFamily: "Mont"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
