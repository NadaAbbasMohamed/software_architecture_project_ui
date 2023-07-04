import 'package:software_arch_project/models/user.dart';

class Package {
  String packageID;
  String packageDescription;
  String coinsOffered;
  String packageName;

  Package({
    required this.packageID,
    required this.packageDescription,
    required this.coinsOffered,
    required this.packageName,
  });

  static Map<String, Package> convertDataToPackagesList(data) {
    Map<String, Package> packagesList = {};
    for (var d in data) {
      if (d["id"] != null && d["id"] != "") {
        Package package = Package(
          packageID: d["id"].toString(),
          coinsOffered: d["coins"].toString(),
          packageName: d["name"].toString(),
          packageDescription: d["description"].toString(),
        );
        packagesList[d["id"].toString()] = package;
      }
    }
    return packagesList;
  }
}
