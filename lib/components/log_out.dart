import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:evently_app/providers/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogOut extends StatelessWidget {
   LogOut({super.key , required this.onTap});
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorsApp.kLogOutColor),
      child: Row(
        children: [
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.logout_sharp,
                color: Colors.white,
              )),
          Text(
            S.of(context).Logout,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
