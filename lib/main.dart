import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/theme_data.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/screens/create_event.dart';
import 'package:evently_app/screens/defult_page.dart';
import 'package:evently_app/screens/forget_password_page.dart';
import 'package:evently_app/screens/intro_page.dart';
import 'package:evently_app/screens/login_page.dart';
import 'package:evently_app/screens/onboardinscreen.dart';
import 'package:evently_app/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
      ChangeNotifierProvider(create: (context) => AppThemeProvider()),
    ],
    child: const EventelyApp()));
}

class EventelyApp extends StatelessWidget {
  const EventelyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider =Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      routes: {
        DefultPage.id : (context) => DefultPage(),
       CreateEvent.id : (context) =>CreateEvent(),
       LoginPage.id : (context) => LoginPage(),
       RegisterPage.id :(context) => RegisterPage(),
       ForgetPasswordPage.id :(context) =>ForgetPasswordPage(),
       IntroPage.id :(context) => IntroPage(),
       Onboardinscreen.id :(context) =>Onboardinscreen()
      },

      // initialRoute: ProfilePage.id,
      theme: AppTheme.ligtTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,

      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
