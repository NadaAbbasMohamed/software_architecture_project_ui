import 'package:flutter/material.dart';

import '../../../constants.dart';

class TransactionContainer extends StatelessWidget {
  double width;
  double height;
  String transactionTitle;
  String transactionCoins;
  String transactionDate;
  String transactionDescription;
  String transactionType;

  TransactionContainer({
    required this.width,
    required this.height,
    required this.transactionTitle,
    required this.transactionCoins,
    required this.transactionDate,
    required this.transactionDescription,
    required this.transactionType,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
        padding: const EdgeInsets.all(20),
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Icon(Icons.monetization_on, color: coinYellow, size: 45,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionTitle,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: "Transaction Type: ",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      TextSpan(text: transactionType, style: const TextStyle(fontSize: 15))
                    ])),
                SizedBox(
                  width: width - 50,
                  child: Text(
                    transactionDescription,
                    softWrap: true,
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 15,),
                  ),
                ),
                const SizedBox(width: 5, height: 10),
                RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: "Cost: ",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      TextSpan(text: transactionCoins, style: const TextStyle(fontSize: 15))
                    ])),
                RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: "Date: ",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      TextSpan(text: transactionDate, style: TextStyle(fontSize: 15))
                    ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
