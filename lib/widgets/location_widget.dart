import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.02),
        width: width * 0.91,
        height: height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            border: Border.all(color: ColorsApp.kPrimaryColor, width: 1)),
        child: Row(
          children: [
            Image.asset(
              'assets/images/locationnow.png',
              height: height * 0.06,
              width: width * 0.11,
            ),
            SizedBox(
              width: width * .02,
            ),
            Text(S.of(context).ChooseEventLocation,
                style: TextStyle(color: ColorsApp.kPrimaryColor, fontSize: 16)),
            Spacer(),
            Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ],
        ));
  }
}
