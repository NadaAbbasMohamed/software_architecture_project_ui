import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_arch_project/constants.dart';
import 'package:software_arch_project/view_models/administrator_page_view_model.dart';

import '../../view_models/packages_view_model.dart';
import '../../view_models/users_view_model.dart';
import 'buttons.dart';

class PackageContainer extends StatelessWidget {
  double width;
  double height;
  //int packageIndex;
  String packageID;
  String packageDescription;
  String coinsOffered;
  String packageName;


  PackageContainer(
      {required this.height,
      required this.width,
    //  required this.packageIndex,
      required this.packageID,
      required this.packageDescription,
      required this.coinsOffered,
      required this.packageName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: backgroundPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: "Package Name    ",
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: packageName, style: const TextStyle(fontSize: 15))
                    ])),
                Text(
                  "ID: $packageID",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width - 50,
                  child: Text(
                    packageDescription,
                    softWrap: true,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 15,),
                  ),
                ),
                SizedBox(height:7),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Coins Offered    ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  TextSpan(text: coinsOffered, style: TextStyle(fontSize: 15))
                ])),
              ],
            ),
            Consumer<UsersViewModel>(builder: (context, usersVM, child) {
              return usersVM.user == User.student
                  ? DefaultButton(
                      radius: 15,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      width: 150,
                      height: 40,
                      bgColor: buttonPurple,
                      text: 'Purchase',
                      onPressed: () {
                        Provider.of<PackagesViewModel>(context, listen: false)
                            .purchasePackage();
                      },
                    )
                  : usersVM.user == User.administrator
                      ? Column(
                          children: [
                            DefaultButton(
                              radius: 15,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              width: 150,
                              height: 40,
                              bgColor: buttonPurple,
                              text: 'Update',
                              onPressed: () {
                                Provider.of<PackagesViewModel>(context,
                                    listen: false).setPackageDataToUpdate(packageID,packageDescription, coinsOffered, packageName);
                                Provider.of<AdministratorPageViewModel>(context,
                                        listen: false)
                                    .changeSectionToEditSection();
                              },
                            ),
                            SizedBox(width: 10,height: 10,),
                            DefaultButton(
                              radius: 15,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              width: 150,
                              height: 40,
                              bgColor: buttonPurple,
                              text: 'Delete',
                              onPressed: () {
                                Provider.of<PackagesViewModel>(context,
                                        listen: false)
                                    .deletePackage(packageID);
                              },
                            )
                          ],
                        )
                      : const SizedBox(
                          width: 20,
                          height: 20,
                        );
            }),
          ],
        ),
      ),
    );
  }
}
