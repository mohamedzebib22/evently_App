import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/screens/login_page.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_button.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = "RegisterPage";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * .06,
        centerTitle: true,
        title: Text(
          S.of(context).Register,
          style: TextStyle(
              color: themeProvider.appTheme==ThemeMode.dark?ColorsApp.kPrimaryColor:Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.02),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logoevent.png',
              width: width * 0.38,
              height: height * 0.19,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Evently',
              style: TextStyle(color: ColorsApp.kPrimaryColor, fontSize: 36),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextFeild(
              borderColor: themeProvider.appTheme == ThemeMode.light
                  ? Colors.grey
                  : ColorsApp.kPrimaryColor,
              hintText: 'Name',
              textStyle: themeProvider.appTheme == ThemeMode.light
                  ? TextStyle(color: Colors.grey)
                  : TextStyle(color: ColorsApp.kPrimaryColor),
              prefix: Icon(Icons.person_2),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextFeild(
              borderColor: themeProvider.appTheme == ThemeMode.light
                  ? Colors.grey
                  : ColorsApp.kPrimaryColor,
              hintText: 'Email',
              textStyle: themeProvider.appTheme == ThemeMode.light
                  ? TextStyle(color: Colors.grey)
                  : TextStyle(color: ColorsApp.kPrimaryColor),
              prefix: Icon(Icons.lock_sharp),
              sufix: Icon(Icons.email_sharp),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextFeild(
              borderColor: themeProvider.appTheme == ThemeMode.light
                  ? Colors.grey
                  : ColorsApp.kPrimaryColor,
              hintText: 'Password',
              textStyle: themeProvider.appTheme == ThemeMode.light
                  ? TextStyle(color: Colors.grey)
                  : TextStyle(color: ColorsApp.kPrimaryColor),
              prefix: Icon(Icons.lock_sharp),
              sufix: Icon(Icons.remove_red_eye),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextFeild(
              borderColor: themeProvider.appTheme == ThemeMode.light
                  ? Colors.grey
                  : ColorsApp.kPrimaryColor,
              hintText: 'Password',
              textStyle: themeProvider.appTheme == ThemeMode.light
                  ? TextStyle(color: Colors.grey)
                  : TextStyle(color: ColorsApp.kPrimaryColor),
              prefix: Icon(Icons.lock_sharp),
              sufix: Icon(Icons.remove_red_eye),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomButton(title: 'Create Account', width: double.infinity),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextButton(
              title1: 'Already Have Account ?',
              title2: 'Login',
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
