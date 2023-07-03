import 'package:flutter/widgets.dart';
import 'package:software_arch_project/models/package.dart';

enum AdminSections{
  viewPackages,
  editPackage
}

class AdministratorPageViewModel extends ChangeNotifier{
  AdminSections section = AdminSections.viewPackages;

  changeSectionToViewPackages(){
    section = AdminSections.viewPackages;
    notifyListeners();
  }

  changeSectionToEditSection(){
    section = AdminSections.editPackage;
    notifyListeners();
  }

}