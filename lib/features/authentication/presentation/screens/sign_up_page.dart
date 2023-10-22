import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart' as router;
import 'package:phone_form_field/phone_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool agreeTerms = false;
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
          title: const Text('Registration'),
        ),
        body: Form(
          autovalidateMode: autovalidateMode,
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fill in all fields with an asterisk*',
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ).paddingSymmetric(vertical: 24.h),
                const Text('Surname*'),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Surname'),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your surname';
                    }
                    return null;
                  },
                ).paddingOnly(top: 8.h, bottom: 12.h),
                const Text('Name*'),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Name'),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ).paddingOnly(top: 8.h, bottom: 12.h),
                const Text('Phone Number*'),
                PhoneFormField(
                  shouldFormat: true,
                  defaultCountry: IsoCode.KZ,
                  countryCodeStyle: const TextStyle(
                    color: Color(0xFF9D9D9D),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    height: 1,
                    fontWeight: FontWeight.w400,
                  ),
                  validator: PhoneValidator.valid(allowEmpty: false),
                  isCountryChipPersistent: true,
                  isCountrySelectionEnabled: true,
                  countrySelectorNavigator: const CountrySelectorNavigator.modalBottomSheet(),
                  showFlagInInput: false,
                  autovalidateMode: autovalidateMode,
                  flagSize: 28,
                  enabled: true,
                  autofocus: false,
                ).paddingOnly(top: 8.h, bottom: 12.h),
                const Text('Email*'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ).paddingOnly(top: 8.h, bottom: 12.h),
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
                Row(
                  children: [
                    Checkbox(
                      value: agreeTerms,
                      onChanged: (_) {
                        setState(() {
                          agreeTerms = !agreeTerms;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'When using the application, you agree to ',
                        style: TextStyle(
                          color: const Color(0xFF2A2A2A),
                          fontSize: 14.sp,
                          fontFamily: 'Hyundai Sans Head Office',
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'terms of use',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.sp,
                              fontFamily: 'Hyundai Sans Head Office',
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO: implement on tap
                              },
                          ),
                        ],
                      ),
                    ).expanded()
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                      debugPrint('NO VALIDATION ERROR');
                      //TODO: implement on tap
                    } else if (!agreeTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please agree to the terms of use'),
                        ),
                      );
                    }
                    autovalidateMode = AutovalidateMode.onUserInteraction;
                    setState(() {});
                  },
                  child: const Text('Create account'),
                ).paddingSymmetric(vertical: 16.h),
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ),
        ),
      ),
    );
  }
}
