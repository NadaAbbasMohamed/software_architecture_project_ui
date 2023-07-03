import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_arch_project/constants.dart';
import '../../../view_models/student_page_view_model.dart';
import '../../components/buttons.dart';
import '../../components/user_container.dart';

class AdminDataRightSideBar extends StatefulWidget {
  const AdminDataRightSideBar({Key? key}) : super(key: key);

  @override
  State<AdminDataRightSideBar> createState() => _AdminDataRightSideBarState();
}

class _AdminDataRightSideBarState extends State<AdminDataRightSideBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
            decoration: const BoxDecoration(
              color: backgroundBabyBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Consumer<StudentPageViewModel>(
                  builder: (context, studentPageVM, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        UserContainer(
                          text: "Administrator",
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: ChangeUserButton()),
                      ],
                    );
                  }),
            )));
  }

  Widget mainSectionButtons() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        DefaultButton(
          radius: 15,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          width: 250,
          height: 40,
          bgColor: buttonBabyBlue,
          text: 'View Transactions',
          onPressed: () {
            Provider.of<StudentPageViewModel>(context, listen: false)
                .changeSectionToTransaction();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        DefaultButton(
          radius: 15,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          width: 250,
          height: 40,
          bgColor: buttonBabyBlue,
          text: 'View Packages',
          onPressed: () {
            Provider.of<StudentPageViewModel>(context, listen: false)
                .changePageToPackages();
          },
        ),
      ],
    );
  }

  Widget packageSectionButtons() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        DefaultButton(
          radius: 15,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          width: 250,
          height: 40,
          bgColor: buttonBabyBlue,
          text: 'View Transactions',
          onPressed: () {
            Provider.of<StudentPageViewModel>(context, listen: false)
                .changeSectionToTransaction();
          },
        ),
        const SizedBox(height: 320),
        DefaultButton(
          radius: 15,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          width: 250,
          height: 40,
          bgColor: buttonBabyBlue,
          text: 'Back',
          onPressed: () {
            Provider.of<StudentPageViewModel>(context, listen: false)
                .changeSectionToMainPage();
          },
        ),
      ],
    );
  }

  Widget transactionSectionButtons() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        DefaultButton(
          radius: 15,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          width: 250,
          height: 40,
          bgColor: buttonBabyBlue,
          text: 'View Packages',
          onPressed: () {
            Provider.of<StudentPageViewModel>(context, listen: false)
                .changePageToPackages();
          },
        ),
        const SizedBox(height: 320),
        DefaultButton(
          radius: 15,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          width: 250,
          height: 40,
          bgColor: buttonBabyBlue,
          text: 'Back',
          onPressed: () {
            Provider.of<StudentPageViewModel>(context, listen: false)
                .changeSectionToMainPage();
          },
        ),
      ],
    );
  }
}
