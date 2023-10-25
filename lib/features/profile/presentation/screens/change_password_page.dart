import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:synapso/core/utils/key_value_storage_service.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _currentPasswordController;
  late final String? _currentPassword;
  bool isCurrentPasswordObscure = true;
  bool isPasswordObscure = true;
  bool isRepeatPasswordObscure = true;

  late Future<void> _getCurrentPassword;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _currentPasswordController = TextEditingController();
    _getCurrentPassword = getCurrentPassword();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _currentPasswordController = TextEditingController();
    super.dispose();
  }

  Future<void> getCurrentPassword() async {
    _currentPassword = await GetIt.I.get<KeyValueStorageService>().getAuthPassword();
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
          title: const Text('Change password'),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState != null && _formKey.currentState!.validate()) {
              debugPrint('NO VALIDATION ERROR');
              context.pop();
            }
            autovalidateMode = AutovalidateMode.onUserInteraction;
            setState(() {});
          },
          child: const Text('Save'),
        ).paddingSymmetric(vertical: 16.h, horizontal: 16.w),
        body: FutureBuilder(
          future: _getCurrentPassword,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            } else {
              return Form(
                key: _formKey,
                autovalidateMode: autovalidateMode,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change password',
                        style: TextStyle(
                          color: const Color(0xFF262626),
                          fontSize: 20.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ).paddingOnly(top: 26.h, bottom: 8.h),
                      Text(
                        'The password must contain: 1 capital letter, number, special character. Minimum number of characters - 8',
                        style: TextStyle(
                          color: const Color(0xFF262626),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ).paddingOnly(bottom: 24.h),
                      const Text('Current password*'),
                      TextFormField(
                        controller: _currentPasswordController,
                        obscureText: isCurrentPasswordObscure,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (_currentPassword != value) {
                            return 'Incorrect password';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter current password',
                          errorMaxLines: 3,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isCurrentPasswordObscure = !isCurrentPasswordObscure;
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
                      const Text('Password*'),
                      TextFormField(
                        controller: _newPasswordController,
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
                          hintText: 'Enter new password',
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
                      const Text('Repeat new password*'),
                      TextFormField(
                        obscureText: isRepeatPasswordObscure,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please repeat your password';
                          } else if (value != _newPasswordController.text) {
                            return 'Passwords do not match';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Repeate new password',
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
              );
            }
          },
        ),
      ),
    );
  }
}
