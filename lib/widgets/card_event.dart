import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/models/event.dart';
import 'package:evently_app/providers/get_all_event.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardEvent extends StatefulWidget {
  CardEvent({super.key, required this.event});
  Event event;

  @override
  State<CardEvent> createState() => _CardEventState();
}

class _CardEventState extends State<CardEvent> {
  late bool isSelect;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelect = widget.event.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var listProvider = Provider.of<GetAllEventProvider>(context);
    DateTime date = widget.event.date;
    String formattedDate = DateFormat('MMM').format(date);

    return Container(
      margin: EdgeInsets.all(height * 0.01),
      width: width * 0.91,
      height: height * 0.30,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: ColorsApp.kPrimaryColor),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(widget.event.image!), fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.008),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text('${widget.event.date.day}',
                    style: TextStyle(
                        color: ColorsApp.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Text(formattedDate,
                    style: TextStyle(
                        color: ColorsApp.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(6),
            height: height * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SingleChildScrollView(
                    child: Text(
                  '${widget.event.tilte}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
                Spacer(),
                IconButton(
                    onPressed: () {
                      isSelect = !isSelect;
                      FirebaseUtils.getEventCollection()
                          .doc(widget.event.id)
                          .update({'isFavorite': isSelect});
                      listProvider.getDatafromFirestore();
                      
                      setState(() {});
                    },
                    icon: Icon(
                      isSelect == true
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: ColorsApp.kPrimaryColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
