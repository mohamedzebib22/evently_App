import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/screens/forget_password_page.dart';
import 'package:evently_app/screens/register_page.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:evently_app/widgets/custom_text_button.dart';
import 'package:evently_app/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                hintText: 'Email',
                textStyle: themeProvider.appTheme == ThemeMode.light
                    ? TextStyle(color: Colors.grey)
                    : TextStyle(color: ColorsApp.kPrimaryColor),
                prefix: Icon(Icons.email_sharp),
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
              CustomText(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasswordPage.id);
                },
                title: 'Foget Paswword',
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(title: 'Login', width: double.infinity),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextButton(
                title1: 'Don’t Have Account ?',
                title2: 'Create Account',
                onTap: () {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SpaceWidget(),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                title: 'Login With Google',
                width: double.infinity,
                icon: Image.asset('assets/images/googleicon.png'),
                textColor: ColorsApp.kPrimaryColor,
                itemColor: Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
