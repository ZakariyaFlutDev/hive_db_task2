import 'package:flutter/material.dart';
import 'package:hive_db_task2/pages/sign_in_page.dart';
import 'package:hive_db_task2/pages/sign_up_page.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{

  await Hive.initFlutter();
  await Hive.openBox("db_name");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
      routes: {
        SignInPage.id:(context) => SignInPage(),
        SignUpPage.id:(context) => SignUpPage(),

      },
    );
  }
}
