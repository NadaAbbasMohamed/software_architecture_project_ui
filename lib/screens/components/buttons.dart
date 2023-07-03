import 'package:flutter/material.dart';
import 'package:software_arch_project/constants.dart';
import 'package:software_arch_project/screens/components/user_drop_down.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Color fontColor;
  final Color bgColor;
  final Color shadowColor;
  final FontWeight fontWeight;
  final double radius;

  const DefaultButton({
    Key? key,
    this.radius = 15.0,
    required this.text,
    required this.onPressed,
    this.fontColor = Colors.black,
    this.bgColor = buttonPurple,
    this.shadowColor = Colors.black26,
    this.width = 200.0,
    this.height = 40,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(1.5, 2.5),
              blurRadius: 5.0,
              //blurStyle: BlurStyle.normal
            )
          ]
      ),
      width: width,
      height: height,
      child: TextButton(
        style: ButtonStyle(
          //alignment: Alignment.topCenter,
            shadowColor: MaterialStateProperty.all<Color>(shadowColor),
            backgroundColor: MaterialStateProperty.all<Color>(bgColor),
            alignment: Alignment.center, // <-- had to set alignment
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero, // <-- had to set padding to zero
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius)))),
        onPressed: onPressed,
        child: //SizedBox(
        //width: 250.w,
        //child:
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontWeight: fontWeight,
          ),
          textAlign: TextAlign.center,
          //),
        ),
      ),
    );
  }
}

class ChangeUserButton extends StatelessWidget {
  const ChangeUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultButton(
      radius: 10,
      fontSize: 12,
      width: 100,
      height: 25,
      bgColor: buttonBabyBlue,
      text: 'Change user', onPressed: () { showPopupDialog(context); },
    );
  }
}


