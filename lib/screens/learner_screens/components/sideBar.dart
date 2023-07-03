import 'package:flutter/material.dart';
import 'package:software_arch_project/constants.dart';

class StudentSideBar extends StatelessWidget {
  const StudentSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
          decoration: const BoxDecoration(
          color: backgroundYellow,
          borderRadius: BorderRadius.all(
          Radius.circular(30.0),
      ),),
        //width: 90,
        //height: ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconButton(Icons.notifications_sharp, "Notifications"),
            iconButton(Icons.home, "Home"),
            iconButton(Icons.school, "Enrolled Courses"),
            iconButton(Icons.search, "Search Courses")

          ],
        ),

      ),
    );
  }

  Widget iconButton(IconData icon, String text){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: buttonYellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.5, 2.5),
                    blurRadius: 2.0,
                    //blurStyle: BlurStyle.normal
                  )
                ]
            ),
            width: 50,
              height: 50,
            child: Icon(icon, color: Colors.black,),
          ),
          SizedBox(height: 5,),
          Text(text, style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }

}
