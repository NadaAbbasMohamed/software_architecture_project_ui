import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/package.dart';

class PackagesViewModel extends ChangeNotifier{
  Package? packageToUpdate;

  setPackageDataToUpdate(String packageID, String packagePrice, String coinsOffered, String dateCreated){
    packageToUpdate = Package(packageID: packageID, packageDescription: packagePrice, coinsOffered: coinsOffered, packageName: dateCreated);
    notifyListeners();
  }

  Future<List<Package>> getAllPackages() async {
   // return [Package(packageID: "2", packageDescription: "desc", coinsOffered: "30", packageName: "package 1")];
    try{
      final http.Response response = await http.get(
          Uri.parse('http://localhost:8080/package/all'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        Map<String, Package> packagesMap =
        Package.convertDataToPackagesList(data);
        return packagesMap.values.toList(growable: false);
      } else {
        return [];
      }
    }
    catch(e){
      print(e);
      return [];
    }

  }


  purchasePackage(){

  }

  deletePackage(String packageId) async {
    print(packageId);
    try{
      final response = await http.delete(
          Uri.parse('http://localhost:8080/package/delete/${packageId}'));
      if (response.statusCode == 200) {
        print('Data deleted successfully');
      } else {
        print('Failed to delete data: ${response.statusCode}');
      }
    }
    catch(e){
      print(e);
    }
    notifyListeners();
  }

  clearPackageToUpdateData(){
    packageToUpdate = null;
  }

  savePackage(String packageDescription, String coinsOffered, String packageName, String packageID) async {
    Package packageData = Package(packageID: packageID, packageDescription: packageDescription, coinsOffered: coinsOffered, packageName: packageName);
    if(packageToUpdate!=null && packageID==""){
      // package is created new
      await createPackage(packageData);
    }
    else{
      // package is updated
      await updatePackage(packageData);
    }
    clearPackageToUpdateData();
    notifyListeners();
  }

  updatePackage(Package updatedPackage) async {

    final data = {
      "id": updatedPackage.packageID,
      "name": updatedPackage.packageName,
      "description": updatedPackage.packageDescription,
      "coins": updatedPackage.coinsOffered,
    };

    try{
      final response = await http.post(
        Uri.parse('http://localhost:8080/package/edit'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Data updated successfully: $responseData');
      } else {
        print('Failed to update data: ${response.statusCode}');
      }
    }
    catch(e){
      print(e);
    }
  }

  createPackage(Package updatedPackage) async {
    final data = {
      "name": updatedPackage.packageName,
      "description": updatedPackage.packageDescription,
      "coins": updatedPackage.coinsOffered,
    };

    try{
      final response = await http.post(
        Uri.parse('http://localhost:8080/package/add'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Data updated successfully: $responseData');
      } else {
        print('Failed to update data: ${response.statusCode}');
      }
    }
    catch(e){
      print(e);
    }
  }

}