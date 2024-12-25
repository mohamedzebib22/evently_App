import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/screens/register_page.dart';
import 'package:evently_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({super.key, this.onTap,required this.title1,required this.title2});
  VoidCallback? onTap;
  String title1;
  String title2;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: themeProvider.appTheme == ThemeMode.light
              ? TextStyle(color: Colors.black)
              : TextStyle(color: Colors.white),
        ),
        CustomText(title: title2, onTap: onTap)
      ],
    );
  }
}
