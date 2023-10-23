import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome_background.png',
            fit: BoxFit.fitWidth,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
              width: double.infinity,
              height: 676.h,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Synapso',
                    style: TextStyle(
                      color: const Color(0xFF145FF6),
                      fontSize: 66.sp,
                      fontFamily: 'Hyundai Sans Head Office',
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingOnly(top: 163.h, bottom: 36.h),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/login');
                    },
                    child: const Text('Log In'),
                  ).paddingOnly(bottom: 12.h),
                  OutlinedButton(
                    onPressed: () {
                      //TODO: implement on tap
                    },
                    child: const Text('About app'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
