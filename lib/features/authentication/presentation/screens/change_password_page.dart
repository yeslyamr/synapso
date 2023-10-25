import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final TextEditingController _passwordController;
  bool isPasswordObscure = true;
  bool isRepeatPasswordObscure = true;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
                  onPressed: () => context.pop(),
                  icon: Image.asset(
                    'assets/icons/arrow_back.png',
                    height: 30.h,
                    width: 30.h,
                  ),
          ),
          title: const Text('Recovery'),
        ),
        bottomSheet: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState != null && _formKey.currentState!.validate()) {
              debugPrint('NO VALIDATION ERROR');
            }
            autovalidateMode = AutovalidateMode.onUserInteraction;
            setState(() {});
          },
          child: const Text('Save'),
        ).paddingSymmetric(vertical: 32.h, horizontal: 16.w),
        body: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter a new password',
                style: TextStyle(
                  color: const Color(0xFF262626),
                  fontSize: 20.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ).paddingOnly(top: 26.h, bottom: 8.h),
              Text(
                'The password must be at least 8 characters long and contain 2 digits.',
                style: TextStyle(
                  color: const Color(0xFF262626),
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text('Password*'),
              TextFormField(
                controller: _passwordController,
                obscureText: isPasswordObscure,
                obscuringCharacter: '*',
                validator: (value) {
                  final numericRegExp = RegExp(r'[0-9]');
                  final specialCharRegExp =
                      RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' // <-- Notice the escaped symbols
                          "'" // <-- ' is added to the expression
                          ']');
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (!value.hasCapitalletter() ||
                      !value.contains(specialCharRegExp) ||
                      !value.contains(numericRegExp) ||
                      value.length < 8) {
                    return 'The password must contain: 1 capital letter, number, special character. Minimum number of characters - 8';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  errorMaxLines: 3,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordObscure = !isPasswordObscure;
                      });
                    },
                    iconSize: 32.h,
                    color: const Color(0xFFBDBDBF),
                    icon: const ImageIcon(
                      AssetImage('assets/icons/eye.png'),
                    ),
                  ),
                ),
              ).paddingOnly(top: 8.h, bottom: 12.h),
              const Text('Repeat password*'),
              TextFormField(
                obscureText: isRepeatPasswordObscure,
                obscuringCharacter: '*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please repeat your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isRepeatPasswordObscure = !isRepeatPasswordObscure;
                      });
                    },
                    iconSize: 32.h,
                    color: const Color(0xFFBDBDBF),
                    icon: const ImageIcon(
                      AssetImage('assets/icons/eye.png'),
                    ),
                  ),
                ),
              ).paddingOnly(top: 8.h, bottom: 12.h),
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}
