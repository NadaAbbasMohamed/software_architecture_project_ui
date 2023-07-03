import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../view_models/virtual_coins_view_model.dart';
import '../../components/buttons.dart';

class NewPostContainer extends StatefulWidget {
  const NewPostContainer({Key? key}) : super(key: key);

  @override
  State<NewPostContainer> createState() => _NewPostContainerState();
}

class _NewPostContainerState extends State<NewPostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1050,
      height: 150,
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
      child: Align(
        alignment: Alignment.bottomRight,
        child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: DefaultButton(
            radius: 15,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            width: 250,
            height: 40,
            bgColor: buttonPurple,
            text: 'Post',
            onPressed: () async {
              bool canEnroll = await Provider.of<VirtualCoinsViewModel>(
                  context,
                  listen: false)
                  .checkToSubtract("1");
              if (canEnroll) {
                Provider.of<VirtualCoinsViewModel>(context, listen: false)
                    .subtractFromBalance("1");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Not enough coins in your balance ')),
                );
              }
            },
          ),
        ),
      )
    );
  }
}
