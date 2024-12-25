import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class ChangeSwitch extends StatelessWidget {
  ChangeSwitch(
      {super.key,
      required this.onChanged,
      required this.activeImage,
      required this.inActiveImage,
      required this.title,
      required this.isActive});
  bool isActive;
  Function(bool) onChanged;
  String activeImage;
  String inActiveImage;
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(
              color: ColorsApp.kPrimaryColor,
            )),
        Spacer(),
        Switch(
            activeThumbImage: AssetImage(activeImage),
            inactiveThumbImage: AssetImage(inActiveImage),
            value: isActive,
            onChanged: onChanged)
      ],
    );
  }
}
