import 'package:evently_app/components/change_switch.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/screens/defult_page.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  static String id = 'IntroPage';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  bool? isActive;
  bool? isActive2;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var langaugeProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.appTheme == ThemeMode.light
            ? Colors.transparent
            : Color(0xff101127),
        title: Image.asset('assets/images/intrologo.png'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/introbackground.png',
              width: width * 0.91,
              height: height * 0.44,
            ),
            Text(
              S.of(context).SubTitle,
              style: TextStyle(
                  color: ColorsApp.kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
             S.of(context).bodyIntro,
              style: TextStyle(
                  color: themeProvider.appTheme == ThemeMode.light
                      ? Colors.black
                      : ColorsApp.kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            ChangeSwitch(
              onChanged: (value) {
                isActive = value;
                if (isActive != false) {
                  langaugeProvider.changeLanguage('ar');
                } else {
                  langaugeProvider.changeLanguage('en');
                }
                setState(() {});
              },
              activeImage: 'assets/images/englishlogo.png',
              inActiveImage: 'assets/images/arabiclogo.png',
              isActive: isActive ?? false,
              title: S.of(context).Language,
            ),
            ChangeSwitch(
              onChanged: (value) {
                isActive2 = value;
                if (isActive2 != false) {
                  themeProvider.changedTheme(ThemeMode.dark);
                } else {
                  themeProvider.changedTheme(ThemeMode.light);
                }
                setState(() {});
              },
              activeImage: 'assets/images/lightlogo.png',
              inActiveImage: 'assets/images/darklogo.png',
              isActive: isActive2 ?? false,
              title: S.of(context).Theme,
            ),
            CustomButton(
              title: S.of(context).LetsStart,
              width: double.infinity,
              onTap: () {
                Navigator.pushNamed(context, DefultPage.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
