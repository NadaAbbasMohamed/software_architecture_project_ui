import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:software_arch_project/models/user.dart';
import '../models/transaction.dart';

class VirtualCoinsViewModel extends ChangeNotifier {

  Future<String> getCoinsBalance() async {
    try{
      final http.Response response = await http.get(
          Uri.parse('http://localhost:8080/coins/${UserModel.uid}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data["balanceAvailable"].toString();
      } else {
        return "";
      }
    }
    catch(e){
      print(e);
      return "";
    }
  }

  updateCoinBalance() {
    // get coins balance from http request
    notifyListeners();
  }

  Future<List<Transaction>> getCoinsTransactions() async {
    try{
      final http.Response response = await http.get(
          Uri.parse('http://localhost:8080/transactions/${UserModel.uid}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        Map<String, Transaction> transactionsMap =
            Transaction.convertDataToTransactionsList(data);
        return transactionsMap.values.toList(growable: false);
      } else {
        return [];
      }
    }
    catch(e){
      print(e);
      return [];
    }
  }

  Future<bool> checkToSubtract(String transactionCost) async {
    await Future.delayed(const Duration(seconds: 1), () {
      // code to be executed after 1 second delay
    });
    return true;
  }

  subtractFromBalance(String transactionCost) {}
}
