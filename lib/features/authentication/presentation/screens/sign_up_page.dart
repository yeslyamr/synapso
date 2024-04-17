import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:synapso/features/authentication/presentation/screens/survey_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool agreeTerms = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _emailController;
  late final PhoneController _phoneNumberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _dateOfBirthController;

  bool isPasswordObscure = true;
  bool isRepeatPasswordObscure = true;
  String gender = 'Male';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = PhoneController(
      const PhoneNumber(isoCode: IsoCode.KZ, nsn: ''),
    );
    _passwordController = TextEditingController();
    _dateOfBirthController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: LoaderOverlay(
        overlayOpacity: 0.5,
        overlayColor: Colors.grey.shade200.withOpacity(0.5),
        overlayWidget: const CircularProgressIndicator.adaptive(),
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
            title: const Text('Registration'),
          ),
          body: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
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
                    controller: _surnameController,
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
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ).paddingOnly(top: 8.h, bottom: 12.h),
                  const Text('Gender'),
                  SizedBox(
                    height: 60.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text('Male'),
                            leading: Radio<String>(
                              value: 'Male',
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  if (value != null) gender = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Female'),
                            leading: Radio<String>(
                              value: 'Female',
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  if (value != null) gender = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('Date of birth*'),
                  TextFormField(
                    enabled: true,
                    readOnly: true,
                    controller: _dateOfBirthController,
                    onTap: () async {
                      final dateOfBirth = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 365 * 125),
                        ),
                        lastDate: DateTime.now(),
                      );
                      if (dateOfBirth != null)
                        _dateOfBirthController.text = DateFormat('dd.MM.yyyy').format(dateOfBirth);
                    },
                    validator: (_) {
                      if (_dateOfBirthController.text.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Date of birth',
                    ),
                  ).paddingOnly(top: 8.h, bottom: 12.h),
                  const Text('Phone Number*'),
                  PhoneFormField(
                    controller: _phoneNumberController,
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
                    controller: _emailController,
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
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate() &&
                          agreeTerms &&
                          _phoneNumberController.value != null) {
                        // context.loaderOverlay.show();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoaderOverlay(
                              overlayOpacity: 0.5,
                              overlayColor: Colors.grey.shade200.withOpacity(0.5),
                              overlayWidget: const CircularProgressIndicator.adaptive(),
                              child: SurveyPage(
                                name: _nameController.text,
                                surname: _surnameController.text,
                                phoneNumber:
                                    '+${_phoneNumberController.value!.countryCode}${_phoneNumberController.value!.nsn}',
                                gender: gender,
                                dateOfBirth: _dateOfBirthController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            ),
                          ),
                        );
                        // final userModel = await GetIt.I<AuthenticationStore>().signUp(
                        // name: _nameController.text,
                        // surname: _surnameController.text,
                        // mobileNumber:
                        //     '+${_phoneNumberController.value!.countryCode}${_phoneNumberController.value!.nsn}',
                        // gender: gender,
                        // dateOfBirth: _dateOfBirthController.text,
                        // email: _emailController.text,
                        // password: _passwordController.text,
                        // );
                        // if (context.mounted) context.loaderOverlay.hide();
                        // if (userModel != null && context.mounted) {
                        //   context.pop();
                        //   return;
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Sign up failed'),
                        //       backgroundColor: Colors.red,
                        //     ),
                        //   );
                        // }
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
      ),
    );
  }
}
