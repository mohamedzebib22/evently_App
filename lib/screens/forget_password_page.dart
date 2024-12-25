import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static String id = 'ForgetPasswordPage';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.appTheme == ThemeMode.light ? Colors.transparent:Color(0xff101127),
        toolbarHeight: height * .06,
        centerTitle: true,
        title: Text(
          S.of(context).ForgetPassword,
          style: TextStyle(
              color: themeProvider.appTheme == ThemeMode.dark
                  ? ColorsApp.kPrimaryColor
                  : Colors.black,
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
              'assets/images/forgetpasswordlogo.png',
              width: width * 0.87,
              height: height * .41,
            ),
            SizedBox(
              height: height * 0.08,
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
            CustomButton(title: 'Reset Password', width: double.infinity),
          ],
        ),
      ),
    );
  }
}
