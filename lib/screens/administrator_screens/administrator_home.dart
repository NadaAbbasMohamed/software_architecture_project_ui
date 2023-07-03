import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/package.dart';
import '../../view_models/administrator_page_view_model.dart';
import '../../view_models/packages_view_model.dart';
import '../components/buttons.dart';
import '../components/package_container.dart';
import 'components/admin_data_right_sidebar.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  TextEditingController packageDescription = TextEditingController();
  TextEditingController coinsOffered = TextEditingController();
  TextEditingController packageName = TextEditingController();
  String packageID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SizedBox(
            width: 1210,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Consumer<AdministratorPageViewModel>(
                builder: (context, adminPageVM, child) {
                  return adminPageVM.section == AdminSections.viewPackages
                      ? viewPackagesSection()
                      : adminPageVM.section == AdminSections.editPackage
                          ? createPackageSection()
                          : const SizedBox(
                              width: 10,
                              height: 10,
                            );
                },
              ),
            ),
          ),
          const AdminDataRightSideBar()
        ],
      ),
    );
  }

  Widget viewPackagesSection() {
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
                  } else if (packagesSnapshot.hasData) {
                    List<Package> packages = packagesSnapshot.data!;

                    return packages.isNotEmpty?
                    SizedBox(
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
                            packageDescription: packageData.packageDescription,
                            coinsOffered: packageData.coinsOffered,
                            packageName: packageData.packageName,
                          );
                        },
                      ),
                    ):
                    const Center(
                        child: Text(
                          "No Packages Created",
                          style: TextStyle(color: Colors.grey),
                        ));
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        }),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: DefaultButton(
            radius: 15,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            width: 250,
            height: 50,
            bgColor: buttonPurple,
            text: 'Create New Package',
            onPressed: () async {
              Provider.of<AdministratorPageViewModel>(context, listen: false)
                  .changeSectionToEditSection();
            },
          ),
        ),
      ],
    );
  }

  Widget createPackageSection() {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Update/ Create Package",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        Consumer<PackagesViewModel>(builder: (context, packagesVM, child) {
          if (packagesVM.packageToUpdate != null) {
            packageDescription.text = packagesVM.packageToUpdate!.packageDescription;
            coinsOffered.text = packagesVM.packageToUpdate!.coinsOffered;
            packageName.text = packagesVM.packageToUpdate!.packageName;
            packageID = packagesVM.packageToUpdate!.packageID;
          }

          return Container(
              width: 1100,
              height: 350,
              decoration: BoxDecoration(
                color: backgroundPurple,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Package Data",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    dataField("Package Name", packageName, width: 948),
                    dataField("Coins Offered", coinsOffered, width: 955),
                    dataField("Package Description", packageDescription, width:910),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: DefaultButton(
                            radius: 15,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            width: 250,
                            height: 50,
                            bgColor: buttonPurple,
                            text: 'Save',
                            onPressed: () async {
                              await packagesVM.savePackage(packageDescription.text,
                                  coinsOffered.text, packageName.text, packageID);
                              Provider.of<AdministratorPageViewModel>(context,
                                      listen: false)
                                  .changeSectionToViewPackages();
                              packageDescription.text = "";
                              coinsOffered.text = "";
                              packageName.text = "";
                              packageID = "";

                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        }),
      ],
    );
  }

  Widget dataField(String text, TextEditingController controller, {double width = 300, double height = 50}) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom:8, left:8),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          Container(
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
            width: width,
            height: height,
            child: TextField(
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
