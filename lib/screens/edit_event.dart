import 'package:evently_app/components/choose_date_and_time.dart';
import 'package:evently_app/constants/const.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/models/event.dart';
import 'package:evently_app/providers/get_all_event.dart';
import 'package:evently_app/screens/defult_page.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/widgets/custom_button.dart';
import 'package:evently_app/widgets/custom_text_feild.dart';
import 'package:evently_app/widgets/location_widget.dart';
import 'package:evently_app/widgets/tap_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EditEvent extends StatefulWidget {
  EditEvent({super.key});

  static String id = "EditEvent";

  @override
  State<EditEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<EditEvent> {
  String? currentName;
  String? currentImage;
  var formkey = GlobalKey<FormState>();
  var nowDate = DateTime.now();
  DateTime? selectDate;
  TimeOfDay? selectTime;

  late GetAllEventProvider ListProvider;
  //----------------------
  int? selectedIndex;
  // Update Data
  String newImage = '';
  String newEventName = '';
  String newTitle = '';
  String newDesc = '';
  var formatTime = '';
  //========================
  @override
  Widget build(BuildContext context) {
    Event args = ModalRoute.of(context)?.settings.arguments as Event;
    ListProvider = Provider.of<GetAllEventProvider>(context);
    var titleEvent = args.tilte;
    var descEvent = args.description;
    DateTime date = args.date;
    String formattedDate = DateFormat('d/MM/yyyy').format(date);

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

    currentName = args.nameEvent ?? '';
    currentImage = args.image;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var dataProvider = Provider.of<GetAllEventProvider>(context);

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
                    newImage == null || newImage.isEmpty
                        ? currentImage
                        : eventsNameAndImag[newEventName],
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
                            selectedIndex = index;
                            newEventName = eventsNameList[index];
                            newImage = eventsNameAndImag[newEventName];
                            setState(() {});
                            print('Current Name is $newEventName');
                            print('Current image is $newImage');
                          },
                          child: TapWidget(
                            eventName: newEventName == null
                                ? currentName!
                                : newEventName = eventsNameList[index],
                            isSelected: selectedIndex == null
                                ? currentName == eventsNameList[index]
                                : selectedIndex == index,
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
                  text: titleEvent,
                  onChanged: (text) {
                    newTitle = text;
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
                  text: descEvent,
                  onChanged: (descr) {
                    newDesc = descr;
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

                //===========================
                //----------DATE---------------
                //===========================
                ChooseDateAndTime(
                  onChangedateAndTime: chooseDate,
                  eventName: S.of(context).EventDate,
                  eventTime: selectDate == null
                      ? formattedDate
                      : '${selectDate!.day}/${selectDate!.month}/${selectDate!.year}',
                  icon: Icons.date_range_sharp,
                ),

                //===========================
                //----------TIME---------------
                //===========================
                ChooseDateAndTime(
                  onChangedateAndTime: chooseTime,
                  eventName: S.of(context).EventTime,
                  eventTime: selectTime == null ? args.time! : formatTime,
                  icon: Icons.schedule_sharp,
                ),
                LocationWidget(),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                  title: 'Update Event',
                  width: double.infinity,
                  onTap: () {
                    // String finalDate =
                    //     '${selectDate?.day}/${selectDate?.month}/${selectDate?.year}';
                    try {
                      FirebaseUtils.getEventCollection().doc(args.id).update({
                        'image': newImage == null || newImage.isEmpty
                            ? currentImage
                            : newImage,
                        'nameEvent':
                            newEventName == null ? currentName : newEventName,
                        'tilte': newTitle == null ? titleEvent : newTitle,
                        'description': newDesc == null ? descEvent : newDesc,
                        // 'isFavorite': isFavorite,
                        'date': selectDate == null? S.of(context).ChooseDate: '${selectDate!.day}/${selectDate!.month}/${selectDate!.year}',
                        'time': selectTime == null ? args.time! : formatTime,
                      });

                      print(
                          '${newImage.isEmpty ? currentImage : newImage}\n${newEventName == null ? currentName : newEventName}\n${newTitle == null ? titleEvent : newTitle}\n${newDesc == null ? descEvent : newDesc}\n${selectDate == null ? formattedDate : selectDate}\n${formatTime == null ? args.time : formatTime}');
                      dataProvider.getDatafromFirestore();
                      Navigator.pushReplacementNamed(context, DefultPage.id);
                    } catch (e) {
                      print('The error is $e');
                    }
                    // dataProvider.getDatafromFirestore();
                    // Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
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
/**
 * currentName = eventsNameList[index];
                            currentImage = eventsNameAndImag[currentName];
 */