import 'package:evently_app/generated/l10n.dart';
import 'package:evently_app/models/colors_app.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorsApp.kLogOutColor
      ),
      child: Row(children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout_sharp ,color: Colors.white,)),
        Text(S.of(context).Logout , style: TextStyle(color: Colors.white),),
      ],),
    );
  }
}