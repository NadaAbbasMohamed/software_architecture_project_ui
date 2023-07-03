import 'package:flutter/material.dart';

class UserContainer extends StatelessWidget {
  String text;
  UserContainer({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.account_circle, color: Colors.black54, size: 40,),
            const SizedBox(width: 10,),
            Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      )
    );
  }
}
