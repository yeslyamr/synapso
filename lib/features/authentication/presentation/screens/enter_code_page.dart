import 'dart:async';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({Key? key}) : super(key: key);

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  late TextEditingController _pinputController;
  late Timer _timer;
  int _remainingTime = 0;

  @override
  void initState() {
    startCountdownTimer();
    _pinputController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pinputController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startCountdownTimer() {
    _remainingTime = 90;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            _timer.cancel();
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        // TODO: make core component for app bar
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (context.canPop()) context.pop();
            },
                  icon: Image.asset(
                    'assets/icons/arrow_back.png',
                    height: 30.h,
                    width: 30.h,
                  ),
          ),
          title: const Text('Recovery'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Entering the code',
              style: TextStyle(
                color: const Color(0xFF262626),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ).paddingOnly(top: 26.h, bottom: 8.h),
            Text(
              'A 6-digit password recovery code has been sent by email.',
              style: TextStyle(
                color: const Color(0xFF262626),
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            //TODO: check autofilling when there is backend
            Pinput(
              length: 6,
              onCompleted: (value) {
                debugPrint('Completed: $value');
                //TODO:
                // send code (async) -> loading widget
                // if success -> go to change password page
                context.push('/change_password');
                // if fail -> show error
              },
              controller: _pinputController,
              errorPinTheme: PinTheme(
                width: 48.h,
                height: 48.h,
                textStyle: TextStyle(
                  color: const Color(0xFF262626),
                  fontSize: 36.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.error, width: 1),
                  color: const Color(0xFFF3F3F7),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              defaultPinTheme: PinTheme(
                width: 48.h,
                height: 48.h,
                textStyle: TextStyle(
                  color: const Color(0xFF262626),
                  fontSize: 36.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F7),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 48.h,
                height: 48.h,
                textStyle: TextStyle(
                  color: const Color(0xFF262626),
                  fontSize: 36.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F7),
                  border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ).paddingSymmetric(vertical: 32.h),
            Builder(
              builder: (context) {
                if (_remainingTime == 0) {
                  return OutlinedButton(
                    child: const Text('Resend code'),
                    onPressed: () {
                      startCountdownTimer();
                      setState(() {});
                    },
                  );
                } else {
                  final duration = Duration(seconds: _remainingTime);
                  String remainingTimeString =
                      '${duration.inMinutes}:${(duration.inSeconds - duration.inMinutes * 60).toString().padLeft(2, '0')}';

                  return Text(
                    'Request code again in $remainingTimeString',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF9D9D9D),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ).paddingSymmetric(vertical: 16.h).toCenter();
                }
              },
            )
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }
}
