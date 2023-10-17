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
                  SizedBox(height: 163.h),
                  Text(
                    'Synapso',
                    style: TextStyle(
                      color: const Color(0xFF145FF6),
                      fontSize: 66.sp,
                      fontFamily: 'Hyundai Sans Head Office',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'About app',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
