import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Color.fromARGB(141, 0, 0, 0)),
      ]),
      child: const Column(
        children: [
          Center(
            child: Text("Bilgiler"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Email:"),
              Text(
                "example@example.com",
                textAlign: TextAlign.left,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Telofon:"),
              Text(
                "05xxxxxxxxx",
                textAlign: TextAlign.left,
              )
            ],
          ),
        ],
      ),
    );
  }
}
