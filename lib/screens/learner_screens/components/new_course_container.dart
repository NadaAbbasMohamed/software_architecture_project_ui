import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_arch_project/constants.dart';

import '../../../view_models/virtual_coins_view_model.dart';
import '../../components/buttons.dart';

class NewCourseContainer extends StatefulWidget {
  const NewCourseContainer({Key? key}) : super(key: key);

  @override
  State<NewCourseContainer> createState() => _NewCourseContainerState();
}

class _NewCourseContainerState extends State<NewCourseContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/course_image.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    width: 130,
                    height: 150,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                        ),
                        color: backgroundPurple),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Introduction to\nAlgorithms\n(Beginner)",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: const [
                              Icon(Icons.monetization_on, color: coinYellow, size: 25,),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "20 Coins",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 27.0),
                          child: Text(
                            "10 Lessons",
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: DefaultButton(
                radius: 15,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                width: 250,
                height: 40,
                bgColor: buttonPurple,
                text: 'Enroll Course',
                onPressed: () async {
                  bool canEnroll = await Provider.of<VirtualCoinsViewModel>(
                          context,
                          listen: false)
                      .checkToSubtract("20");
                  if (canEnroll) {
                    Provider.of<VirtualCoinsViewModel>(context, listen: false)
                        .subtractFromBalance("20");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Not enough coins in your balance ')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
