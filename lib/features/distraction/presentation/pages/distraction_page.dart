import 'dart:async';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DistractionPage extends StatefulWidget {
  const DistractionPage({
    super.key,
    required this.distractionType,
    this.distractionText,
    required this.model,
    required this.distractionDuration,
    required this.experimentType,
  });

  final String distractionType;
  final String? distractionText;
  final int distractionDuration;
  final String experimentType;
  final dynamic model;

  @override
  State<DistractionPage> createState() => _DistractionPageState();
}

class _DistractionPageState extends State<DistractionPage> {
  late _ArithmeticQuestion question;
  Timer? _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          if (widget.experimentType == 'recall') {
            context.push('/recall_task_recall', extra: widget.model);
          } else {
            context.push('/recognition_task_recall', extra: widget.model);
          }
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _start = widget.distractionDuration ~/ 1000;
    question = generateArithmeticQuestion();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.distractionType == 'text') {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text(
                'Time Left: $_start',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                widget.distractionText!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                ),
              ).toCenter().expanded(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Time Left: $_start',
            style: const TextStyle(fontSize: 24),
          ).expanded(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            width: double.infinity,
            height: 100.h,
            alignment: Alignment.center,
            child: Text(
              question.question,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
          ).paddingAll(8),
          for (int option in question.options)
            ElevatedButton(
              onPressed: () {
                question = generateArithmeticQuestion();
                setState(() {});
              },
              child: Text(
                option.toString(),
              ),
            ).paddingSymmetric(horizontal: 32.w, vertical: 8.h),
        ],
      ),
    );
  }
}

class _ArithmeticQuestion {
  String question;
  List<int> options;
  int answer;

  _ArithmeticQuestion(this.question, this.options, this.answer);
}

// ignore: library_private_types_in_public_api
_ArithmeticQuestion generateArithmeticQuestion() {
  final rand = Random();
  int num1 = rand.nextInt(100); // Generate a random number between 0 and 99
  int num2 = rand.nextInt(100); // Generate a second random number between 0 and 99
  final operations = ['+', '-', '*', '/'];
  final operation = operations[rand.nextInt(operations.length)]; // Randomly select an operation

  int answer;
  String question;

  // Adjust for division to avoid division by zero and ensure integer result
  if (operation == '/') {
    num1 = num2 * (rand.nextInt(9) + 1); // Adjust num1 to ensure the division result is an integer
  }

  switch (operation) {
    case '+':
      answer = num1 + num2;
      question = '$num1 + $num2';
      break;
    case '-':
      answer = num1 - num2;
      question = '$num1 - $num2';
      break;
    case '*':
      answer = num1 * num2;
      question = '$num1 * $num2';
      break;
    case '/':
      answer = num1 ~/ num2;
      question = '$num1 / $num2';
      break;
    default:
      throw 'Unsupported operation';
  }

  // Generate options with more variation
  Set<int> options = {answer};
  while (options.length < 4) {
    int variation = rand.nextInt(3) + 1; // Generate variation to ensure options are not too close to each other
    int option = (rand.nextBool() ? answer + variation : answer - variation);
    options.add(option);
  }

  return _ArithmeticQuestion(question, options.toList()..shuffle(), answer);
}
