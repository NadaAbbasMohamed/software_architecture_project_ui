import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum StudentPageSections{
  mainPage, transactions, packages
}

class StudentPageViewModel extends ChangeNotifier{
  StudentPageSections currentSection = StudentPageSections.mainPage;

  changeSectionToTransaction(){
    currentSection = StudentPageSections.transactions;
    notifyListeners();
  }

  changeSectionToMainPage(){
    currentSection = StudentPageSections.mainPage;
    notifyListeners();
  }

  changePageToPackages(){
    currentSection = StudentPageSections.packages;
    notifyListeners();
  }

}