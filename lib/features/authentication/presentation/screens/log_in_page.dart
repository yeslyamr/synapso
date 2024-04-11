import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:synapso/features/authentication/stores/authentication_store.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  bool isPasswordObscure = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
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
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: _formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginHeaderWidget(),
                    TextFormField(
                      controller: _emailController,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: 'Email'),
                    ).paddingOnly(bottom: 12.h, top: 32.h),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: isPasswordObscure,
                      obscuringCharacter: '*',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        errorMaxLines: 3,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                isPasswordObscure = !isPasswordObscure;
                              },
                            );
                          },
                          iconSize: 32.h,
                          color: const Color(0xFFBDBDBF),
                          icon: const ImageIcon(
                            AssetImage('assets/icons/eye.png'),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                          context.loaderOverlay.show();
                          final userModel = await GetIt.I.get<AuthenticationStore>().logIn(
                                email: _emailController.text.toLowerCase(),
                                password: _passwordController.text,
                              );
                          if (context.mounted) context.loaderOverlay.hide();

                          if (userModel != null && context.mounted) {
                            context.go('/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Incorrect email or password'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      },
                      child: const Text('Login'),
                    ).paddingOnly(bottom: 12.h, top: 32.h),
                    TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context.push('/recover_password');
                      },
                      child: const Text('Forgot password?'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Synapso',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF145FF6),
            fontSize: 38.sp,
            fontFamily: 'Hyundai Sans Head Office',
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: 61.h, top: 21.h).toCenter(),
        Text(
          'Login',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(bottom: 8.h),
        Text(
          'To take the test, log in to your account',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
