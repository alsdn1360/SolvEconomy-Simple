import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solveconomy_simple/data/quiz_data.dart';
import 'package:solveconomy_simple/pages/quiz/components/quiz_option_card.dart';
import 'package:solveconomy_simple/pages/quiz/components/quiz_timer.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';
import 'package:solveconomy_simple/pages/quiz/components/quiz_next_question_button.dart';
import 'package:solveconomy_simple/pages/quiz/components/quiz_activated_check_button.dart';
import 'package:solveconomy_simple/pages/quiz/components/quiz_deactivated_check_button.dart';

class QuizPage extends StatefulWidget {
  final List<QuizData> quizData;

  const QuizPage({
    super.key,
    required this.quizData,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  String? _selectedOption;
  bool _isAnswered = false;
  bool _isCorrect = false;
  final GlobalKey<TimerBarState> _timerKey = GlobalKey<TimerBarState>();

  @override
  void initState() {
    super.initState();
    _nextQuestion();
  }

  @override
  void dispose() {
    _timerKey.currentState?.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz', style: CustomTextStyle.header1),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPaddingM,
            vertical: defaultPaddingL,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPaddingM,
                  vertical: defaultPaddingS * 2,
                ),
                decoration: BoxDecoration(
                  color: darkWhite,
                  borderRadius: BorderRadius.circular(defaultBorderRadiusL),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TimerBar(
                      key: _timerKey,
                      onTimeUp: _onTimeUp,
                      duration: 60,
                    ),
                    const Gap(defaultGapL * 2),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Q. ',
                            style: CustomTextStyle.title2.copyWith(color: primary),
                          ),
                          TextSpan(
                            text: widget.quizData[_currentIndex].question,
                            style: CustomTextStyle.title2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                      softWrap: true,
                    ),
                    const Gap(defaultGapL * 2),
                    Text(
                      'A. 한 개의 답을 선택해 주세요.',
                      style: CustomTextStyle.body1,
                    ),
                    const Gap(defaultGapM),
                    QuizOptionCard(
                      answer: widget.quizData[_currentIndex].option1,
                      selectedAnswer: _selectedOption,
                      isAnswerConfirmed: _isAnswered,
                      isEnabled: !_isAnswered,
                      onAnswerSelected: _onAnswerSelected,
                      correctAnswer: widget.quizData[_currentIndex].answer,
                    ),
                    const Gap(defaultGapM),
                    QuizOptionCard(
                      answer: widget.quizData[_currentIndex].option2,
                      selectedAnswer: _selectedOption,
                      isAnswerConfirmed: _isAnswered,
                      isEnabled: !_isAnswered,
                      onAnswerSelected: _onAnswerSelected,
                      correctAnswer: widget.quizData[_currentIndex].answer,
                    ),
                    const Gap(defaultGapM),
                    QuizOptionCard(
                      answer: widget.quizData[_currentIndex].option3,
                      selectedAnswer: _selectedOption,
                      isAnswerConfirmed: _isAnswered,
                      isEnabled: !_isAnswered,
                      onAnswerSelected: _onAnswerSelected,
                      correctAnswer: widget.quizData[_currentIndex].answer,
                    ),
                    const Gap(defaultGapM),
                    QuizOptionCard(
                      answer: widget.quizData[_currentIndex].option4,
                      selectedAnswer: _selectedOption,
                      isAnswerConfirmed: _isAnswered,
                      isEnabled: !_isAnswered,
                      onAnswerSelected: _onAnswerSelected,
                      correctAnswer: widget.quizData[_currentIndex].answer,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (_isAnswered)
                QuizNextQuestionButton(onNext: _nextQuestion)
              else if (_selectedOption == null)
                const QuizDeactivatedCheckButton()
              else
                QuizActivatedCheckButton(
                  selectedAnswer: _selectedOption!,
                  correctAnswer: widget.quizData[_currentIndex].answer,
                  onConfirm: _checkAnswer,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _randomizeQuestion() {
    setState(() {
      _currentIndex = Random().nextInt(widget.quizData.length);
    });
  }

  void _nextQuestion() {
    setState(() {
      _isAnswered = false;
      _selectedOption = null;
      _timerKey.currentState?.resetTimer();
      _randomizeQuestion();
    });
  }

  void _checkAnswer(bool isCorrect) {
    setState(() {
      _isAnswered = true;
      _isCorrect = isCorrect;
    });
  }

  void _onAnswerSelected(String? answer) {
    setState(() {
      _selectedOption = answer;
      _timerKey.currentState?.stopTimer();
    });
  }

  void _onTimeUp() {
    setState(() {
      _isAnswered = true;
    });
  }
}
