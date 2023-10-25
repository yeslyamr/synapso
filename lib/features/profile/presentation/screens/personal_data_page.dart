import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
          title: const Text('Settings'),
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
        body: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal data',
                  style: TextStyle(
                    color: const Color(0xFF262626),
                    fontSize: 20.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(top: 26.h, bottom: 8.h),
                Text(
                  'Fill in all fields with an asterisk*',
                  style: TextStyle(
                    color: const Color(0xFF262626),
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ).paddingOnly(bottom: 24.h),
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
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ),
        ),
      ),
    );
  }
}
