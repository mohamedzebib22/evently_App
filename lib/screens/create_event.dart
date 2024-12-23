import 'package:evently_app/components/choose_date_and_time.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:evently_app/widgets/location_widget.dart';
import 'package:evently_app/widgets/tap_widget.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({super.key});

  static String id = "CreateEvent";

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  String currentName = 'ALl';

  @override
  Widget build(BuildContext context) {
    List<String> eventsNameList = [
      "ALl",
      "Birthday",
      "Metting",
      "Gaming",
      "WorkShop",
      "BookClub",
      "Exhibtion",
      "Holiday",
      "Eating",
    ];
    Map<String, dynamic> eventsNameAndImag = {
      "ALl": 'assets/images/bookclub.png',
      "Birthday": 'assets/images/route.png',
      "Metting": 'assets/images/bookclub.png',
      "Gaming": 'assets/images/route.png',
      "WorkShop": 'assets/images/bookclub.png',
      "BookClub": 'assets/images/route.png',
      "Exhibtion": 'assets/images/bookclub.png',
      "Holiday": 'assets/images/route.png',
      "Eating": 'assets/images/bookclub.png',
    };

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * .03,
        centerTitle: true,
        title: Text(
          'Create Event',
          style: TextStyle(
              color: ColorsApp.kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * .05, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(eventsNameAndImag[currentName],fit: BoxFit.fill,),
              ),
              Container(
                height: height * .07,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: eventsNameList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          currentName = eventsNameList[index];
                          setState(() {});
                        },
                        child: TapWidget(
                          eventName: eventsNameList[index],
                          isSelected: currentName == eventsNameList[index]
                              ? true
                              : false,
                          selected: ColorsApp.kPrimaryColor,
                          unSelected: Colors.transparent,
                          selectedItem: Colors.white,
                          unselectedItem: ColorsApp.kPrimaryColor, borderColor: ColorsApp.kPrimaryColor,
                        ),
                      );
                    }),
              ),
              Text(
                S.of(context).title,
                style: TextStyle(fontSize: 16),
              ),
              CustomTextFeild(
                hintText: 'Event Tilte',
                textStyle: TextStyle(color: Colors.grey),
                prefix: Icon(Icons.edit_calendar_sharp),
                borderColor: Colors.grey,
              ),
              Text(
                S.of(context).Description,
                style: TextStyle(fontSize: 16),
              ),
              CustomTextFeild(
                hintText: 'Event Description',
                textStyle: TextStyle(color: Colors.grey),
                borderColor: Colors.grey,
                maxLines: 5,
              ),
              ChooseDateAndTime(
                eventName: S.of(context).EventDate,
                eventTime: S.of(context).ChooseDate,
                icon: Icons.date_range_sharp,
              ),
              ChooseDateAndTime(
                eventName: S.of(context).EventTime,
                eventTime: S.of(context).ChooseTime,
                icon: Icons.schedule_sharp,
              ),
              LocationWidget(),
              SizedBox(height: height*0.02,),
              CustomButton(
                title: S.of(context).AddEvent,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
