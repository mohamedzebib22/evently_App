
import 'package:evently_app/components/bottom_sheet_language.dart';
import 'package:evently_app/components/bottom_sheet_theme.dart';

import 'package:evently_app/components/custom_change.dart';
import 'package:evently_app/components/custom_profile_appbar.dart';
import 'package:evently_app/components/log_out.dart';
import 'package:evently_app/generated/l10n.dart';

import 'package:evently_app/providers/app_language.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'profilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider =Provider.of<AppThemeProvider>(context);
    return Scaffold(
      
      body: Column(
        children: [
          CustomProfileAppbar(),
          
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(12),
             child: Column(children: [
               CustomChange(language: S.of(context).Language, 
              title:languageProvider.appLanguage == 'en' ?S.of(context).English : S.of(context).Arabic, 
              onTap: bottomSheetLanguage),
              SizedBox(height: 15,),
              
              CustomChange(language: S.of(context).Theme, 
              title:themeProvider.appTheme == ThemeMode.light ?S.of(context).Light : S.of(context).Dark, 
              onTap: bottomSheetTheme),
             
              Spacer(),
              LogOut(),
              SizedBox(height: 20,),
             ],),
           ),
         )
        
        ],
      ),
    );
  }
  void bottomSheetLanguage(){
    showModalBottomSheet(
      context: context,
     builder: (context){
      return BottomSheetLanguage();
     });
  }

  void bottomSheetTheme(){
    showModalBottomSheet(
      context: context,
     builder: (context){
      return BottomSheetTheme();
     });
  }
}