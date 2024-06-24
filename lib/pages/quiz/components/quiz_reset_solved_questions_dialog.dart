import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solveconomy_simple/themes/custom_color.dart';
import 'package:solveconomy_simple/themes/custom_font.dart';

class QuizResetSolvedQuestionsDialog extends StatelessWidget {
  final VoidCallback onReset;

  const QuizResetSolvedQuestionsDialog({
    super.key,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      elevation: 0,
      title: Center(child: Text('풀었던 문제 초기화', style: CustomTextStyle.body1)),
      content: Text('풀었던 문제들을 초기화하시겠습니까?', style: CustomTextStyle.body3),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('취소', style: CustomTextStyle.body3),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onReset();
            Fluttertoast.showToast(
              msg: '초기화되었습니다.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: primary,
              textColor: white,
              fontSize: 14,
            );
          },
          child: Text('확인', style: CustomTextStyle.body3.copyWith(color: primary)),
        ),
      ],
    );
  }
}
