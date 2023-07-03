import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_arch_project/view_models/administrator_page_view_model.dart';
import 'package:software_arch_project/view_models/packages_view_model.dart';
import 'package:software_arch_project/view_models/student_page_view_model.dart';
import 'package:software_arch_project/view_models/users_view_model.dart';
import 'package:software_arch_project/view_models/virtual_coins_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot){
        if (snapshot.hasError) {
          return const Center(
            child: Text('تعذر تحميل التطبيق'),
          );
        }
        else{
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) {
                return UsersViewModel();
              }),
              ChangeNotifierProvider(create: (context){
                return VirtualCoinsViewModel();
              }),
              ChangeNotifierProvider(create: (context){
                return StudentPageViewModel();
              }),
              ChangeNotifierProvider(create: (context){
                return PackagesViewModel();
              }),
              ChangeNotifierProvider(create: (context){
                return AdministratorPageViewModel();
              })
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        }
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewModel>(builder: (context, usersVM, child){
      return usersVM.screen;
    });
  }
}
