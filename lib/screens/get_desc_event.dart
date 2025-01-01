import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/models/event.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/widgets/custom_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class GetDescEvent extends StatelessWidget {
  const GetDescEvent({super.key});
   static String id ='GetDescEvent';
  @override
  Widget build(BuildContext context) {
    
    Event args = ModalRoute.of(context)!.settings.arguments as Event;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    DateTime date = args.date;
    String formattedDate = DateFormat('d/MMMM/yyyy').format(date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.appTheme == ThemeMode.light
            ? Colors.transparent
            : Color(0xff101127),
        toolbarHeight: height * .06,
        centerTitle: true,
        title: Text(
          S.of(context).EventDetails,
          style: TextStyle(
              color: themeProvider.appTheme == ThemeMode.dark
                  ? ColorsApp.kPrimaryColor
                  : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                args.image!,
                fit: BoxFit.fill,
              ),
            ),
            Text(args.tilte! , style: TextStyle(color: ColorsApp.kPrimaryColor,fontSize: 22),),
            CustomDetails(date: formattedDate, time: args.time!,),
            Text(S.of(context).Description,style: TextStyle(color: themeProvider.appTheme == ThemeMode.light?Colors.black : Colors.white),),
            SizedBox(height: height*0.02,),
            SingleChildScrollView(
              child: Text(args.description!,style: TextStyle(color: themeProvider.appTheme == ThemeMode.light?Colors.black : Colors.white),)),
          ],
        ),
      ),
    );
  }
}
