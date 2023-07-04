import 'package:software_arch_project/models/user.dart';

class Transaction {
  String transactionID;
  String transactionCoins; //amount
  String transactionDate;
  String description;
  String transactionType;
  Transaction({
    required this.transactionID,
    required this.transactionCoins,
    required this.transactionDate,
    required this.description,
    required this.transactionType,
  });

  static Map<String, Transaction> convertDataToTransactionsList(data) {
    Map<String, Transaction> transactionsList = {};
    for (var d in data) {
      if (d["userId"].toString() == UserModel.uid) {
        Transaction transaction = Transaction(
            transactionID: d["id"].toString(),
            transactionCoins: d["amount"].toString(),
            transactionDate: d["transactionDate"].toString(),
            description: d["description"].toString(),
            transactionType: d["transactionType"].toString());
        transactionsList[d["id"].toString()] = transaction;
      }
    }
    return transactionsList;
  }
}
