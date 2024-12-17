import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetLanguage extends StatelessWidget {
  const BottomSheetLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en' ? getSelectedItem(S.of(context).English) : getUnSelectedItem(S.of(context).English)
          ),
        ),
        InkWell(
          onTap: (){
            provider.changeLanguage('ar');
          },
          child: Container(
            margin: EdgeInsets.all(16),
            child: provider.appLanguage == 'ar' ?  getSelectedItem(S.of(context).Arabic) : getUnSelectedItem(S.of(context).Arabic)
            ),
        ),
      ],
    );
  }
  Widget getSelectedItem(String text){
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text , style: TextStyle(color: Colors.blue,fontSize: 20),),
                Icon(Icons.check,color: Colors.blue, size: 20,)
              ],
            );
  }

  Widget getUnSelectedItem(String text){
    return Text(text , style: TextStyle(fontSize: 20),);
  }
}