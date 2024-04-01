import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:synapso/features/authentication/stores/authentication_store.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage(
      {super.key,
      required this.name,
      required this.surname,
      required this.email,
      required this.password,
      required this.gender,
      required this.dateOfBirth,
      required this.phoneNumber});

  final String name;
  final String surname;
  final String email;
  final String password;
  final String gender;
  final String dateOfBirth;
  final String phoneNumber;

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final ValueNotifier<int> _firstQuestion = ValueNotifier<int>(0);
  final ValueNotifier<int> _secondQuestion = ValueNotifier<int>(0);
  final ValueNotifier<int> _thirdQuestion = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayOpacity: 0.5,
      overlayColor: Colors.grey.shade200.withOpacity(0.5),
      overlayWidget: const CircularProgressIndicator.adaptive(),
      child: Scaffold(
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
          title: const Text(''),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySurveyWidget(
                question: 'How do you evaluate your memory in academic performance?',
                lowerBound: '1',
                upperBound: '5',
                groupValue: _firstQuestion,
              ).paddingOnly(bottom: 24.h),
              MySurveyWidget(
                question: 'How do you evaluate your memory in remembering events of your life?',
                lowerBound: '1',
                upperBound: '5',
                groupValue: _secondQuestion,
              ).paddingOnly(bottom: 24.h),
              MySurveyWidget(
                question:
                    'How do you evaluate your memory in carrying out tasks which require you to temporarily remember information or results?',
                lowerBound: '1',
                upperBound: '5',
                groupValue: _thirdQuestion,
              ).paddingOnly(bottom: 24.h),
              ElevatedButton(
                onPressed: () async {
                  context.loaderOverlay.show();
                  final userModel = await GetIt.I<AuthenticationStore>().signUp(
                    name: widget.name,
                    surname: widget.surname,
                    mobileNumber: widget.phoneNumber,
                    gender: widget.gender,
                    dateOfBirth: widget.dateOfBirth,
                    email: widget.email,
                    password: widget.password,
                  );
                  if (context.mounted) context.loaderOverlay.hide();
                  if (userModel != null && context.mounted) {
                    context.pop();
                    return;
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Sign up failed'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                  if (context.mounted) context.pop();
                  if (context.mounted) context.pop();
                },
                child: const Text('Create account'),
              ).paddingSymmetric(vertical: 16.h),
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}

class MySurveyWidget extends StatelessWidget {
  const MySurveyWidget(
      {super.key,
      required this.question,
      required this.lowerBound,
      required this.upperBound,
      required this.groupValue});

  final String question;
  final String? lowerBound;
  final String? upperBound;
  final ValueNotifier<int> groupValue; // = ValueNotifier<int?>(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: groupValue,
        builder: (context, value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(question, style: TextStyle(fontSize: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Radio(
                    value: 1,
                    groupValue: value,
                    onChanged: (int? newValue) {
                      groupValue.value = newValue!;
                    },
                  ),
                  Radio(
                    value: 2,
                    groupValue: value,
                    onChanged: (int? newValue) {
                      groupValue.value = newValue!;
                    },
                  ),
                  Radio(
                    value: 3,
                    groupValue: value,
                    onChanged: (int? newValue) {
                      groupValue.value = newValue!;
                    },
                  ),
                  Radio(
                    value: 4,
                    groupValue: value,
                    onChanged: (int? newValue) {
                      groupValue.value = newValue!;
                    },
                  ),
                  Radio(
                    value: 5,
                    groupValue: value,
                    onChanged: (int? newValue) {
                      groupValue.value = newValue!;
                    },
                  ),
                ],
              ),
              if (lowerBound != null && upperBound != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lowerBound!),
                    Text(upperBound!),
                  ],
                )
            ],
          );
        });
  }
}
