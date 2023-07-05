import 'package:flutter/cupertino.dart';
import 'package:software_arch_project/screens/administrator_screens/administrator_home.dart';
import '../screens/learner_screens/student_home.dart';

enum User{
  student,
  administrator
}


class UsersViewModel extends ChangeNotifier{

  User user = User.student;
  Widget screen = const StudentHome();

  changeUserToStudent(){
    user = User.student;
    screen = const StudentHome();
    notifyListeners();
  }


  changeUserToAdministrator(){
    user = User.administrator;
    screen = const AdminHome();
    notifyListeners();
  }


}