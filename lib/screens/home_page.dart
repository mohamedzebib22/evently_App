import 'package:evently_app/components/custom_change.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:evently_app/widgets/bottom_sheet_language.dart';
import 'package:evently_app/widgets/bottom_sheet_theme.dart';
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
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Title , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomChange(language: S.of(context).Language, 
            title:languageProvider.appLanguage == 'en' ?S.of(context).English : S.of(context).Arabic, 
            onTap: bottomSheetLanguage),
            SizedBox(height: 15,),
            
            CustomChange(language: S.of(context).Theme, 
            title:languageProvider.appLanguage == 'en' ?S.of(context).Light : S.of(context).Dark, 
            onTap: bottomSheetTheme),
          ],
        )
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
/**
 * languageProvider.appLanguage == 'en' ? S.of(context).English:
                    S.of(context).Arabic
 */
