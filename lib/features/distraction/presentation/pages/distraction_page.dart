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
    question = generateArithmeticQuestion(Difficulty.easy);
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

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time Left: $_start',
              style: const TextStyle(fontSize: 24),
            ),
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
            for (final option in question.options)
              ElevatedButton(
                onPressed: () {
                  if (option == question.answer) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Correct!'),
                        backgroundColor: Colors.green,
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incorrect!'),
                        backgroundColor: Colors.red,
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  }
                  question = generateArithmeticQuestion(Difficulty.easy);
                  setState(() {});
                },
                child: Text(option.toString()),
              ).paddingSymmetric(horizontal: 32.w, vertical: 8.h),
          ],
        ),
      ),
    );
  }
}

enum Difficulty { easy, medium, hard }

class _ArithmeticQuestion {
  String question;
  List<int> options;
  int answer;

  _ArithmeticQuestion(this.question, this.options, this.answer);
}

// ignore: library_private_types_in_public_api
_ArithmeticQuestion generateArithmeticQuestion(Difficulty difficulty) {
  final rand = Random();
  int num1, num2, result;
  String operation;
  List<String> operations;

  switch (difficulty) {
    case Difficulty.easy:
      num1 = rand.nextInt(9) + 1; // 1-9
      num2 = rand.nextInt(9) + 1; // 1-9
      operations = ['+', '-', '*', '/'];
      break;
    case Difficulty.medium:
      num1 = rand.nextInt(90) + 10; // 10-99
      num2 = rand.nextInt(90) + 10; // 10-99
      operations = ['+', '-', '*', '/'];
      // Adjusting for multiplication and division to keep numbers smaller
      if (rand.nextBool()) {
        num1 = rand.nextInt(16) + 10; // 10-25
        num2 = rand.nextInt(16) + 10; // 10-25
      }
      break;
    case Difficulty.hard:
      num1 = rand.nextInt(175) + 1; // 1-175
      num2 = rand.nextInt(175) + 1; // 1-175
      operations = ['+', '-', '*', '/'];
      break;
  }

  // Randomly selecting an arithmetic operation
  operation = operations[rand.nextInt(operations.length)];

  // Calculating the result based on the operation
  switch (operation) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      // Ensuring division results in a whole number
      num2 = num2 != 0 ? num2 : 1; // Prevent division by zero
      num1 = result = num1 - num1 % num2; // Adjust num1 to be divisible by num2
      result = num1 ~/ num2;
      break;
    default:
      return _ArithmeticQuestion('Error', [], 0);
  }

  // Generating options
  Set<int> optionsSet = {result};
  while (optionsSet.length < 4) {
    int option = result + rand.nextInt(7) - 3; // Generating options around the correct answer
    optionsSet.add(option);
  }
  List<int> options = optionsSet.map((e) => e).toList();
  options.shuffle(); // Shuffle the options to randomize their positions

  String question = "What is $num1 $operation $num2?";

  return _ArithmeticQuestion(question, options, result);
}
