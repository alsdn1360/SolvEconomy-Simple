import 'dart:async';
import 'package:flutter/material.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_decoration.dart';

class TimerBar extends StatefulWidget {
  final VoidCallback onTimeUp;
  final int duration;

  const TimerBar({
    super.key,
    required this.onTimeUp,
    required this.duration,
  });

  @override
  State<TimerBar> createState() => TimerBarState();
}

class TimerBarState extends State<TimerBar> {
  late Timer _timer;
  double _progress = 1.0;
  int _millisecondsPassed = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 1.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultBorderRadiusM),
        child: LinearProgressIndicator(
          value: _progress,
          backgroundColor: transparent,
          color: primary,
        ),
      ),
    );
  }

  void _startTimer() {
    const int updateInterval = 50;
    _timer = Timer.periodic(const Duration(milliseconds: updateInterval), (timer) {
      if (!mounted) return;
      setState(() {
        _millisecondsPassed += updateInterval;
        _progress = 1 - (_millisecondsPassed / (widget.duration * 1000));

        if (_millisecondsPassed >= widget.duration * 1000) {
          _timer.cancel();
          widget.onTimeUp();
        }
      });
    });
  }

  void stopTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  void resetTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    _progress = 1.0;
    _millisecondsPassed = 0;
    _startTimer();
  }
}
