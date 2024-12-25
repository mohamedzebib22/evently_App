import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key, required this.title, this.mainAxisAlignment, this.onTap});
  String title;
  MainAxisAlignment? mainAxisAlignment;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(
                color: ColorsApp.kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: ColorsApp.kPrimaryColor,
                decorationThickness: 2),
          ),
        ),
      ],
    );
  }
}
