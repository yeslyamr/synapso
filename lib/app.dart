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
      child: MaterialApp.router(
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
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0052DE),
              foregroundColor: const Color(0xFFFFFFFF),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              disabledBackgroundColor: const Color(0xFF0052DE),
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          textTheme: const TextTheme(),
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
        ),
        themeMode: ThemeMode.light,
      ),
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
  surface: Color(0xFFF3F3F7),
  onSurface: Color(0xFF262626),
  shadow: Color(0xFF434345),
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
