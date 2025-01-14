import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.onTap,
      required this.title,
      required this.width,
      this.icon,
      this.textColor = Colors.white,
      this.itemColor = Colors.blue});
  String title;
  double width;
  Color itemColor;
  Widget? icon;
  Color textColor;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height * 0.07,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: ColorsApp.kPrimaryColor),
            borderRadius: BorderRadius.circular(20),
            color: itemColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3,),
              Container(
                width: width * 0.06,
                height: height * 0.03,
                child: icon,
              ),
              Text(
                title,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
              Spacer(flex: 4,),
              
            ],
          )),
    );
  }
}

/**
 * Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
 */