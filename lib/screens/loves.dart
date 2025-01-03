import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/get_all_event.dart';
import 'package:evently_app/widgets/card_event.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LovesPage extends StatefulWidget {
  const LovesPage({super.key});
  static String id = 'LovePage';

  @override
  State<LovesPage> createState() => _LovesPageState();
}

class _LovesPageState extends State<LovesPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var listProvider = Provider. of<GetAllEventProvider>(context);
    if (listProvider.eventList.isEmpty) {
      listProvider.getIsFavofiteDataFromFirestore();
    }
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
            itemCount: listProvider.eventList.length,
            itemBuilder: (context, index) {
            return CardEvent(event: listProvider.eventList[index]);
          }),
        )
      ],
    );
  }
}
