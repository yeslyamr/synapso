import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart' as router;

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: make core component for app bar
      appBar: AppBar(
        leading: router.GoRouterHelper(context).canPop()
            ? IconButton(
                onPressed: () => router.GoRouterHelper(context).pop(),
                icon: Image.asset(
                  'assets/icons/arrow_back.png',
                  height: 30.h,
                  width: 30.h,
                ),
              )
            : null,
        title: const Text('Recovery'),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (_emailFormKey.currentState != null && _emailFormKey.currentState!.validate()) {
            debugPrint('NO VALIDATION ERROR');
            // TODO: implement on send code
          }
        },
        child: const Text('Send code'),
      ).paddingSymmetric(vertical: 32.h, horizontal: 16.w),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot your password?',
            style: TextStyle(
              color: const Color(0xFF262626),
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ).paddingOnly(top: 26.h, bottom: 8.h),
          Text(
            'Enter your Email and we will send you an email with a password reset code',
            style: TextStyle(
              color: const Color(0xFF262626),
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ).paddingOnly(bottom: 32.h),
          Form(
            key: _emailFormKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              decoration: const InputDecoration(hintText: 'Email'),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
