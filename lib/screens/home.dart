import 'package:evently_app/components/custom_appbar_home.dart';
import 'package:evently_app/widgets/card_event.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: CustomAppbarHome(),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index) {
              return CardEvent();
            }),
          )
        ],
      ),
    );
  }
}
