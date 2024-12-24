import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.02),
          height: height*.003,
          color: ColorsApp.kPrimaryColor,
          width: width * 0.32,
        ),
        Text('OR',
            style: TextStyle(
              color: ColorsApp.kPrimaryColor,
            )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.02),
          height: height*.003,
          color: ColorsApp.kPrimaryColor,
          width: width * 0.32,
        ),
      ],
    );
  }
}
