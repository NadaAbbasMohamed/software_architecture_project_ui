import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_arch_project/constants.dart';

import '../../../view_models/virtual_coins_view_model.dart';

class CoinsContainer extends StatelessWidget {
  const CoinsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 90,
                  child: Text(
                    "Coins\nin\nBalance",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: coinYellow,
                      size: 45,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Consumer<VirtualCoinsViewModel>(
                            builder: (context, virtualCoinsVM, child) {
                          return FutureBuilder<String>(
                              future: virtualCoinsVM.getCoinsBalance(),
                              builder: (context, balanceSnapshot) {
                                if (balanceSnapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (balanceSnapshot.hasData) {
                                    return Text(balanceSnapshot.data!,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold));
                                  } else {
                                    return const Text("error loading balance",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold));
                                  }
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                        }))
                  ],
                ),
              ],
            )));
  }
}

