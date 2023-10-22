import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart' as router;

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeaderWidget(),
                SizedBox(height: 32.h),
                const TextField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        const AssetImage('assets/icons/eye.png'),
                        color: const Color(0xFFBDBDBF),
                        size: 32.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
                SizedBox(height: 12.h),
                OutlinedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context.push('/sign_up');
                  },
                  child: const Text('Registration'),
                ),
                SizedBox(height: 12.h),
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
        SizedBox(height: 21.h),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Synapso',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF145FF6),
              fontSize: 38.sp,
              fontFamily: 'Hyundai Sans Head Office',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 61.h),
        const Text(
          'Login',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        const Text(
          'To take the test, log in to your account',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
