import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/utils/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List todoTask=[["Make Food" , false],
  ["Get Sleep" , false],
  ["Get a job" , false]]; 
  
  //on Change tapped
  void OnChangedTapped( bool ? value , int index){
    setState(() {
      todoTask[index][1]=! todoTask[index][1];
    });
  }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
         centerTitle: true, // this is all you need
        backgroundColor: Colors.yellow,
        title: Text(
          'TO DO',
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        elevation: 0,
      ),
      body:  ListView.builder(
        itemCount: todoTask.length,
        itemBuilder:(context, index) {
        return TodoList(taskName: todoTask[index][0], taskValue: todoTask[index][1], onChange:(value) => OnChangedTapped(value , index),);
      },)
    );
  }
}
