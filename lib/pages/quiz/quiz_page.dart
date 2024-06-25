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
  bool _isTimeUp = false;
  final GlobalKey<TimerBarState> _timerKey = GlobalKey<TimerBarState>();
  late SharedPreferences _prefs;
  List<String> _solvedQuestions = [];

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
            bottom: defaultPaddingM,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '푼 문제 수: ${_solvedQuestions.length}문제',
                      style: CustomTextStyle.body3.copyWith(color: primary),
                    ),
                  ),
                  if (_isPrevious)
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '이전에 풀었던 문제예요!',
                            style: CustomTextStyle.body3.copyWith(color: primary),
                          ),
                        ),
                      ),
                    )
                ],
              ),
              const Gap(defaultGapM),
              Expanded(
                flex: 2,
                child: Text(
                  'Q. ${widget.quizData[_currentIndex].question}',
                  style: CustomTextStyle.title2,
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
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _isTimeUp
                        ? '시간 초과입니다!'
                        : (_isCorrect ? '정답입니다!' : '틀렸습니다!'),
                    style: CustomTextStyle.body1.copyWith(
                        color: _isTimeUp
                            ? black
                            : (_isCorrect ? Colors.green : Colors.red)),
                  ),
                )
              else
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '공간 맞추기',
                    style: CustomTextStyle.body1.copyWith(color: Colors.transparent),
                  ),
                ),
              const Gap(defaultGapL),
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

  Future<void> _saveSolvedQuestion(String answer) async {
    if (!_solvedQuestions.contains(answer)) {
      _solvedQuestions.add(answer);
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
      _currentIndex = Random().nextInt(widget.quizData.length);
    });
  }

  Future<void> _nextQuestion() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _solvedQuestions = _prefs.getStringList('solvedQuestions') ?? [];
      _isAnswered = false;
      _isTimeUp = false;
      _selectedOption = null;
      _timerKey.currentState?.resetTimer();
      _randomizeQuestion();
      _isPrevious = _solvedQuestions.contains(widget.quizData[_currentIndex].answer);
    });
  }

  void _checkAnswer(bool isCorrect) {
    setState(() {
      _isAnswered = true;
      _isCorrect = isCorrect;
      _saveSolvedQuestion(widget.quizData[_currentIndex].answer);
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
      _isTimeUp = true;
      _isAnswered = true;
      _saveSolvedQuestion(widget.quizData[_currentIndex].answer);
    });
  }
}