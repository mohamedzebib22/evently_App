import 'package:flutter/material.dart';

class CustomChange extends StatelessWidget {
   CustomChange({super.key ,required this.language , required this.title , required this.onTap});
  String language;
  String title;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(language , style :TextStyle(fontSize: 20)),

            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 2, color: Colors.blue),

              ),
              child: InkWell(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(title, style :TextStyle(fontSize: 20 , color: Colors.blue)),
                  Icon(Icons.arrow_drop_down , color: Colors.blue,)
                ],),
              ),
            )
          ],
        );
  }
}