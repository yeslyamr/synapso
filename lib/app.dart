import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synapso/core/navigation/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 796),
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: goRouter,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            splashFactory: NoSplash.splashFactory,
            fontFamily: GoogleFonts.inter().fontFamily,
            primaryTextTheme: const TextTheme(
              labelLarge: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              titleMedium: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            textTheme: const TextTheme(
              labelLarge: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              titleMedium: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0xFFF3F3F7),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              isDense: true,
              errorStyle: const TextStyle(
                color: Color(0xFFFF3B30),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              hintStyle: const TextStyle(
                color: Color(0xFF9D9D9D),
                fontSize: 16,
                fontFamily: 'Inter',
                height: 1,
                fontWeight: FontWeight.w400,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF0052DE),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFFF3B30),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFFF3B30),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: const TextStyle(
                  color: Color(0xFF145FF6),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                backgroundColor: Colors.transparent,
                foregroundColor: const Color(0xFF0052DE),
              ),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              elevation: 0,
              modalElevation: 0,
              backgroundColor: Color(0xFFFCFCFC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.all(12.h),
                textStyle: TextStyle(
                  color: const Color(0xFF145FF6),
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                backgroundColor: Colors.transparent,
                side: const BorderSide(
                  color: Color(0xFF0052DE),
                  width: 1,
                ),
                foregroundColor: const Color(0xFF0052DE),
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: const Color(0xFFFCFCFC),
              foregroundColor: const Color(0xFF262626),
              iconTheme: const IconThemeData(color: Color(0xFF262626)),
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: const Color(0xFF262626),
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w400,
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color(0xFFFCFCFC),
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStateProperty.all(const Color(0xFF0052DE)),
              checkColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
              overlayColor: MaterialStateProperty.all(const Color(0xFF0052DE)),
              splashRadius: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF0052DE),
                foregroundColor: const Color(0xFFFFFFFF),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                disabledBackgroundColor: const Color(0xFF0052DE),
                padding: EdgeInsets.all(12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
          ),
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF0052DE),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF0052DE),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFFF3B30),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFCFC),
  onBackground: Color(0xFF262626),
  surface: Color(0xFFF3F3F8),
  onSurface: Color(0xFF262626),
  shadow: Color(0x42000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB4C4FF),
  onPrimary: Color(0xFF00297A),
  primaryContainer: Color(0xFF003DAA),
  onPrimaryContainer: Color(0xFFDBE1FF),
  secondary: Color(0xFF9ECAFF),
  onSecondary: Color(0xFF003258),
  secondaryContainer: Color(0xFF00497D),
  onSecondaryContainer: Color(0xFFD1E4FF),
  tertiary: Color(0xFFE2BBDB),
  onTertiary: Color(0xFF422740),
  tertiaryContainer: Color(0xFF5B3D58),
  onTertiaryContainer: Color(0xFFFFD6F7),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE4E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE4E2E6),
  surfaceVariant: Color(0xFF45464F),
  onSurfaceVariant: Color(0xFFC6C6D0),
  outline: Color(0xFF8F909A),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE4E2E6),
  inversePrimary: Color(0xFF0052DE),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB4C4FF),
  outlineVariant: Color(0xFF45464F),
  scrim: Color(0xFF000000),
);
