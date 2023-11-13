import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/core/utils/key_value_storage_service.dart';
import 'package:synapso/features/authentication/models/user_model.dart';
import 'package:synapso/features/authentication/stores/authentication_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserModel? userModel = GetIt.I<KeyValueStorageService>().getUserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: make core component for app bar
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: get real user data
          Text(
            '${userModel?.name ?? ''} ${userModel?.surname ?? ''}',
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ).paddingOnly(top: 24.h, bottom: 8.h).toCenter(),
          //TODO: get real user data
          Text(
            userModel?.email ?? '',
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ).paddingOnly(bottom: 32.h).toCenter(),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ).paddingOnly(bottom: 24.h),
          ListTile(
            onTap: () => context.pushNamed('personal_data'),
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Personal data',
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ImageIcon(
              const AssetImage('assets/icons/arrow_forward.png'),
              color: const Color(0xFF9D9D9D),
              size: 32.h,
            ),
          ),
          ListTile(
            onTap: () => context.pushNamed('change_password'),
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Change password',
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ImageIcon(
              const AssetImage('assets/icons/arrow_forward.png'),
              color: const Color(0xFF9D9D9D),
              size: 32.h,
            ),
          ).paddingOnly(bottom: 12.h),
          TextButton(
            onPressed: () async {
              await GetIt.I<AuthenticationStore>().logOut();
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Log out',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
