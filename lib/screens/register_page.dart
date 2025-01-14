import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/models/myuser.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/get_user_name.dart';
import 'package:evently_app/screens/defult_page.dart';
import 'package:evently_app/screens/login_page.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/showloading.dart';
import 'package:evently_app/widgets/custom_text_button.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name ='';
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
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
                  style:
                      TextStyle(color: ColorsApp.kPrimaryColor, fontSize: 36),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextFeild(
                  onChanged: (text){
                    name =text;
                    setState(() {
                      
                    });
                  },
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
                  prefix: Icon(Icons.lock_sharp),
                  sufix: Icon(Icons.email_sharp),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextFeild(
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
                CustomButton(
                  title: S.of(context).CreateAccount,
                  width: double.infinity,
                  onTap: signUp,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextButton(
                  title1: S.of(context).AlreadyHaveAccount,
                  title2: S.of(context).Login,
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    if (formkey.currentState?.validate() == true) {
      ShowLoading.showLoading(context: context, msg: 'Please Wait For SignUp');
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        MyUser myUser =MyUser(
        id: credential.user?.uid??'',
        name: name,
        email: email);
        await FirebaseUtils.addUserToFireStore(myUser);
        var listProvider = Provider.of<changeUserName>(context,listen: false);
        listProvider.changeUser(myUser);
        ShowLoading.hideLoading(context: context);
        Navigator.pushReplacementNamed(context, DefultPage.id);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
