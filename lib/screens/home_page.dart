import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:evently_app/widgets/bottom_sheet_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Title , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(S.of(context).Language , style :TextStyle(fontSize: 20)),

            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 2, color: Colors.blue),

              ),
              child: InkWell(
                onTap: bottomSheet,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(provider.appLanguage == 'en' ? S.of(context).English:
                    S.of(context).Arabic , style :TextStyle(fontSize: 20 , color: Colors.blue)),
                  Icon(Icons.check , color: Colors.blue,)
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }

  void bottomSheet(){
    showModalBottomSheet(
      context: context,
     builder: (context){
      return BottomSheetLanguage();
     });
  }
}

