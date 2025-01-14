import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/models/event.dart';
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
   List<Event> searchList = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
   
    var listProvider = Provider.of<GetAllEventProvider>(context);
    if (listProvider.filterFavoritesList.isEmpty) {
      listProvider.getIsFavofiteDataFromFirestore();
    }
    searchList = listProvider.filterFavoritesList;
    return Column(
      children: [
        SizedBox(
          height: height * 0.04,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFeild(
              // onChanged: (text) {
              //   searchList = listProvider.filterFavoritesList.where((name) {
              //     return name.nameEvent!.toLowerCase().contains(text.toLowerCase());
              //   }).toList();
              //   setState(() {
                  
              //   }
              //   );
              // },
              hintText: 'search for Event',
              prefix: Icon(Icons.search),
              textStyle: TextStyle(
                color: ColorsApp.kPrimaryColor,
              )),
        ),
        Expanded(
          child: searchList.isEmpty
              // listProvider.filterFavoritesList.isEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text('No Event Favorite'),
                  ],
                )
              : ListView.builder(
                  itemCount: searchList.length,
                  // listProvider.filterFavoritesList.length,
                  itemBuilder: (context, index) {
                    return CardEvent(
                      event: searchList[index],
                      // listProvider.filterFavoritesList[index]
                    );
                  }),
        )
      ],
    );
  }
}
