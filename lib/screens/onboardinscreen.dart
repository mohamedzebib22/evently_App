import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/screens/intro_page.dart';
import 'package:evently_app/screens/login_page.dart';
import 'package:evently_app/widgets/alignment_text_and_body_intro.dart';
import 'package:evently_app/widgets/customintrobutton.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class Onboardinscreen extends StatefulWidget {
  const Onboardinscreen({super.key});
  static String id = 'Onboardinscreen';

  @override
  State<Onboardinscreen> createState() => _OnboardinscreenState();
}

class _OnboardinscreenState extends State<Onboardinscreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.appTheme == ThemeMode.light
            ? Colors.transparent
            : Color(0xff101127),
        toolbarHeight: height * .06,
        centerTitle: true,
        title: Text(
          S.of(context).Register,
          style: TextStyle(
              color: themeProvider.appTheme == ThemeMode.dark
                  ? ColorsApp.kPrimaryColor
                  : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: IntroductionScreen(
        key: introKey,
        back: CustomIntroButton(
          icon: Icons.arrow_back,
        ),
        next: CustomIntroButton(
          icon: Icons.arrow_right_alt_sharp,
        ),
        showNextButton: true,
        showBackButton: true,
        done: Text(
          'Done',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        onDone: () {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginPage.id, (route) => false);
          //Navigator.pushNamed(context, LoginPage.id);
        },
        pages: [
          PageViewModel(
            titleWidget: AlignmentTextAndBodyIntro(
              text: S.of(context).FindEventsThatInspireYou,
              itemColor: ColorsApp.kPrimaryColor,
              itemSize: 18,
            ),
            bodyWidget: AlignmentTextAndBodyIntro(
                text: S.of(context).intropage1Body,
                itemColor: themeProvider.appTheme == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                itemSize: 16),
            image: Image.asset('assets/images/intropage1.png'),
          ),
          PageViewModel(
            titleWidget: AlignmentTextAndBodyIntro(
              text: S.of(context).EffortlessEventPlanning,
              itemColor: ColorsApp.kPrimaryColor,
              itemSize: 18,
            ),
            bodyWidget: AlignmentTextAndBodyIntro(
                text: S.of(context).intoPage2Body,
                itemColor: themeProvider.appTheme == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                itemSize: 16),
            image: Image.asset('assets/images/introscreen2.png'),
          ),
          PageViewModel(
            titleWidget: AlignmentTextAndBodyIntro(
              text: S.of(context).ConnectwithFriendsShareMoments,
              itemColor: ColorsApp.kPrimaryColor,
              itemSize: 18,
            ),
            bodyWidget: AlignmentTextAndBodyIntro(
                text: S.of(context).introPage3Body,
                itemColor: themeProvider.appTheme == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                itemSize: 16),
            image: Image.asset('assets/images/introscreen3.png'),
          )
        ],
      ),
    );
  }
}
