import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild(
      {super.key,
      required this.hintText,
      this.prefix,
      this.sufix,
      this.textStyle,
      this.borderColor = Colors.blue,
      this.maxLines = 1,
      this.onChanged,
      this.validator});

  MyValidator? validator;
  String hintText;
  Widget? prefix;
  Widget? sufix;
  TextStyle? textStyle;
  Color? borderColor;
  int maxLines;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle,
        prefixIcon: prefix,
        suffixIcon: sufix,
        disabledBorder: makeAllBorder(color: Colors.grey, radius: 16),
        enabledBorder: makeAllBorder(color: borderColor!, radius: 16),
        focusedBorder:
            makeAllBorder(color: ColorsApp.kPrimaryColor, radius: 16),
        focusedErrorBorder:
            makeAllBorder(color: ColorsApp.kPrimaryColor, radius: 16),
        errorBorder: makeAllBorder(color: Colors.red, radius: 16),
      ),
    );
  }

  OutlineInputBorder makeAllBorder(
      {required Color color, required double radius}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(radius));
  }
}
