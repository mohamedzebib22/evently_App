import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/widgets/card_event.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class LovesPage extends StatelessWidget {
  const LovesPage({super.key});
  static String id = 'LovePage';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.04,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFeild(
              hintText: 'search for Event',
              prefix: Icon(Icons.search),
              textStyle: TextStyle(
                color: ColorsApp.kPrimaryColor,
              )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
            return Container();
          }),
        )
      ],
    );
  }
}
