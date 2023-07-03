import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_arch_project/models/package.dart';
import 'package:software_arch_project/models/transaction.dart';
import 'package:software_arch_project/view_models/packages_view_model.dart';

import '../../view_models/student_page_view_model.dart';
import '../../view_models/virtual_coins_view_model.dart';
import '../components/package_container.dart';
import 'components/new_course_container.dart';
import 'components/new_post_container.dart';
import 'components/sideBar.dart';
import 'components/transaction_container.dart';
import 'components/user_data_right_sidebar.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const StudentSideBar(),
          SizedBox(
            width: 1050,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Consumer<StudentPageViewModel>(
                builder: (context, studentPageVM, child) {
                  return studentPageVM.currentSection ==
                          StudentPageSections.mainPage
                      ? mainSection()
                      : studentPageVM.currentSection ==
                              StudentPageSections.packages
                          ? packageSection()
                          : transactionSection();
                },
              ),
            ),
          ),
          const UserDataRightSideBar(),
        ],
      ),
    );
  }

  Widget mainSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "New Feeds",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        NewPostContainer(),
        Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Recommended Courses",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        NewCourseContainer(),
      ],
    );
  }

  Widget packageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Available Packages",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        Consumer<PackagesViewModel>(builder: (context, packagesVM, child) {
          return FutureBuilder<List<Package>>(
              future: packagesVM.getAllPackages(),
              builder: (context, packagesSnapshot) {
                if (packagesSnapshot.connectionState == ConnectionState.done) {
                  if (packagesSnapshot.hasError) {
                    return const Center(
                      child: Text("error loading"),
                    );
                  } else if (packagesSnapshot.hasData) {}
                  List<Package> packages = packagesSnapshot.data!;

                  return packages.isNotEmpty
                      ? SizedBox(
                          height: 600,
                          width: 600,
                          child: ListView.builder(
                            itemCount: packages.length,
                            itemBuilder: (BuildContext context, int index) {
                              Package packageData = packages[index];
                              return PackageContainer(
                                width: 430,
                                height: 150,
                                packageID: packageData.packageID,
                                //packageIndex: index,
                                packageDescription:
                                    packageData.packageDescription,
                                coinsOffered: packageData.coinsOffered,
                                packageName: packageData.packageName,
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: Text(
                          "No Packages Available",
                          style: TextStyle(color: Colors.grey),
                        ));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        })
      ],
    );
  }

  Widget transactionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Coin Transactions",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        Container(
          width: 1000,
          height: 680,
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
            padding: const EdgeInsets.all(15.0),
            child: Consumer<VirtualCoinsViewModel>(
                builder: (context, packagesVM, child) {
              return FutureBuilder<List<Transaction>>(
                  future: packagesVM.getCoinsTransactions(),
                  builder: (context, transactionsSnapshot) {
                    if (transactionsSnapshot.connectionState ==
                        ConnectionState.done) {
                      if (transactionsSnapshot.hasError) {
                        return const Center(
                          child: Text("error loading"),
                        );
                      } else if (transactionsSnapshot.hasData) {}
                      List<Transaction> transactions = transactionsSnapshot.data!;

                      return transactions.isNotEmpty
                          ? SizedBox(
                              height: 500,
                              width: 600,
                              child: ListView.builder(
                                physics:
                                    const AlwaysScrollableScrollPhysics(), // enable scrolling even if content is smaller than available space
                                itemCount: transactions.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Transaction transactionData =
                                      transactions[index];
                                  return TransactionContainer(
                                    width: 900,
                                    height: 180,
                                    transactionTitle:
                                        transactionData.transactionID,
                                    transactionCoins:
                                        transactionData.transactionCoins,
                                    transactionDate:
                                        transactionData.transactionDate,
                                    transactionDescription:
                                        transactionData.description,
                                    transactionType:
                                        transactionData.transactionType,
                                  );
                                },
                              ),
                            )
                          : const Center(
                              child: Text(
                              "No transactions Made",
                              style: TextStyle(color: Colors.grey),
                            ));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
            }),
          ),
        )
      ],
    );
  }
}
