import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetTheme extends StatelessWidget {
  const BottomSheetTheme({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              themeProvider.changedTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme == ThemeMode.dark ? getSelectedItem(S.of(context).Dark) : getUnSelectedItem(S.of(context).Dark)
          ),
        ),
        InkWell(
          onTap: (){
            themeProvider.changedTheme(ThemeMode.light);
          },
          child: Container(
            margin: EdgeInsets.all(16),
            child: themeProvider.appTheme == ThemeMode.light ?  getSelectedItem(S.of(context).Light) : getUnSelectedItem(S.of(context).Light)
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