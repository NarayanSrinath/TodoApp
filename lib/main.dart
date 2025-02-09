import 'package:flutter/material.dart';
import 'package:todoapp/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  // init hive
  await Hive.initFlutter();
  // open a box

  var box =  await  Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
       primarySwatch: Colors.yellow,
          useMaterial3: true,
        ),
        home: const Homepage());
  }
}
