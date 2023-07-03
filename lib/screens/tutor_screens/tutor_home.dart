import 'package:flutter/material.dart';

import '../components/buttons.dart';
import '../components/user_drop_down.dart';

class TutorHome extends StatefulWidget {
  const TutorHome({Key? key}) : super(key: key);

  @override
  State<TutorHome> createState() => _TutorHomeState();
}

class _TutorHomeState extends State<TutorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(child: DefaultButton(text: 'Change Tutor', onPressed: () { showPopupDialog(context); },),),
    );
  }
}
