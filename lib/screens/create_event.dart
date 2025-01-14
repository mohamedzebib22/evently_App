import 'package:evently_app/components/choose_date_and_time.dart';
import 'package:evently_app/constants/const.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/models/event.dart';
import 'package:evently_app/providers/get_all_event.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/showloading.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:evently_app/widgets/location_widget.dart';
import 'package:evently_app/widgets/tap_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({super.key});

  static String id = "CreateEvent";

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  String currentName = 'ALl';
  String currentImage = 'assets/images/bookclub.png';
  var formkey = GlobalKey<FormState>();
  var nowDate = DateTime.now();
  DateTime? selectDate;
  TimeOfDay? selectTime;
  var formatTime = '';
  var titleEvent = '';
  var descEvent = '';

  late GetAllEventProvider ListProvider;
  @override
  Widget build(BuildContext context) {
    ListProvider = Provider.of<GetAllEventProvider>(context);
    List<String> eventsNameList = [
      "ALl",
      "sport",
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
      "ALl": sport,
      "sport": sport,
      "Birthday": birthday,
      "Metting": metting,
      "Gaming": gaming,
      "WorkShop": workShop,
      "BookClub": bookClub,
      "Exhibtion": exhibtion,
      "Holiday": holiday,
      "Eating": eating,
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
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    eventsNameAndImag[currentName],
                    fit: BoxFit.fill,
                  ),
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
                            currentImage = eventsNameAndImag[currentName];
                            setState(() {});
                            print('Current Name is $currentName');
                            print('Current image is $currentImage');
                          },
                          child: TapWidget(
                            eventName: eventsNameList[index],
                            isSelected: currentName == eventsNameList[index]
                                ? true
                                : false,
                            selected: ColorsApp.kPrimaryColor,
                            unSelected: Colors.transparent,
                            selectedItem: Colors.white,
                            unselectedItem: ColorsApp.kPrimaryColor,
                            borderColor: ColorsApp.kPrimaryColor,
                          ),
                        );
                      }),
                ),
                Text(
                  S.of(context).title,
                  style: TextStyle(fontSize: 16),
                ),
                CustomTextFeild(
                  onChanged: (text) {
                    titleEvent = text;
                  },
                  validator: (title) {
                    if (title == null || title.isEmpty) {
                      return 'Please Enter eventTilte';
                    }
                    return null;
                  },
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
                  onChanged: (descr) {
                    descEvent = descr;
                  },
                  validator: (desc) {
                    if (desc == null || desc.isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                  hintText: 'Event Description',
                  textStyle: TextStyle(color: Colors.grey),
                  borderColor: Colors.grey,
                  maxLines: 5,
                ),
                ChooseDateAndTime(
                  onChangedateAndTime: chooseDate,
                  eventName: S.of(context).EventDate,
                  eventTime: selectDate == null
                      ? S.of(context).ChooseDate
                      : '${selectDate!.day}/${selectDate!.month}/${selectDate!.year}',
                  icon: Icons.date_range_sharp,
                ),
                ChooseDateAndTime(
                  onChangedateAndTime: chooseTime,
                  eventName: S.of(context).EventTime,
                  eventTime: selectTime == null
                      ? S.of(context).ChooseTime
                      : formatTime,
                  icon: Icons.schedule_sharp,
                ),
                LocationWidget(),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                  title: S.of(context).AddEvent,
                  width: double.infinity,
                  onTap: addEvent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formkey.currentState?.validate() == true) {
      ShowLoading.showLoading(context: context, msg: 'Please Wait For Added Event');
      Event event = Event(
         
          image: currentImage,
          nameEvent: currentName,
          tilte: titleEvent,
          description: descEvent,
          date: selectDate!,
          time: formatTime);
      FirebaseUtils.addEvent(event).timeout(Duration(milliseconds: 500),
          onTimeout: () {
         
        print(
            '${event.image}\n${event.nameEvent}\n${event.tilte}\n${event.description}\n${event.date}\n${event.time}\n${event.id}');
        print('Event add sucssefuly');
        ListProvider.getDatafromFirestore();
        ShowLoading.hideLoading(context: context);
        Navigator.pop(context);
      });
      
    }
  }

  void chooseDate() async {
    var date = await showDatePicker(
        context: context,
        initialDate: nowDate,
        firstDate: nowDate,
        lastDate: nowDate.add(Duration(days: 365)));

    selectDate = date;
    setState(() {});
  }

  void chooseTime() async {
    var chooseTimeNow =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectTime = chooseTimeNow;
    formatTime = selectTime?.format(context) ?? '';
    setState(() {});
  }
}
