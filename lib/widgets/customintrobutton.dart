import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class CustomIntroButton extends StatelessWidget {
  CustomIntroButton({super.key , required this.icon});
  IconData icon;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        width: width * 0.09,
        height: height * 0.2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(width: 1, color: ColorsApp.kPrimaryColor),
        ),
        child: Icon(icon, color: ColorsApp.kPrimaryColor));
  }
}
