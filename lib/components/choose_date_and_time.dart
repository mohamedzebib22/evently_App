import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class ChooseDateAndTime extends StatelessWidget {
  ChooseDateAndTime({super.key,required this.eventName,required this.eventTime, this.icon});
  String eventName;
  String eventTime;

  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.black,
            )),
        Text(
          eventName,
          style: TextStyle(fontSize: 16),
        ),
        Spacer(),
        Text(
          eventTime,
          style: TextStyle(fontSize: 16, color: ColorsApp.kPrimaryColor),
        ),
      ],
    );
  }
}
