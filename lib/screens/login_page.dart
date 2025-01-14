import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/get_user_name.dart';
import 'package:evently_app/screens/defult_page.dart';
import 'package:evently_app/screens/forget_password_page.dart';
import 'package:evently_app/screens/register_page.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/show_dialog_msg.dart';
import 'package:evently_app/widgets/showloading.dart';
import 'package:evently_app/widgets/custom_text.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:evently_app/widgets/custom_text_button.dart';
import 'package:evently_app/widgets/space_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  var formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
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
          child: Form(
            key: formkey,
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
                  style:
                      TextStyle(color: ColorsApp.kPrimaryColor, fontSize: 36),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextFeild(
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return('Please Enter Email');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    email = text;
                    setState(() {});
                  },
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
                  validator: (password) {
                    if (password == null || email.isEmpty) {
                      return ('Please Enter Password');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    password = text;
                    setState(() {});
                  },
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
                  title: S.of(context).ForgetPassword,
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                  title: S.of(context).Login,
                  width: double.infinity,
                  onTap:loginMethod,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextButton(
                  title1: S.of(context).DontHaveAccount,
                  title2: S.of(context).CreateAccount,
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
                  onTap: signInWithGoogle,
                  title: S.of(context).LoginWithGoogle,
                  width: double.infinity,
                  icon: Image.asset('assets/images/googleicon.png'),
                  textColor: ColorsApp.kPrimaryColor,
                  itemColor: Colors.transparent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signInWithGoogle() async {
    ShowLoading.showLoading(context: context, msg: 'Loading');
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      ShowLoading.hideLoading(context: context);
      Navigator.pushReplacementNamed(context, DefultPage.id);
    } catch (e) {}
  }
  
  loginMethod() async {
    
    if (formkey.currentState?.validate() == true) {
      ShowLoading.showLoading(context: context, msg: 'Loading');
     
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        var user =await FirebaseUtils.readUserFromFireStore(credential.user?.uid??'');
        if(user == null){
          return;
        }
        // use Provider to change name
        var listProvider = Provider.of<changeUserName>(context,listen: false);
        listProvider.changeUser(user);

        print('Login Sucssefuly');
        ShowLoading.hideLoading(context: context);
        Navigator.pushNamed(context, DefultPage.id);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
