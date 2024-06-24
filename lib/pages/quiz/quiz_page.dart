import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solveconomy_simple/data/quiz_data.dart';
import 'package:solveconomy_simple/pages/quiz/components/quiz_option_card.dart';
import 'package:solveconomy_simple/pages/quiz/components/quiz_reset_solved_questions_dialog.dart';
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
  bool _isPrevious = false;
  bool _isCorrect = false;
  final GlobalKey<TimerBarState> _timerKey = GlobalKey<TimerBarState>();
  late SharedPreferences _prefs;
  List<String> _solvedQuestions = [];

  @override
  void initState() {
    super.initState();
    _loadSolvedQuestions();
    _nextQuestion();
  }

  @override
  void dispose() {
    _timerKey.currentState?.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSolvedQuestions = _solvedQuestions.contains(widget.quizData[_currentIndex].question);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz', style: CustomTextStyle.header1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: TimerBar(
            key: _timerKey,
            onTimeUp: _onTimeUp,
            duration: 60,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return QuizResetSolvedQuestionsDialog(onReset: _resetSolvedQuestions);
                },
              );
            },
            icon: const Icon(Icons.cached_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: defaultPaddingM,
            right: defaultPaddingM,
            top: defaultPaddingL / 2,
            bottom: defaultPaddingM * 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isSolvedQuestions && _isPrevious)
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '이전에 풀었던 문제예요!',
                      style: CustomTextStyle.body3.copyWith(color: primary),
                    ),
                  ),
                )
              else
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '이전에 풀었던 문제예요!',
                      style: CustomTextStyle.body3.copyWith(color: transparent),
                    ),
                  ),
                ),
              const Gap(defaultGapM),
              Expanded(
                flex: 2,
                child: RichText(
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
              ),
              Text(
                'A. 한 개의 답을 선택해 주세요.',
                style: CustomTextStyle.body1,
              ),
              const Gap(defaultGapL),
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

  Future<void> _loadSolvedQuestions() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _solvedQuestions = _prefs.getStringList('solvedQuestions') ?? [];
    });
  }

  Future<void> _saveSolvedQuestion(String question) async {
    if (!_solvedQuestions.contains(question)) {
      _solvedQuestions.add(question);
      await _prefs.setStringList('solvedQuestions', _solvedQuestions);
    }
  }

  Future<void> _resetSolvedQuestions() async {
    await _prefs.remove('solvedQuestions');
    setState(() {
      _solvedQuestions = [];
      _isPrevious = false;
    });
  }

  void _randomizeQuestion() {
    setState(() {
      _currentIndex = 10;
    });
  }

  void _nextQuestion() {
    setState(() {
      _isAnswered = false;
      _selectedOption = null;
      _timerKey.currentState?.resetTimer();
      _randomizeQuestion();
      _isPrevious = _solvedQuestions.contains(widget.quizData[_currentIndex].question);
    });
  }

  void _checkAnswer(bool isCorrect) {
    setState(() {
      _isAnswered = true;
      _isCorrect = isCorrect;
      _saveSolvedQuestion(widget.quizData[_currentIndex].question);
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
