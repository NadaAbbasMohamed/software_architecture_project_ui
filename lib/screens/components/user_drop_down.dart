import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/users_view_model.dart';
import 'buttons.dart';

void showPopupDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          //contentPadding: const EdgeInsets.only(left: 50, right: 50, top:30, bottom:50),
          backgroundColor: Colors.white,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Text("Select User"),
              ),
              Icon(
                Icons.manage_accounts_sharp,
                color: Colors.black,
              ),
            ],
          ),
         content:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            DefaultButton(
                text: "Student",
                //width: 80,
                //height: 30,
                //fontSize: tinyTextSize,
                onPressed: () {
                  Provider.of<UsersViewModel>(context, listen: false).changeUserToStudent();
                  Navigator.of(context).pop();

                }),
              SizedBox(width: 15,),
            DefaultButton(
                text: "Administrator",
                //width: 80,
                //height: 30,
                //fontSize: tinyTextSize,
                onPressed: () {
                  Provider.of<UsersViewModel>(context, listen: false).changeUserToAdministrator();
                  Navigator.of(context).pop();

                })
          ],),
        );
      });
}
