import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/theme_data.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/get_all_event.dart';
import 'package:evently_app/screens/create_event.dart';
import 'package:evently_app/screens/defult_page.dart';
import 'package:evently_app/screens/forget_password_page.dart';
import 'package:evently_app/screens/intro_page.dart';
import 'package:evently_app/screens/login_page.dart';
import 'package:evently_app/screens/onboardinscreen.dart';
import 'package:evently_app/screens/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyDQMcUpo6aSvlAAJyfDXBgJiNd1GLYU83A',
    appId: '1:155057485552:android:0b82281c8a2839146d7435',
    messagingSenderId: '155057485552',
    projectId: 'eventapp-9dff0',
    storageBucket: 'eventapp-9dff0.firebasestorage.app',
  ));
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppThemeProvider()),
    ChangeNotifierProvider(create: (context) => GetAllEventProvider()),
  ], child: const EventelyApp()));
}

class EventelyApp extends StatefulWidget {
  const EventelyApp({super.key});

  @override
  State<EventelyApp> createState() => _EventelyAppState();
}

class _EventelyAppState extends State<EventelyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '==============User is currently signed out!=====================');
      } else {
        print('=======================User is signed in! ====================');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      routes: {
        DefultPage.id: (context) => DefultPage(),
        CreateEvent.id: (context) => CreateEvent(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ForgetPasswordPage.id: (context) => ForgetPasswordPage(),
        IntroPage.id: (context) => IntroPage(),
        Onboardinscreen.id: (context) => Onboardinscreen()
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
      home:DefultPage(),
    );
  }
}
